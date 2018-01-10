set returncode=0
set curpath=%cd%\
echo %cd%\ >path.txt
findstr /i /c:"tools" path.txt
if %errorlevel% equ 1 set curpath=%cd%\tools\
del path.txt

cd "%curpath%"

@echo off
ver | find "6.1." > NUL &&  goto win7
ver | find "6.3." > NUL &&  goto win8
ver | find "10.0." > NUL &&  goto win10

:Win7
goto end

:Win8
goto end

:Win10
if exist C:\windows\csup.txt errorlevel 0
if not exist C:\windows\csup.txt errorlevel 1
goto result

:result
if %errorlevel% equ 0 (
  @echo off 
  set /p csup=<c:\Windows\csup.txt
  color 17 
  echo.
  echo           *********************************************************************************
  echo           **                                                                             **
  echo           **                      csup.txt content: %csup%                               **
  echo           **                                                                             **
  echo           *********************************************************************************  
  echo.
  set returncode=1
  pause > nul

) else (
   @echo off 
  color 47
  echo.
  echo           *********************************************************************************
  echo           **                                                                             **
  echo           **           FAILED! FAILED! FAILED! csup.txt is not exist!!!                  **
  echo           **                                                                             **
  echo           *********************************************************************************  
  echo.
  pause > nul
)

if exist "%curpath%\automode.tag" goto end

:end
exit %returncode%
