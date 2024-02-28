Ghosts'n Goblins for the MEGA65
===============================

Ghosts'n Goblins, the legendary arcade adventure that captured hearts in 1985.

Step into the armor of the valiant knight, Arthur, as you journey through the treacherous realms infested with supernatural creatures. Traverse eerie landscapes, battle gruesome enemies, and face off against powerful bosses as you strive to rescue Princess Prin-Prin.


This core is based on the
[MiSTer](https://github.com/MiSTer-devel/Arcade-GnG_MiSTer/)
Ghosts'n Goblins core which itself is based on the work of [many others](AUTHORS).

[Muse aka sho3string](https://github.com/sho3string) ported the core to the MEGA65 in 2024.

The core uses the [MiSTer2MEGA65](https://github.com/sy2002/MiSTer2MEGA65)
framework and [QNICE-FPGA](https://github.com/sy2002/QNICE-FPGA) for
FAT32 support (loading ROMs, mounting disks) and for the
on-screen-menu.

How to install Ghosts'n Goblins core on your MEGA65
---------------------------------------------------

Download ROM: Download the MAME ROM ZIP file.

Download the powershell or shell script depending on your preferred platform ( Windows, Linux/Unix and MacOS supported )

Run the script:
a) First extract all the files within the zip to any working folder.

b) Copy the powershell or shell script to the same folder and execute it to create the following files.

![image](https://github.com/sho3string/GnGMEGA65/assets/36328867/c9525deb-ffed-4e03-aed3-1f1645de6795)

For Windows run the script via PowerShell
GnG_rom_installer.ps1

For Unix/Linux/MacOS
./GnG_rom_installer.sh

The script will automatically create the /arcade/gng folder where the generated ROMs will reside.

Copy or move the arcade/gng folder to your MEGA65 SD card: You may either use the bottom SD card tray of the MEGA65 or the tray at the backside of the computer (the latter has precedence over the first). 

    
