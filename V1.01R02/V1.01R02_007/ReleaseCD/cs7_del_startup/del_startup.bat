@echo off
color f2

set ALLUSER_DESKTOP=C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Startup
set KMMG_DESKTOP=C:\Users\konicaminolta\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup

@echo -------------------------------------------------------------------------------.
@echo      【スタートアップを削除します】                                            .
@echo                                                                                .
@echo -----^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^-------------------------------.

SET/P CHECK="[Y:Update Start Up] [N:EXIT] [%CHECK%]:"
IF /i !CHECK! == Y GOTO TASK
IF /i !CHECK! == y GOTO TASK
IF /i !CHECK! == N GOTO END

:TASK
if exist "%ALLUSER_DESKTOP%\CS-7startup.lnk" (
 del /s /q "%ALLUSER_DESKTOP%\CS-7startup.lnk"
)

if exist "%ALLUSER_DESKTOP%\CS-7Startup.bat" (
 del /s /q "%ALLUSER_DESKTOP%\CS-7Startup.bat"
)

if exist "%ALLUSER_DESKTOP%\SysLoader.lnk" (
 del /s /q "%ALLUSER_DESKTOP%\SysLoader.lnk"
)

if exist "%KMMG_DESKTOP%\CS-7Startup.lnk" (
 del /s /q "%KMMG_DESKTOP%\CS-7Startup.lnk"
)

if exist "%KMMG_DESKTOP%\CS-7Startup.bat" (
 del /s /q "%KMMG_DESKTOP%\CS-7Startup.bat"
)

if exist "%KMMG_DESKTOP%\SysLoader.lnk" (
 del /s /q "%KMMG_DESKTOP%\SysLoader.lnk"
)

@rem ----- desktop
if exist "C:\Users\Public\Desktop\CS-7startup.lnk" (
 del /s /q "C:\Users\Public\Desktop\CS-7startup.lnk"
)

if exist "C:\Users\Public\Desktop\CS-7close.lnk" (
 del /s /q "C:\Users\Public\Desktop\CS-7close.lnk"
)


:END
pause