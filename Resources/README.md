# README
Audio packs should be packaged like this: `package.zip\plugins\Audio\` then from there add your files.\
To include multiple audio packs in one package you'll need to create new folders and make sure they're protected by the plugins override folder, the "Audio" folder is optional but advised. 

Depending on your use case you may create different audio packs or will need to learn how to merge different routes and LUA scripts, the templates use `__routes.{name}.txt` meaning they can be added into audio packs easily, but LUA scripts will need to be merged or put into separate folders. For examples of everything mentioned here and in the templates, reference [_Packages](https://github.com/kittycatto1/ZeinaKC-ModAudio-Route-Files/tree/Dominant/_Packages).
# Table of Contents
- [**Route Templates**](https://github.com/kittycatto1/ZeinaKC-ModAudio-Route-Files/tree/Dominant/Resources/Route%20Templates)
  - [**Music**](https://github.com/kittycatto1/ZeinaKC-ModAudio-Route-Files/tree/Dominant/Resources/Route%20Templates/Music)
  - [**Ambience**](https://github.com/kittycatto1/ZeinaKC-ModAudio-Route-Files/tree/Dominant/Resources/Route%20Templates/Ambience)
  - [**Voices**](https://github.com/kittycatto1/ZeinaKC-ModAudio-Route-Files/tree/Dominant/Resources/Route%20Templates/Voices)
- [**Lua Templates**](https://github.com/kittycatto1/ZeinaKC-ModAudio-Route-Files/tree/Dominant/Resources/Lua%20Templates)
  - [**Subregions**](https://github.com/kittycatto1/ZeinaKC-ModAudio-Route-Files/tree/Dominant/Resources/Lua%20Templates/Subregions)
  - [**Difficulty**](https://github.com/kittycatto1/ZeinaKC-ModAudio-Route-Files/tree/Dominant/Resources/Lua%20Templates/Difficulty)
  - [**Combat**](https://github.com/kittycatto1/ZeinaKC-ModAudio-Route-Files/tree/Dominant/Resources/Lua%20Templates/Combat)   - [**Advanced**](https://github.com/kittycatto1/ZeinaKC-ModAudio-Route-Files/tree/Dominant/Resources/Lua%20Templates/Combat_Advanced)
  - [**Weapons**](https://github.com/kittycatto1/ZeinaKC-ModAudio-Route-Files/tree/Dominant/Resources/Lua%20Templates/Weapons) - [**Advanced**](https://github.com/kittycatto1/ZeinaKC-ModAudio-Route-Files/tree/Dominant/Resources/Lua%20Templates/Weapons_Advanced)
- [**MapLoader Templates**](https://github.com/kittycatto1/ZeinaKC-ModAudio-Route-Files/tree/Dominant/Resources/_MapLoader%20Templates)
- [**References**](https://github.com/kittycatto1/ZeinaKC-ModAudio-Route-Files/edit/Dominant/Resources/README.md#references)
  - [**Characters**](https://github.com/kittycatto1/ZeinaKC-ModAudio-Route-Files/edit/Dominant/Resources/README.md#characters)
  - [**Effects**](https://github.com/kittycatto1/ZeinaKC-ModAudio-Route-Files/edit/Dominant/Resources/README.md#effects)
  - [**Script Effects**](https://github.com/kittycatto1/ZeinaKC-ModAudio-Route-Files/edit/Dominant/Resources/README.md#script-effects)
  - [**Metadata**](https://github.com/kittycatto1/ZeinaKC-ModAudio-Route-Files/edit/Dominant/Resources/README.md#metadata)
  - [**Extras**](https://github.com/kittycatto1/ZeinaKC-ModAudio-Route-Files/edit/Dominant/Resources/README.md#extras)
  - [**modpack_overrides**](https://github.com/kittycatto1/ZeinaKC-ModAudio-Route-Files/edit/Dominant/Resources/README.md#modpack_overrides)
#
## References
Each line is a "route" that needs a source clip followed by a character and then audio clip, I.E. `Source_Clip = Target_Clip`.\
Find [**source clips here**](https://github.com/kittycatto1/ZeinaKC-ModAudio-Route-Files/blob/Dominant/Marioalexsan.ModAudio_UserAudioPack/clip_names.md) or use `modaudio_atlyss_map_{map_name}_{day/night/action/null}` ([**link**](https://github.com/kittycatto1/ZeinaKC-ModAudio-Route-Files/edit/Dominant/Resources/README.md#extras)) for most music.

ModAudio is mostly backwards compatible but some features have been removed or deprecated (no longer achieving support).\
I'll focus on the latest format (V4.5.X) but older formats include different solutions for specific problems. Major landmarks are:\
\- [**Basic Format (V1.1.0)**](https://github.com/Marioalexsan/AtlyssModAudio#basic-audio-pack-format-v110)\
\- [**Advanced Format (V2.0.0)**](https://github.com/Marioalexsan/AtlyssModAudio#advanced-audio-pack-format-v200)\
\- V3.0.0 was completely deprecated in V3.3.0 exchanging JS for LUA. ⚠️\
\- [**Scripting (V4.0.0+)**](https://github.com/Marioalexsan/AtlyssModAudio#how-do-i-use-scripts)

ModAudio comes with a folder called "TestPacks" that can be enabled in-game via EasySettings or in `Marioalexsan.ModAudio.cfg` under **[Misc]**, here are Github links to them. For making simple music packs check out [**MusicModTemplate**](https://thunderstore.io/c/atlyss/p/RockOn/MusicModTemplate/) by [**RockOn**](https://thunderstore.io/c/atlyss/p/RockOn/).\
\- [**__routes.replacements.txt**](https://github.com/Marioalexsan/AtlyssModAudio/blob/f0121d29a60835d12d732e9dc31b4164f306a3d0/ModAudio/TestPacks/Replacements/__routes.replacements.txt)\
\- [**__routes.overlay.txt**](https://github.com/Marioalexsan/AtlyssModAudio/blob/f0121d29a60835d12d732e9dc31b4164f306a3d0/ModAudio/TestPacks/Overlays/__routes.overlay.txt)\
\- [**__routes.effects.txt**](https://github.com/Marioalexsan/AtlyssModAudio/blob/f0121d29a60835d12d732e9dc31b4164f306a3d0/ModAudio/TestPacks/Effects/__routes.effects.txt)
### Characters
The (script) format extends like this: `source = target : weight : volume : pitch : group`. Only previous parameters are "required", ahead ones can be skipped. W/V/P have better solutions but scripting strictly requires this.
- `=` - Replacement. If it isn't present ModAudio will assume and auto-fill the route with `___default___` during parsing.
- `@` - Overlay. When the source clip is played, play this on top. (Read [link_overlay_and_replacement](https://github.com/kittycatto1/ZeinaKC-ModAudio-Route-Files/edit/Dominant/Resources/README.md#effects))
- `~` - Effect. Additional modifiers for route customisation.
  - Overlays and Effects can go before or after each other, limited to one of each per route.
- `|` - Pipeline. Allows you to combine multiple sources, replacements, overlays, and effects into one route.
- `\` - Connective Newline. Formatting tool when combined with pipelines, last line cannot end with a backslash.
- `#` - Comment. Any text after the hashtag is ignored by ModAudio, most templates won't be commenting.
```
# ModAudioMan speaking...
Source_Clip = Target_Clip
Source_Clip (= ___default___) @ Target_Clip
Source_Clip (= ___default___) ~ Effect : true/false 
Source_Clip = Target_Clip @ Target_Clip ~ Effect : true/false

Source_Clip                                 \ # The =@~ lines don't really need the pipelines.
  = | Target_Clip : 1.0 : 1.0 : 1.0 : Group \ # Yes, you need W/V/P to reach Groups...
  @ | Target_Clip : 1.0 : 1.0 : 1.0         \ # You can skip ahead ones if you won't use them.
  ~ | Effect : true                         \ # Not everything needs to be neatly newlined technically.
    | Effect : false                          # EoF. I like adding these.
# It is all formatting preference, as long as its valid it works.
```
### Effects
Properties are followed up with colons (:) for values, this includes **booleans**, **floats** (decimal numbers), and **strings** (text).\
All effects (except map_name) are **Booleans** (true/false) and Weight/Volume/Pitch are **Floats** (decimal number values).
- `replacement_weight` / `weight` / `rw`  / `w` - Modifier value for how often routes/clips targeting the same source are selected. 
  - Weights are calculated as `(route weight / total weight of all routes) * 100%`.
