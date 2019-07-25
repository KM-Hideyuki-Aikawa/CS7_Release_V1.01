@echo off
color f2
setlocal

@rem /////////////////////////////////////////////////////////////////
@rem Version履歴
@rem 2011.03.03 V1.00R00T00 新規作成
@rem 2011.03.09 V1.00R00T01 ログ出力，IISロギング設定修正
@rem /////////////////////////////////////////////////////////////////

set DEBUG=0
@rem set log="C:\Users\konicaminolta\Desktop\%COMPUTERNAME%_%~n0.log"
set log=nul
set SCRIPT=%~0
for /f "delims=\ tokens=*" %%z in ("%SCRIPT%") do (
 set CUR_DIR=%%~dpz
)
cd /d "%CUR_DIR%"
if "%DEBUG%"=="1" (
	@echo %CD%
	pause
)
cls
@echo ----------------------------------
@echo    Update Windows Setting for CS-7
@echo    MTP向け（国内）hp 8100Elite向け
@echo ----------------------------------
SET/P CHECK="[Y:INSTALL][N:EXIT] : "
IF %CHECK%==Y GOTO :DOTASK
IF %CHECK%==y GOTO :DOTASK
GOTO END

:DOTASK
@echo [Start %~n0%~x0 %date%]>%log%
@rem ---------------------------------------------
@rem Run as Administrator
@rem http://scripting.cocolog-nifty.com/blog/2010/01/post-f725.html
@rem 
@rem High   管理者として実行
@rem Medium 標準ユーザ
@rem Low   「整合性レベル：低」 (「保護モード：有効」)
@echo 管理者権限の確認
for /f "tokens=3 delims=\ " %%i in ('whoami /groups^|find "Mandatory"') do set LEVEL=%%i
echo %LEVEL%
if not %LEVEL%==High (
 echo [This action must be done by Administrator mode]
 goto END
)
cd .
if "%DEBUG%"=="1" (
	echo ERRORLEVEL=%ERRORLEVEL%
	echo -------------------------
	pause
)

@rem ---------------------------------------------
@echo OSを確認
@rem ---------------------------------------------
VER | find "XP" > nul 
IF not errorlevel 1 (
	SET OS_TYPE=XP
	GOTO END
) ELSE (
	SET OS_TYPE=Win7
)
@echo OS Type=%OS_TYPE%>>%log%
cd .
if "%DEBUG%"=="1" (
	echo ERRORLEVEL=%ERRORLEVEL%
	echo -------------------------
	pause
)

@rem ---------------------------------------------
@echo ログオンユーザーの確認
@rem ---------------------------------------------
set logon_user=konicaminolta
set logon_password=csx
for /f "usebackq tokens=*" %%i in (`whoami`) do @set RESULT=%%i
echo %RESULT%
echo %computername%\%logon_user% 
if /i "%RESULT%" neq "%computername%\%logon_user%" (
 @echo Logon User must be konicaminolta
 goto END
)
if "%DEBUG%"=="1" (
	echo ERRORLEVEL=%ERRORLEVEL%
	echo -------------------------
	pause
)


@rem ---------------------------------------------
@echo IPアドレスの設定
@echo Set IP Address 192.168.20.90
@echo Set Subnet mask 255.255.255.0
@rem ---------------------------------------------
 netsh interface ip set address "ローカル エリア接続" static 192.168.20.90 255.255.255.0
)
if "%DEBUG%"=="1" (
	echo ERRORLEVEL=%ERRORLEVEL%
	echo -------------------------
	pause
)

@rem ---------------------------------------------
@echo Administratorユーザーのパスワード設定
@rem ---------------------------------------------
net user Administrator csx
if "%DEBUG%"=="1" (
	echo ERRORLEVEL=%ERRORLEVEL%
	echo -------------------------
	pause
)

@rem ---------------------------------------------
@echo 自動ログインの設定
@rem ---------------------------------------------
%windir%\System32\reg.exe ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v DefaultUserName /t REG_SZ /d %logon_user% /f
%windir%\System32\reg.exe ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v DefaultPassword /t REG_SZ /d %logon_password% /f
%windir%\System32\reg.exe ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v AutoAdminLogon /t REG_SZ /d 1 /f
if "%DEBUG%"=="1" (
	echo ERRORLEVEL=%ERRORLEVEL%
	echo -------------------------
	pause
)
%windir%\System32\reg.exe QUERY "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v DefaultUserName>>%log%
%windir%\System32\reg.exe QUERY "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v DefaultPassword>>%log%
%windir%\System32\reg.exe QUERY "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v AutoAdminLogon>>%log%


@rem ---------------------------------------------
@echo firewallの無効化
@rem ---------------------------------------------
if "%OS_TYPE%"=="XP" (
 netsh firewall set opmode mode = disable
else (
 netsh advfirewall set allprofiles state off 
)
if "%DEBUG%"=="1" (
	echo ERRORLEVEL=%ERRORLEVEL%
	echo -------------------------
	pause
)

@rem ---------------------------------------------
@echo Windows Updateの無効化
@rem ---------------------------------------------
%windir%\System32\reg.exe ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update" /v AUOptions /t REG_DWORD /d 1 /f
if "%DEBUG%"=="1" (
	echo ERRORLEVEL=%ERRORLEVEL%
	echo -------------------------
	pause
)
%windir%\System32\reg.exe QUERY "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update" /v AUOptions>>%log%

@rem ---------------------------------------------
@echo 縮小版にファイル アイコンを表示する
@rem ---------------------------------------------
%windir%\System32\reg.exe ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v ShowTypeOverlay /t REG_DWORD /d 0 /f
if "%DEBUG%"=="1" (
	echo ERRORLEVEL=%ERRORLEVEL%
	echo -------------------------
	pause
)
%windir%\System32\reg.exe QUERY "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v ShowTypeOverlay>>%log%

@rem ---------------------------------------------
@echo IISの設定変更
@rem ---------------------------------------------
%windir%\system32\inetsrv\appcmd.exe set config -section:system.applicationHost/applicationPools /applicationPoolDefaults.processModel.IdentityType:LocalSystem /commit:apphost /debug | find "applicationPoolDefaults.processModel.IdentityType:LocalSystem">nul
if not "%ERRORLEVEL%"=="0" (
 echo Update "applicationPoolDefaults.processModel.IdentityType:LocalSystem" failed.
 pause
 cd .
)

%windir%\system32\inetsrv\appcmd.exe set config "Default Web Site" -section:httpLogging /dontLog:True /commit:apphost /debug | find "dontLog:True">nul
if not "%ERRORLEVEL%"=="0" (
 echo Update "dontLog:False" failed.
 pause
 cd .
)

if "%DEBUG%"=="1" (
	echo ERRORLEVEL=%ERRORLEVEL%
	echo -------------------------
	pause
)

%windir%\system32\inetsrv\appcmd list config /section:system.applicationHost/applicationPools>>%log%
%windir%\system32\inetsrv\appcmd list config "Default Web Site/" /section:httpLogging>>%log%

goto REBOOT_MESSAGE

:REBOOT_MESSAGE
echo 設定を有効にするため再起動してください。
:END
endlocal
pause