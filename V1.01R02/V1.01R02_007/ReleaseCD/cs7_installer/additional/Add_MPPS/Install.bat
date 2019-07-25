@ECHO OFF
REM ========================================================================================================
REM   Install.bat 
REM
REM     Date: 2011/05/25
REM
REM     For MPPS Data Accessor bug fix 
REM ========================================================================================================

@ECHO ON

REM ----------------------------------------
REM MPPS Data Accessor
REM ----------------------------------------
SET TARGET_DIR=Bin\Platform\Applications\Plugins\DataAccessors\MppsDataAccessor
XCOPY .\%TARGET_DIR%\MppsDataAccessor.dll C:\KonicaMinolta\Console\%TARGET_DIR%\ /R /Y
XCOPY .\%TARGET_DIR%\MppsDataAccessor.pdb C:\KonicaMinolta\Console\%TARGET_DIR%\ /R /Y
XCOPY .\%TARGET_DIR%\CodeValueSetting.xml C:\KonicaMinolta\Console\%TARGET_DIR%\ /R /Y



