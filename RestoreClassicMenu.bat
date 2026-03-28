@echo off

echo =========================================
echo Windows 11 Context Menu Toggle
echo 1. Enable Classic Context Menu
echo 2. Revert to New Context Menu
echo 3. Exit
echo =========================================
set /p choice="Enter your choice (1-3): "

if "%choice%"=="1" goto EnableClassic
if "%choice%"=="2" goto RevertNew
if "%choice%"=="3" exit
echo Invalid choice. Exiting.
exit

:EnableClassic
echo Enabling Classic Context Menu...
REG ADD "HKEY_CURRENT_USER\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32" /f /ve
echo Classic context menu enabled.
echo Please log out or restart Explorer for changes to take effect.
pause
exit

:RevertNew
echo Reverting to New Context Menu...
REG DELETE "HKEY_CURRENT_USER\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}" /f
echo New context menu restored.
echo Please log out or restart Explorer for changes to take effect.
pause
exit
