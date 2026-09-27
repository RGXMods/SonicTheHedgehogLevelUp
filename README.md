# <span style="color: #1e3ce1;">🔷 </span> <span style="color: #8b4b5c;">R</span><span style="color: #8b4b5c;">G</span><span style="color: #8b4b5c;">X</span> <span style="color: #1e3ce1;">| </span> <span style="color: #1e3ce1;">S</span><span style="color: #ffffff;">onic </span><span style="color: #1e3ce1;">T</span><span style="color: #ffffff;">he </span><span style="color: #1e3ce1;">H</span><span style="color: #ffffff;">edgehog </span><span style="color: #1e3ce1;">L</span><span style="color: #ffffff;">evel-</span><span style="color: #1e3ce1;">U</span><span style="color: #ffffff;">p</span><span style="color: #1e3ce1;">!</span>

![STHLU Logo](media/logo.png)

## ![](media/kiwi.gif) <span style="color: #8b4b5c;">R</span><span style="color: #8b4b5c;">G</span><span style="color: #8b4b5c;">X</span> <span style="color: #4ecdc4;">Mods</span> <span style="color: #3598db;">-</span> <span style="color: #8b4b5c;">R</span><span style="color: #6b8fb0;">ealm</span><span style="color: #8b4b5c;">G</span><span style="color: #8b4b5c;">X</span> <span style="color: #6b8fb0;">Community Project</span>

***

## <span style="color: #1e3ce1;">🎯 Overview</span>

**Sonic The Hedgehog Level-Up! (STHLU)** replaces World of Warcraft's configured default level-up sound with a Sonic-inspired "LEVEL COMPLETE!" chime whenever the player gains a level. It is a small, automatic sound addon built on RGX-Framework.

![RealmGX Kiwi](media/kiwi.gif) **<span style="color: #2dc26b;">The Kiwi Says:</span>** <span style="color: #b96ad9;">"Gotta go fast! Bwwiiiee."</span>

***

## <span style="color: #1e3ce1;">⚠️ Deprecation Notice</span>

<span style="color: #ff6b6b;">**This addon is no longer receiving updates.**</span> Its functionality and Sonic The Hedgehog sound are available in [BLU | Better Level Up!](https://www.curseforge.com/wow/addons/blu-better-level-up) and [BLU Classic | Better Level Up!](https://www.curseforge.com/wow/addons/blu-classic), which combine this sound with a larger sound collection.

Existing standalone users may continue to use this repository as-is, but new installations should prefer the appropriate BLU addon.

***

## <span style="color: #1e3ce1;">✨ Behavior and Features</span>

- Plays the selected Sonic The Hedgehog-inspired sound on `PLAYER_LEVEL_UP`.
- Provides high, medium, and low OGG variants; medium is selected by default.
- Plays through the Master sound channel by default.
- Requests that RGX-Framework mute the configured default level-up sound while STHLU is enabled.
- Persists enablement and sound-variant choices in `STHLUSettings`.
- Shows a welcome message on login while that saved preference remains enabled.
- Includes a test command for checking playback immediately.
- Ships full chat and welcome text in all 12 WoW client languages: enUS (base), deDE, esES, esMX, frFR, itIT, koKR, ptBR, ptPT, ruRU, zhCN, and zhTW. Unlisted client languages fall back to the English (enUS) text.

STHLU does not alter leveling, experience gains, UI frames, or game data. It only handles the sound associated with the player's level-up event.

***

## <span style="color: #1e3ce1;">🎮 Requirements and Compatibility</span>

`RGX-Framework` is a required dependency and must be installed and enabled. The current TOCs declare these game interfaces:

| WoW flavor | TOC | Interface |
|---|---|---:|
| Retail | `SonicTheHedgehogLevelUp.toc` | `120007` |
| Wrath Classic | `SonicTheHedgehogLevelUp_Wrath.toc` | `30403` |
| Burning Crusade Classic | `SonicTheHedgehogLevelUp_TBC.toc` | `20504` |
| Classic Era | `SonicTheHedgehogLevelUp_Vanilla.toc` | `11500` |

These values describe the preserved release metadata. The addon is deprecated, so they are not a promise of compatibility with later game clients.

***

## <span style="color: #1e3ce1;">📥 Installation</span>

1. Download a packaged release of SonicTheHedgehogLevelUp and install RGX-Framework.
2. Extract both addon folders into the WoW client's `Interface/AddOns` directory.
3. Confirm that the folder is named `SonicTheHedgehogLevelUp` rather than a source-archive name.
4. Enable `RGX-Framework` and `Sonic The Hedgehog Level-Up!` at the character-selection AddOns screen.

For the consolidated replacement, install BLU or BLU Classic instead of the standalone addon.

***

## <span style="color: #1e3ce1;">⌨️ Usage and Configuration</span>

STHLU works automatically once enabled. It has no graphical configuration panel; use `/sthlu` commands in chat:

| Command | Result |
|---|---|
| `/sthlu` or `/sthlu help` | List available commands. |
| `/sthlu test` | Play the selected sound variant. |
| `/sthlu enable` | Enable replacement playback. |
| `/sthlu disable` | Disable replacement playback. |
| `/sthlu high` | Select the high-quality file. |
| `/sthlu med` or `/sthlu medium` | Select the medium-quality file. |
| `/sthlu low` | Select the low-quality file. |

The initial defaults are enabled, medium quality, Master-channel playback, default-sound muting, and the welcome message. Settings persist between sessions in `STHLUSettings`.

***

## <span style="color: #1e3ce1;">🧩 Files and Runtime</span>

- `data/locales.lua` defines chat and welcome text.
- `data/core.lua` registers the sound set, events, saved settings, and `/sthlu` command.
- `sounds/sonic_the_hedgehog_{high,med,low}.ogg` are the active playback files.
- `media/icon.tga`, `media/logo.png`, and `media/kiwi.gif` provide addon and project artwork.

At addon load, STHLU initializes its RGX-Framework sound handle. At login it displays the optional welcome message. Each later `PLAYER_LEVEL_UP` event plays the selected variant when the addon is enabled, and logout allows the framework handle to finalize its state.

***

## <span style="color: #1e3ce1;">🛠️ Troubleshooting</span>

- If WoW marks STHLU as missing a dependency, install or enable `RGX-Framework`.
- If no custom sound plays, run `/sthlu test`, then `/sthlu enable` and select a variant again.
- If the default sound also plays, verify that STHLU and RGX-Framework both loaded without Lua errors.
- If WoW cannot find the addon, verify the exact `Interface/AddOns/SonicTheHedgehogLevelUp` folder name.

Because the standalone project is retired, migrate to BLU or BLU Classic when you prefer the consolidated sound addon.

***

## <span style="color: #1e3ce1;">🔗 Project Links</span>

- [Repository](https://github.com/RGXMods/SonicTheHedgehogLevelUp)
- [Releases](https://github.com/RGXMods/SonicTheHedgehogLevelUp/releases)
- [Issues](https://github.com/RGXMods/SonicTheHedgehogLevelUp/issues)
- [Author: DonnieDice](https://github.com/donniedice)
- [Support development](https://www.buymeacoffee.com/donniedice)

This repository is retained for existing users and historical context. Issue reports and contributions should account for the deprecation notice and the migration path above.

***

## <span style="color: #4ecdc4;">🌟 Thank you for choosing </span> <span style="color: #8b4b5c;">R</span><span style="color: #8b4b5c;">G</span><span style="color: #8b4b5c;">X</span> <span style="color: #4ecdc4;">Mods! 🌟</span>
