@echo off
if exist C:\windows\csup.txt goto show
if not exist C:\windows\csup.txt goto fail

:show
::color 27
echo Text in C:\windows\csup.txt file is:
type C:\windows\csup.txt
pause > nul
goto end

:fail
color 47
echo The csup file is not exist!!
pause > nul

:end