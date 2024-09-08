@echo off
set "appname=Clash for Windows"
set "apppath=C:\MyLinkHome\clash"

echo Finding %appname%...
for /f "tokens=4" %%a in ('tasklist ^| find /I "%appname%"') do (
    echo Stopping ID %%a...
    taskkill /F /PID %%a
)

echo Restarting %appname%...

powershell -Command "Start-Process %apppath% -WindowStyle Hidden"
start "" "%apppath%"
timeout /t 5

echo Complete...
exit

@REM pause
