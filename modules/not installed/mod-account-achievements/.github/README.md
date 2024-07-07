# ![logo](https://raw.githubusercontent.com/azerothcore/azerothcore.github.io/master/images/logo-github.png) AzerothCore
## mod-account-achievements
![Build Status](https://github.com/anchydev/mod-account-achievements/actions/workflows/core-build.yml/badge.svg?branch=master)

Allows players to share achievements between characters on an account.

## Installation
- Clone the module into your `modules` directory.
- Re-run cmake.
- Re-compile azerothcore.
- Run `worldserver.exe` to execute SQL queries.
- (Optional) Edit the `account_achievement_whitelist` table in the `world` database to include more achievements to be shared.

## Note
This module is based off the original script from ac-web:
http://www.ac-web.org/forums/showthread.php?223586-Account-Bound-Achievements

### Credits
- Lille Carl (Original Creator)
- Grim/Render (Source Edits)
