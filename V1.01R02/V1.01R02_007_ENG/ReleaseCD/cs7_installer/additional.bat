@echo off
color f2
setlocal

@echo ----------------------------------.
@echo    Update for CS-7 V1.01R02       .
@echo    2011.05.25                     .
@echo ----------------------------------.
SET/P CHECK="[Y:INSTALL][N:EXIT] : "
IF %CHECK%==Y GOTO :DOTASK
IF %CHECK%==y GOTO :DOTASK
GOTO END

:DOTASK

@echo [setting postgres-8.4.2-1]
sc config postgres-8.4.2-1 start= demand

@ECHO OFF

REM ----------------------------------------
REM add
REM ----------------------------------------

@ECHO OFF

cd additional/Add_MPPS
call Install.bat

cd ../Add_List
call OrderListDomain_Install_ForUSA.bat

cd ../Add_OrderData
call OrderDataVersion_Up.bat

cd ../Add_Localize
call updatelocalize.bat

cd ../Add_Service
call Install.bat

cd ../Add_Service2
call Install.bat

:END
endlocal
pause

