@echo off
color f2

SET DRIVE=%~dp0
@rem @echo %DRIVE%

set CS7_ROOT_DIR=C:\Konicaminolta
set JM_ROOT_WIN=%CS7_ROOT_DIR%\JM

@echo ------------------------------
@echo Install Middleware
@echo ------------------------------
SET/P CHECK="[Y:INSTALL][N:EXIT] : "
IF %CHECK%==Y GOTO DOTASK
IF %CHECK%==y GOTO DOTASK
GOTO END

:DOTASK
set ST_TIME=%TIME%

for /F "delims=" %%s in ('cscript //Nologo "%CD%\UTILS\SpecialFolder.vbs" AllUsersDesktop') do set AllUsersDesktop=%%s
for /F "delims=" %%s in ('cscript //Nologo "%CD%\UTILS\SpecialFolder.vbs" Desktop') do set Desktop=%%s

@rem ///////////////////////////////////////////////////////
@echo [Install dotnet4.0]
cd /d %DRIVE%dotnet4.0
dotNetFx40_Full_x86_x64.exe /norestart /passive
cd /d %DRIVE%
@rem ///////////////////////////////////////////////////////
@rem -------------------------------------------------------
@rem ///////////////////////////////////////////////////////
@echo [Adobe Reader 9.3.4]
cd /d %DRIVE%adobe\9.3.4\enu
AdbeRdr934_en_US.exe /sPB /rs /rps /l
IF EXIST "%AllUsersDesktop%\Adobe Reader 9.lnk" DEL /S /Q "%AllUsersDesktop%\Adobe Reader 9.lnk"
IF EXIST "%AllUsersDesktop%\Adobe Reader9.lnk" DEL /S /Q "%AllUsersDesktop%\Adobe Reader9.lnk"
IF EXIST "%Desktop%\Adobe Reader 9.lnk" DEL /S /Q "%Desktop%\Adobe Reader 9.lnk"
IF EXIST "%Desktop%\Adobe Reader9.lnk" DEL /S /Q "%Desktop%\Adobe Reader9.lnk"
cd /d %DRIVE%
@rem ///////////////////////////////////////////////////////
@rem -------------------------------------------------------
@rem ///////////////////////////////////////////////////////
@echo [Adobe Flash]
cd /d %DRIVE%adobe\Flash
install_flash_player_ax.exe /install
cd /d %DRIVE%
@rem ///////////////////////////////////////////////////////
@rem -------------------------------------------------------
@rem ///////////////////////////////////////////////////////
@echo [PostgreSQL8.4]
cd /d %DRIVE%PostgreSQL8.4
postgresql_setup.exe --superaccount postgres --superpassword postgres --serviceaccount postgres --servicepassword Password1*2*3 --serverport 5432 --mode unattended --debugtrace %JM_ROOT_WIN%\JMInstall.Log --servicename postgres-8.4.2-1 --prefix "%ProgramFiles%\PostgreSQL\8.4" --datadir %JM_ROOT_WIN%\Data --installer-language en --install_runtimes 0 --install_plpgsql 1 --create_shortcuts 0 --unattendedmodeui none
cd /d %DRIVE%

@rem ///////////////////////////////////////////////////////
@rem -------------------------------------------------------
@rem ///////////////////////////////////////////////////////
@echo [Install vc2008runtime]
cd /d %DRIVE%vc2008runtime
vcredist_x86.exe /q
cd /d %DRIVE%

@rem ///////////////////////////////////////////////////////
@rem -------------------------------------------------------
@rem ///////////////////////////////////////////////////////
@echo [Install vc2010runtime]
cd /d %DRIVE%vc2010runtime
vcredist_x86.exe /norestart /passive
cd /d %DRIVE%
@rem ///////////////////////////////////////////////////////
@rem -------------------------------------------------------
@rem ///////////////////////////////////////////////////////
@echo -----------------------------------
@echo Install certification...
@echo -----------------------------------
cd /d %DRIVE%KIMCertificate
certmgr -add -c UniteaCertKey.cer -s -r localMachine root
certmgr -add -c UniteaCertKey.cer -s -r localMachine TrustedPublisher
certmgr -add -c cacert.pem -s -r  localMachine root
@rem certmgr -add -c cacert.pem -s -r  localMachine TrustedPublisher

cd /d %DRIVE%
@rem ///////////////////////////////////////////////////////
@rem -------------------------------------------------------
@rem ///////////////////////////////////////////////////////

@echo START=%ST_TIME%
@echo END=%TIME%

pause
:END
