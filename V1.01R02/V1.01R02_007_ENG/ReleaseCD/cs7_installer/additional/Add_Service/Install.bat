@ECHO OFF
REM ========================================================================================================
REM   Install.bat 
REM
REM     Date: 2011/05/26
REM
REM     For service tool bug fix 
REM ========================================================================================================

@ECHO ON

REM ----------------------------------------
REM Equipment Information Tool (Launch)
REM ----------------------------------------
SET TARGET_DIR=Bin\Platform\Applications\Plugins\DomainExtenders\EquipmentInfoToolDomainExtender
XCOPY .\%TARGET_DIR%\EquipmentInfoToolDomainExtender.dll C:\KonicaMinolta\Console\%TARGET_DIR%\ /R /Y
XCOPY .\%TARGET_DIR%\EquipmentInfoToolDomainExtender.pdb C:\KonicaMinolta\Console\%TARGET_DIR%\ /R /Y
XCOPY .\%TARGET_DIR%\EquipmentInfoToolDomainExtender.XML C:\KonicaMinolta\Console\%TARGET_DIR%\ /R /Y

REM ----------------------------------------
REM Edit Select Menu (Operator)
REM ----------------------------------------
SET TARGET_DIR=Bin\Platform\Applications\Plugins\DomainExtenders\EditSelectMenuDomainExtender
XCOPY .\%TARGET_DIR%\EditSelectMenuDomainExtender.dll C:\KonicaMinolta\Console\%TARGET_DIR%\ /R /Y
XCOPY .\%TARGET_DIR%\DisplaySetting.xml C:\KonicaMinolta\Console\%TARGET_DIR%\ /R /Y

REM ----------------------------------------
REM Screen Tool (Disable Display Output Button)
REM ----------------------------------------
SET TARGET_DIR=Bin\Platform\Applications\Plugins\DomainExtenders\ScreenSettingDomainExtender
XCOPY .\%TARGET_DIR%\ScreenSettingDomainExtender.dll C:\KonicaMinolta\Console\%TARGET_DIR%\ /R /Y

REM ----------------------------------------
REM Stamp Tool (Detail Screen Launch)
REM ----------------------------------------
SET TARGET_DIR=Bin\Platform\Applications\Plugins\DomainExtenders\StampDomainExtender
XCOPY .\%TARGET_DIR%\StampDomainExtender.dll C:\KonicaMinolta\Console\%TARGET_DIR%\ /R /Y

REM ----------------------------------------
REM CS-7 Tool (Disable Screen Saver Setting)
REM ----------------------------------------
SET TARGET_DIR=Bin\Platform\Applications\Plugins\DomainExtenders\SystemInfoSettingDomainExtender
XCOPY .\%TARGET_DIR%\SystemInfoSettingDomainExtender.dll C:\KonicaMinolta\Console\%TARGET_DIR%\ /R /Y

REM ----------------------------------------
REM Patient User Tool (Fix Languge support issue)
REM ----------------------------------------
SET TARGET_DIR=Bin\Platform\Applications\Plugins\DomainExtenders\PatientDBDomainExtender
XCOPY .\%TARGET_DIR%\PatientDBDomainExtender.dll C:\KonicaMinolta\Console\%TARGET_DIR%\ /R /Y

REM ----------------------------------------
REM Language files
REM ----------------------------------------
SET TARGET_DIR=Config\System\Platform\System\Language
XCOPY .\%TARGET_DIR% C:\KonicaMinolta\Console\%TARGET_DIR% /S /R /Y

REM ----------------------------------------
REM R2 Update flag files
REM ----------------------------------------
DEL /F /Q C:\KonicaMinolta\Console\Data\R2\Update\Update.flag


