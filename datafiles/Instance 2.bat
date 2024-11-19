SET PROJECTNAME=GameMakerWebSocket

:: -----------------------------------------------------------------------------------------------------
@echo off
SET RUNNER_PATH=C:\ProgramData\GameMakerStudio2\Cache\runtimes
SET PLATFORM=windows
FOR /F "DELIMS=" %%F IN ('DIR /B /OD /TW Y:\%PROJECTNAME%*') DO (SET FILE=%%F)
FOR /F "DELIMS=" %%I IN ('DIR /AD /B /OD /TC %RUNNER_PATH%') DO SET LATEST_VERSION=%%I
START C:\ProgramData\GameMakerStudio2\Cache\runtimes\%LATEST_VERSION%\%PLATFORM%\Runner.exe -game Y:\%FILE%\%PROJECTNAME%.win