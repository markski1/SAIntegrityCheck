# SAIntegrityCheck
###### Integrity check for GTA: San Andreas

The purpose of this program is to ensure players that their copies of GTA: San Andreas have the standard files and aren't modified, to check for stuff such as not running a modified out-of-the-box version of GTASA, and detecting potential reasons for crashes.

This is important because in SA-MP it is common for people to obtain their copies of the game from sites that could be providing modified copies of the files without making it clear. This might sound like bull, but it is a lot more common than you might think. It has happened to me a few years back and it seems to be common for many players across several servers. This problem becomes much worse when you consider many SA-MP players seem to have little idea about proper places for obtaining the game and will usually download from whichever  result comes first when they look it up.

To run the check, simply place decompress the .7z in your `Grand Theft Auto: San Andreas` root directory and execute it.

Languages available: Spanish, English.

[Download](https://github.com/markski1/SAIntegrityCheck/releases/latest).

Usage: Just run the program and review the created `IntegrityReport.txt` for details.

Building: Just compile the .pas file with Free Pascal Compiler and default options.
>Please note that the version of FPC bundled with Bloodshed's Dev-Pascal IDE does NOT include the md5 library, and thus won't build under it.

TODO:
- ~~Create program to generate databases of file paths and their respective hashes.~~ Unnecessary, using text instead.
- ~~Change the hardcoded checks for ussage of said database file.~~ Done.
- ~~Check for SA directory automatically.~~ Done.
- Check for sideloaded cheats
- Check for known keyloggers
- ?????
