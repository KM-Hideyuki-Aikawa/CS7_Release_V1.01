

@ECHO OFF
REM ========================================================================================================
REM   Install.bat 
REM   For service tool
REM ========================================================================================================

REM --------------------------------------------------------------------------------
REM Exam Tag Tool & Backup Tool & Restore Tool & Initialization Tool
REM --------------------------------------------------------------------------------

@ECHO OFF
XCOPY .\Bin C:\KonicaMinolta\Console\Bin\ /R /E  /I /H /Y


XCOPY .\Config C:\KonicaMinolta\Console\Config\ /R /E  /I /H /Y


copy .\enable.lnk "C:\Users\Administrator\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\"
copy .\enable.lnk "C:\Users\konicaminolta\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\"