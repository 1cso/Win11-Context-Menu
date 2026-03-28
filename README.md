# win11-context-menu

A simple BAT script to toggle between the classic Windows 10-style context menu and the default Windows 11 context menu.

## Features

- Enable the classic Windows 10-style context menu.  
- Revert back to the default Windows 11 context menu.  
- Simple command-line interface with prompts.  
- Requires administrator privileges.

## Usage

1. Clone the repository:

```bash
git clone https://github.com/1cso/win11-context-menu.git
cd win11-context-menu
```

2. Run the script as Administrator:
```bat
RestoreClassicMenu.bat
```

3. Follow the on-screen menu:
- Press 1 to enable the classic context menu.
- Press 2 to revert to the new Windows 11 menu.
- Press 3 to exit the script.
After making changes, log out or restart Explorer to apply the changes.
Notes
Tested on Windows 11 versions up to 22H2 and some 23H2 builds.
Creating a restore point is recommended before modifying the registry.
The script only modifies registry settings and does not change system files.


## RestoreClassicMenu.bat
```bat
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
```
