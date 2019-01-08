if "%LIBRARY_PREFIX%" == "" (
  echo "LIBRARY_PREFIX env var not set!"
  exit 1
)

:: Copy py2-specific wrapper scripts
:: TODO: Add more binary wrappers and tools?
if not exist %LIBRARY_PREFIX%\bin mkdir %LIBRARY_PREFIX%\bin

copy %RECIPE_DIR%\python2.bat %LIBRARY_PREFIX%\bin\python2.bat || exit 1
copy %RECIPE_DIR%\pythonw2.bat %LIBRARY_PREFIX%\bin\pythonw2.bat || exit 1
copy %RECIPE_DIR%\pip2.bat %LIBRARY_PREFIX%\bin\pip2.bat || exit 1

:: Prefix mirrors OSGeo4W layout, so .bat wrappers/envs kind of work out-of-the-box
set "PY2_PREFIX=%LIBRARY_PREFIX%\apps\Python27"

if exist %PY2_PREFIX% rmdir /s /q %PY2_PREFIX%
if %errorlevel% neq 0 exit /b %errorlevel%

:: Add 'conda' so that the env can be activated, if necessary
conda create -y --copy --mkdir --no-default-packages -p %PY2_PREFIX% -c conda-forge --override-channels python=2.7 conda
if %errorlevel% neq 0 exit /b %errorlevel%

exit 0
