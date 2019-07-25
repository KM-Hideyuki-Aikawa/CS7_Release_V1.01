@echo off
color f2

set CS7_ROOT_DIR=C:\Konicaminolta
set JM_ROOT_WIN=%CS7_ROOT_DIR%\JM
set ST_TIME=%TIME%
@rem -----------------------------------------------------------------
@rem 第１引数がinstallの場合には停止せずにインストール
@rem http://msdn.microsoft.com/ja-jp/library/ee942965.aspx
@rem -----------------------------------------------------------------
if /i "%1" equ "install" goto DOTASK
cls
@echo --------------------------------------------
@echo Install PostgreSQL 8.4 , VC2010 Runtime
@echo --------------------------------------------
SET/P CHECK="[Y:INSTALL][N:EXIT] : "
IF %CHECK%==Y GOTO DOTASK
IF %CHECK%==y GOTO DOTASK
GOTO END

:DOTASK
cd PostgreSQL8.4
call install.bat install
cd ..
cd vc2010runtime
call install.bat install
cd ..
@echo START=%ST_TIME%
@echo END=%TIME%

if /i "%1" equ "install" goto END
pause
:END
