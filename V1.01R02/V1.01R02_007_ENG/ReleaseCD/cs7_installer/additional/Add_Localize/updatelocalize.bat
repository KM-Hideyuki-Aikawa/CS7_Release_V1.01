@echo off

SET TARGET_PF_DIR=Config\System\Platform\System\Language
SET TARGET_SL_DIR=Config\System\SysLoader\Language

XCOPY .\Localize\%TARGET_PF_DIR%\* C:\KonicaMinolta\Console\%TARGET_PF_DIR%\ /S /R /Y

XCOPY .\Localize\%TARGET_SL_DIR%\* C:\KonicaMinolta\Console\%TARGET_SL_DIR%\ /S /R /Y

