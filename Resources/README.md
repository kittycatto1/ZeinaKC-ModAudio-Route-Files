# README
Audio packs should be packaged like this: `Author-ModName\plugins\Audio\` then from there add your files.\
To include multiple audio packs in one package you'll need to create new folders and make sure they're protected by the plugins override folder, the "Audio" folder is optional but advised. 

Depending on your use case you may create different audio packs or will need to learn how to merge different routes and LUA scripts, the templates use `__routes.{name}.txt` meaning they can be added into audio packs easily, but LUA scripts will need to be merged or put into separate audio pack folders. For examples of everything mentioned here and in the templates, reference [_Packages](https://github.com/kittycatto1/ZeinaKC-ModAudio-Route-Files/tree/Dominant/_Packages).
#
## References
Each line is a "route", to create a route you need a source clip followed by a character like `=` (replace) then your audio clip.\
Find [**source clips here**](https://github.com/kittycatto1/ZeinaKC-ModAudio-Route-Files/blob/Dominant/Marioalexsan.ModAudio_UserAudioPack/clip_names.md) or use `modaudio_atlyss_map_{map_name}_{day/night/action/null}` for most music.\
Script routes use a `Clip_Name : weight : volume : pitch : group` format.
- **Characters**
  - `=` - Replacement. If it isn't present ModAudio will automatically apply `___default___` to the route. 
  - `@` - Overlay. When the source clip is played, play this on top.
  - `~` - Effect. Additional modifiers for route customisation.
    - Overlays and Effects can go before or after each other, limited to one of each per route.
  - `|` - Pipeline. Allows you to combine multiple sources, replacements, overlays, and effects into one route.
  - `\` - Connective Newline. Formatting tool when combined with pipelines, last line cannot end with a backslash.
  - `#` - Comment. Any text after the hashtag is ignored by ModAudio, most templates won't be commenting.
- **Effects**
  - `replacement_weight` / `weight` / `rw`  / `w` - Modifier value for how often routes and clips targeting the same source are selected. 
    - Weights are calculated as `(route weight / total weight of all routes) * 100%`.
  - `volume` / `vol` / `v` - Affects both replacement and overlay volumes. Some volume is gradual.
  - `pitch`  / `pit` / `p` - Affects both replacement and overlay pitches. Some pitches have a variance range.
    - All three values are 1.0 and relative by default. Weight is handled by ModAudio and Volume/Pitch by the game.
    - These have different appliace methods depending on format version, but in my script templates they're `1.0 : 1.0 : 1.0`.
  - `map_name`   / `map` - Makes the route only play in the specified zones, I.E. `map_name : Sanctum | Arcwood Pass`.
    - `___nomap___` is the specification for menus.
  - `force_loop` / `fl`  - Changes the looping setting for the route. Advised to only use on ambience and music sources.
    - `Unapplied:` Inherits the "loop_off" or "loop_on" effect of the source. (Default)
    - `true:`  Applies "loop_on_force" to the source.
    - `false:` Applies "loop_off_force" to the source.
  - `relative_replacement_effects` / `rel_repl_fx` - Make replacement volume/pitch either relative or absolute. 
  - `relative_overlay_effects`     / `rel_ovl_fx`  - Make overlay volume/pitch either relative or absolute.
    - `true:` Relative, inheriting source values. (Default)
    - `false:` Absolute, by default making things 1.0 unless specified. Ignores gradual volume and variable pitch effects.
  - `overlays_ignore_restarts`      / `ovl_ign_restart`   - Applies to overlay routes.
    - `true:` Overlays will only play once and ignore restarts. Documentation includes an X value for plays in a go.
    - `false:` Overlays are played every time the source is played, even if the audio is restarted mid-playthrough. (Default)
  - `overlay_stops_if_source_stops` / `ovl_stop_with_src` - Applies to overlay routes.
    - `true:` Overlays stop if the game stops the original audio source, resulting in possible cutoffs. (Default)
    - `false:` Instead (attempts to) continues playing even if the original source is stopped, may cause audio spam instead.
  - `link_overlay_and_replacement`  / `link_ovl_repl`     - Applies to routes with both replacements and overlays.
    - `true:` Overlays from the route will only play if the replacement was also applied. (Default)
    - `false:` Ignores the previous behaviour and can play the overlay even if the replacement wasn't played.
  - `chain_route` / `chain` - If enabled audio replacements can be rerouted and use another pack's clips for the same source.
    - Scripting: [Combat Audio Pack](https://thunderstore.io/c/atlyss/p/Marioalexsan/Combat_Audio_Pack/) uses this to play custom action music from other packs if they're installed.
- **Script Effects**
  - `target_group_script`          / `tg_lua`    - In the middle of `function p.Target_Group(route)`s target groups can be selected.
  - `enable_dynamic_targeting`     / `tg_dyn`    - Enables dynamic updating, best for conditional routes like subregions and combat.
    - `force_play` / `fp` - Forces audio to continue playing even if the source is stopped as part of dynamic targeting.
  - `smooth_dynamic_targeting`     / `tg_smooth` - Adds in a fading effect to allow for smoother transitions.
  - `continuous_dynamic_targeting` / `tg_cont`   - Adds preservation and wrapping of audio play positions to play them "in parallel".
- **Metadata**
  - `%id`               - Audio pack identifier for ModAudio, otherwise using folder names as IDs.
  - `@displayname`      - Displayed name on EasySettings.
  - `%enabledbydefault` - The enable state when first being saved to `Marioalexsan.ModAudio.CFG`. True by default, false disables it.
  - `%customclippath`   - For reusing files across folders, relative paths can be set in "__routes.txt" with the clip and folder.
    - `%customclippath Clip_Name = ../_customclippath` goes up one folder and searches for "Clip_Name" in "_customclippath".
  - `%customclipvolume` - Use this to globally adjust the volume of your custom clips, I.E. `%customclipvolume Clip_Name = 1.0`.
  - `%updatescript`     - Used by scripts when a function has to be called every frame, mine are called `pack_update` for combat.
- **Extras**
  - `modaudio_atlyss_map_{map_name}_{day/night/action/null}` - Advanced method of selecting *most* music sources. ([modudio_clips.md](https://github.com/kittycatto1/ZeinaKC-ModAudio-Route-Files/blob/Dominant/Marioalexsan.ModAudio_UserAudioPack/Bonus/modaudio_clips.md))
    - `day:` Plays the music during dayttime hours.
    - `night:` Plays the music during nighttime hours.
      - If the original music source is null, an extra setup is required to use these.
    - `action:` Only used by Slime Diva and Galius. With scripting custom combat music can be played.
    - `null:` Plays the music indefinitely, overwrites time-based music if used.
  - `<game>target_clip` - Reference audio clips from the game. ([clip_names.md](https://github.com/kittycatto1/ZeinaKC-ModAudio-Route-Files/blob/Dominant/Marioalexsan.ModAudio_UserAudioPack/clip_names.md))
  - `___default___`     - Set the replacement to play the original source's clips. Used as replacements fallback support.
  - `___nothing___`     - Repeat, play nothing.
  - `___disable___`     - Repeat, when applied to `modaudio_atlyss_map_{map_name}_null` enables using day and night music.
- **modpack_overrides**
  - `NoChanges`        - Don't apply any overrides and use inherit behaviour.
  - `EnableByDefault`  - Audio pack is overriden to start enabled when first saved to `Marioalexsan.ModAudio.CFG`.
  - `DisableByDefault` - Opposite of the above.
  - `AlwaysEnabled`    - Audio pack is overriden to always be enabled.
  - `AlwaysDisabled`   - Opposite of the above.