@echo off
if "%~1"=="" (
   echo.
   echo    Usage: %0 COMMAND ...
   echo.
   echo    Execute COMMAND with HighPerformance powerplan.
   echo    Once COMMAND is finished, switch back to Balanced.
   echo.
   echo    For the time being, doesn't support detecting if another
   echo    process is being executed in this panner.
   echo.
   echo    If you need other power plans than the "balanced"
   echo    and "high performance" plans, change the UIDs in the 
   echo    script to a value as obtained by running
   echo.
   echo    ^ ^ ^ ^ POWERCFG /LIST
   echo.
   exit /b 1
)

setlocal
set high=8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c
set balanced=381b4222-f694-41f0-9685-ff5bb260df2e
echo %0^> %* >&2
call powercfg.exe -setactive %high%
call %*
set command_errorlevel=%errorlevel%
call powercfg.exe -setactive %balanced%
endlocal
exit /b %command_errorlevel%
