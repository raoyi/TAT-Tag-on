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
run_cmd.exe "control printers"

:end
exit
