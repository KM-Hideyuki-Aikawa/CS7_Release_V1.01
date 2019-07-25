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
@echo ------------------------------
@echo Install PostgreSQL 8.4
@echo ------------------------------
SET/P CHECK="[Y:INSTALL][N:EXIT] : "
IF %CHECK%==Y GOTO DOTASK
IF %CHECK%==y GOTO DOTASK
GOTO END

:DOTASK
postgresql_setup.exe --superaccount postgres --superpassword postgres --serviceaccount postgres --servicepassword Password1*2*3 --serverport 5432 --mode unattended --debugtrace %JM_ROOT_WIN%\JMInstall.Log --servicename postgres-8.4.2-1 --prefix "%ProgramFiles%\PostgreSQL\8.4" --datadir %JM_ROOT_WIN%\Data --installer-language en --install_runtimes 0 --install_plpgsql 1 --create_shortcuts 0 --unattendedmodeui none

@echo START=%ST_TIME%
@echo END=%TIME%

if /i "%1" equ "install" goto END
pause
:END