- `volume` / `vol` / `v` - Affects both replacement and overlay volumes. Some volume is gradual.
- `pitch`  / `pit` / `p` - Pitch ditto. Some pitches have a variance range.
  - All three values are 1.0 and relative by default. Weight is handled by ModAudio and Volume/Pitch by the game.
  - There's different appliace methods depending on format version, but in my script templates they're `1.0 : 1.0 : 1.0`.
- `map_name`   / `map` **[String]** - Makes the route only play in the specified zones, I.E. `map_name : Sanctum | Arcwood Pass`.
  - `___nomap___` Is the specification for menus.
- `force_loop` / `fl`  - Changes the looping setting for the route. Advised to only use on ambience and music sources.
  - `Unapplied` Inherits the "loop_off" or "loop_on" effect of the source. (Default)
  - `true`  Applies "loop_on_force" to the source.
  - `false` Applies "loop_off_force" to the source.
- `relative_replacement_effects` / `rel_repl_fx` - Make replacement volume/pitch either relative or absolute. 
- `relative_overlay_effects`     / `rel_ovl_fx`  - Overlay ditto.
  - `true` Relative, inheriting source values. (Default)
  - `false` Absolute, by default making things 1.0 unless specified. Ignores gradual volume and variable pitch effects.
- `overlays_ignore_restarts`      / `ovl_ign_restart`   - Applies to overlay routes.
  - `true` Overlays will only play once and ignore restarts. Documentation includes an X value for plays in a go.
  - `false` Overlays are played every time the source is played, even if the audio is restarted mid-playthrough. (Default)
