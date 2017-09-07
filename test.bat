@echo off
:openwindows
UserAccountControlSettings.exe
start rundll32.exe shell32.dll,Control_RunDLL sysdm.cpl,,3
echo 1.press 3th setting
echo 2.uncheck 4th check-box
echo 3.check the last check-box
echo.
echo press any key to continue...
pause > nul

:BadReturn
findstr /i /c:"bad return" C:\Windows\modules.log
if %errorlevel% equ 0 (
  echo test case 01070 fail
  notepad C:\Windows\modules.log
  echo press any key to continue...
  pause > nul
)else echo test case 01070 pass
echo.
echo press any key to continue...
pause > nul

:eventviwer
start eventvwr.msc
echo 1.check Application Log
echo 2.check System Log
echo 3.clear Log(on the right 4th)
echo then test case 02030 pass
echo.
echo press any key to continue...
pause > nul

:LenovoAuditDate
start regedit.exe
echo 1.path: HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Lenovo\MachineInfo
echo 2.check the value of "AuditDate" key
echo then test case 02042 pass
echo.
echo press any key to continue...
pause > nul

:CFolderCheck
start \
echo Make sure there is no any useless and redundant folders in Windows (C:).
echo then test case 02050 pass
echo.
echo press any key to continue...
pause > nul

:Winver
start winver.exe
echo check OS version and Licese Terms
echo then test case 02060 pass
echo.
echo press any key to continue...
pause > nul

:DeviceManager
start devmgmt.msc
echo check there is no yellow bang