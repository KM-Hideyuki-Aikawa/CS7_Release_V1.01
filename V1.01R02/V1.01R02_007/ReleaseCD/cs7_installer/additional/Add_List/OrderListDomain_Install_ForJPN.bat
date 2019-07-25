@ECHO OFF
REM ========================================================================================================
REM   OrderListDomain_Install_ForJPN.bat 
REM
REM     Date: 2011/05/25
REM
REM     For OrderListDomain bug fix 
REM ========================================================================================================

REM ----------------------------------------
REM PropertyAreaPatientInfoDomainExtender
REM ----------------------------------------
SET TARGET_DIR=Config\System\Platform\System\PluginSetting\PropertyAreaPatientInfoDomainExtender

XCOPY .\%TARGET_DIR%\PatientInfo.xml C:\KonicaMinolta\Console\%TARGET_DIR%\ /R /Y

REM ----------------------------------------
REM PatientRegistrationDomainExtender
REM ----------------------------------------
SET TARGET_DIR=Config\System\Platform\System\PluginSetting\PatientRegistrationDomainExtender

XCOPY .\%TARGET_DIR%\PatientRegistration_PatientInfo.xml C:\KonicaMinolta\Console\%TARGET_DIR%\ /R /Y
XCOPY .\%TARGET_DIR%\SearchListItemInfo.xml C:\KonicaMinolta\Console\%TARGET_DIR%\ /R /Y

@ECHO ON
