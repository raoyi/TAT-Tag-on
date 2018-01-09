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
reg export HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Lenovo\MachineInfo MachineInfo.txt
find /i "AuditDate" MachineInfo.txt
goto result

:result
if %errorlevel% equ 0 (
  @echo off 
  color 17 
  echo.
  echo           *********************************************************************************
  echo           **                                                                             **
  echo           **              Audit Date is exist, please check the value...                 **
  echo           **                                                                             **
  echo           *********************************************************************************  
  echo.
  set returncode=1

) else (
   @echo off 
  color 47
  echo.
  echo           *********************************************************************************
  echo           **                                                                             **
  echo           **        FAILED! FAILED !FAILED! Audit Date not Found!!!                      **
  echo           **                                                                             **
  echo           *********************************************************************************  
  echo.
)

if exist "%curpath%\automode.tag" goto end

:openlog
echo.
echo.
echo           Press "Y" to open MachineInfo.txt, Press "Enter" to exit

set /p a=
if "%a%"=="Y" goto open
if "%a%"=="y" goto open
goto end
 
:open
notepad MachineInfo.txt
   
:end
del MachineInfo.txt
exit %returncode%
