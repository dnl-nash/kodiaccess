# kodiaccess
# kodiaccess
Kodi Screen Reader Automatic Installer
This script for windows will install the Kodi Media Center, along with the Kodi Screen Reader, allowing eyes-free access to the platform and its addons. The script will do the following:
    Check for and install both the SQLite3 DBMS, along with Git for Windows tools, which are needed to configure accessibility for kodi
    Check if the Kodi Media Center program is available in the default location. If it is not, it will be downloaded and installed on both windows and Mac OS X.
    Create the default structure for Kodi to detect and install addons
    Install and configure the screen reader
    Run kodi to populate the initial user profile
    Set all addons to enabled state
This script will also install accessibility for the flatpak version of kodi, which will be installed automatically if it has not already been installed by your system's package manager.
