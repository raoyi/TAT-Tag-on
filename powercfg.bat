@echo off
:UACandSyspropChk
start UserAccountControlSettings.exe
rundll32.exe shell32.dll,Control_RunDLL sysdm.cpl,,3

:powercfg
powercfg /x monitor-timeout-ac 0
powercfg /x monitor-timeout-dc 0
powercfg /x disk-timeout-ac 0
powercfg /x disk-timeout-dc 0
powercfg /x standby-timeout-ac 0
powercfg /x standby-timeout-dc 0
powercfg /x hibernate-timeout-ac 0
powercfg /x hibernate-timeout-dc 0

echo press any key to continue...
pause > nul
