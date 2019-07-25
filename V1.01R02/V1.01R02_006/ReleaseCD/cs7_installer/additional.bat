@echo off
color f2
setlocal

@echo ----------------------------------.
@echo    Update for CS-7 V1.01R01       .
@echo    2011.05.11                     .
@echo ----------------------------------.
SET/P CHECK="[Y:INSTALL][N:EXIT] : "
IF %CHECK%==Y GOTO :DOTASK
IF %CHECK%==y GOTO :DOTASK
GOTO END

:DOTASK

@echo [setting postgres-8.4.2-1]
sc config postgres-8.4.2-1 start= demand


:END
endlocal
pause