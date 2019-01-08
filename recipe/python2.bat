@echo off

setlocal

for %%a in (%~dp0\..) do set LIBRARY_PREFIX=%%~fa

SET PYTHONHOME=%LIBRARY_PREFIX%\apps\Python27
PATH %PYTHONHOME%\Scripts;%PATH%

"%PYTHONHOME%\python.exe" %*

endlocal