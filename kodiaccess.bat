set mydir=%cd%
set sqlite3=%mydir%\kodiaccessutils\sqlite\sqlite-tools-win32-x86-3420000\sqlite3.exe
set git=%mydir%\kodiaccessutils\git\cmd\git.exe
if not exist %sqlite3% goto depinstall
:depinstall
mkdir %mydir%\kodiaccessutils
cd %mydir%\kodiaccessutils
curl -Lo sqlite.zip https://sqlite.org/2023/sqlite-tools-win32-x86-3420000.zip
curl -Lo git.zip "https://github.com/git-for-windows/git/releases/download/v2.41.0.windows.1/MinGit-2.41.0-64-bit.zip"
powershell expand-archive sqlite.zip
powershell expand-archive git.zip
goto main
:main
if exist "c:\Program Files\Kodi\kodi.exe" goto :ttsinstall else goto :dlkodi
:dlkodi
curl -Lo kodiinst.exe https://mirrors.kodi.tv/releases/windows/win64/kodi-20.1-Nexus-x64.exe
kodiinst.exe /S
del kodiinst.exe
goto ttsinstall
:ttsinstall
mkdir %appdata%\kodi\addons %appdata%\kodi\userdata\addon_data\service.xbmc.tts %appdata%\kodi\userdata\keymaps
cd %appdata%\kodi\addons
%git% clone https://github.com/dnl-nash/service.xbmc.tts
cd service.xbmc.tts/lib
%git% clone https://github.com/dnl-nash/backends
cd %appdata%\kodi
copy addons\service.xbmc.tts\resources\settings.xml userdata\addon_data\service.xbmc.tts
copy addons\service.xbmc.tts\resources\keymap.base.xml userdata\keymaps\service.xbmc.tts.keyboard.xml
cd %userprofile%
start "" "c:\Program Files\Kodi\kodi.exe"
ping -n 10 localhost > NUL
taskkill /f /im kodi.exe
%sqlite3% %appdata%\kodi\userdata\Database\Addons33.db "update installed set enabled=1 where enabled=0;"
rd /s /q %mydir%\kodiaccessutils
exit
goto main