- `overlay_stops_if_source_stops` / `ovl_stop_with_src` - Applies to overlay routes.
  - `true` Overlays stop if the game stops the original audio source, resulting in possible cutoffs. (Default)
  - `false` Instead (attempts to) continues playing even if the original source is stopped, may cause audio spam instead.
- `link_overlay_and_replacement`  / `link_ovl_repl`     - Applies to routes with both replacements and overlays.
  - `true` Overlays from the route will only play if the replacement was also applied. (Default)
  - `false` Ignores the previous behaviour and can play the overlay even if the replacement wasn't played.
- `chain_route` / `chain` - If enabled audio replacements can be rerouted and use another pack's clips for the same source.
  - Scripting: [**Combat Audio Pack**](https://thunderstore.io/c/atlyss/p/Marioalexsan/Combat_Audio_Pack/) uses this to play custom action music from other packs if they're installed.
### Script Effects
Property Type: **Boolean** (true/false).
- `target_group_script`          / `tg_lua`    - Target groups can be selected from `function p.Target_Group_(route)`s.
- `enable_dynamic_targeting`     / `tg_dyn`    - Enables dynamic updating, best for conditional routes like subregions and combat.
  - `force_play` / `fp` - Forces audio to continue playing even if the source is stopped as part of dynamic targeting.
- `smooth_dynamic_targeting`     / `tg_smooth` - Adds in a fading effect to allow for smoother transitions.
- `continuous_dynamic_targeting` / `tg_cont`   - Preserves and wraps audio play positions to play them "in parallel".
### Metadata
All `@` properties were categorised under metadata. ([**Example**](https://github.com/kittycatto1/ZeinaKC-ModAudio-Route-Files/blob/Dominant/Resources/__routes.txt))\
They range from package details, custom clip modifications, to scripting features.
- `%id`          **[String]** - Audio pack identifier for ModAudio, otherwise using folder paths as IDs.
- `@displayname` **[String]** - Displayed name on EasySettings.
- `%enabledbydefault` **[Boolean]** - The enable state when first being saved to `Marioalexsan.ModAudio.CFG`.
- `%customclippath`   **[Clip_Name = ../your/relative/path/here]** - To reuse files across folders, set paths inside and relative to the "__routes.txt". For example to reuse `/audio/music.mp3` within `/audio2/__routes.txt`,  use `%customclippath music = ../audio/music`.
- `%customclipvolume` **[Clip_Name = 1.0]** - Use this to globally adjust the volume of your custom clips.
- `%updatescript` **[String]** - Used by scripts when a function has to be called every frame, mine are called `pack_update` for combat.
### Extras
These are built-in "Source_Clip" and "target_clips"s provided by ModAudio and ATLYSS.
- `modaudio_atlyss_map_{map_name}_{day/night/action/null}` - Aliases for selecting *most* music sources. ([modudio_clips.md](https://github.com/kittycatto1/ZeinaKC-ModAudio-Route-Files/blob/Dominant/Marioalexsan.ModAudio_UserAudioPack/Bonus/modaudio_clips.md))
  - `day` Plays the music during dayttime (6AM-8PM) hours.
  - `night` Plays the music during nighttime (8PM-6AM) hours.
    - If the original music source is null, an extra setup is required to use these.
  - `action` Only used by Slime Diva and Galius. With scripting custom combat music can be played.
  - `null` Plays the music indefinitely, overwrites time-based music if used.
- `<game>target_clip` - Reference audio clips from the game. ([clip_names.md](https://github.com/kittycatto1/ZeinaKC-ModAudio-Route-Files/blob/Dominant/Marioalexsan.ModAudio_UserAudioPack/clip_names.md))
- `___default___`     - Set the replacement to play the original source's clips. Used as replacements fallback support.
- `___nothing___`     - Ditto, play nothing.
- `___disable___`     - Ditto, when applied to `modaudio_atlyss_map_{map_name}_null` enables using day and night music.
### modpack_overrides
[**modaudio.modpack_overrides.json**](https://github.com/kittycatto1/ZeinaKC-ModAudio-Route-Files/blob/Dominant/Resources/modaudio.modpack_overrides.json)\
Property Type: **String Flags** (values below).
- `"NoChanges"`        - Don't apply any overrides and use inherit behaviour.
- `"EnableByDefault"`  - Audio pack is overriden to start enabled when first saved to `Marioalexsan.ModAudio.CFG`.
- `"DisableByDefault"` - Opposite of the above.
- `"AlwaysEnabled"`    - Audio pack is overriden to always be enabled.
- `"AlwaysDisabled"`   - Opposite of the above.
