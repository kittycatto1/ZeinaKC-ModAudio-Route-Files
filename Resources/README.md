# README
Audio packs should be packaged like this: `Author-ModName\plugins\Audio\` then from there add your files.\
To include multiple audio packs in one package you'll need to create new folders and make sure they're protected by the plugins override folder, the "Audio" folder is optional but advised. 

Depending on your use case you may create different audio packs or will need to learn how to merge different routes and Lua scripts, the templates use `__routes.{name}.txt` meaning they can be added into audio packs easily, but Lua scripts will need to be merged or put into separate audio pack folders. For examples of everything mentioned here and in the templates, reference [_Packs](https://github.com/kittycatto1/ZeinaKC-ModAudio-Route-Files/tree/Dominant/_Packages).
#
## References
Each line is a "route", to create a route you need a source clip followed by a character like `=` (replace) then your audio clip. Find [**source clips here**](https://github.com/kittycatto1/ZeinaKC-ModAudio-Route-Files/blob/Dominant/Marioalexsan.ModAudio_UserAudioPack/clip_names.md) or use `modaudio_atlyss_map_{map_name}_{day/night/action/null}` for most music.
- **Characters**
  - `=` - Replacement. If it isn't present ModAudio will automatically apply `___default___` to the route. 
  - `@` - Overlay. When the source clip is played, play this on top.
  - `~` - Effect. Additional modifiers for route customisation.
    - Overlays and Effects can go before or after each other, limited to one of each per route.
  - `|` - Pipeline. Allows you to combine multiple sources, replacements, overlays, and effects into one route.
  - `\` - Connective Newline. Formatting tool when combined with pipelines, last line cannot end with a backslash.
  - `#` - Comment. Any text after the hashtag is ignored by ModAudio, most templates won't use this.
- **Effects** (WIP)
  - `weight` / `rw` / `w`  - TBA.
  - `volume` / `vol` / `v` - TBA.
  - `pitch`  / `pit` / `p` - TBA.
    - If you see `1.0 : 1.0 : 1.0`, this is them.
  - `force_loop` / `fl`    - TBA.
  - `force_play` / `fp`    - TBA.
  - `map_name`   / `map`   - TBA.
  - `chain_route` / `chain` - TBA.
  - `relative_replacement_effects`  / `rel_repl_fx`       - TBA.
  - `relative_overlay_effects`      / `rel_ovl_fx`        - TBA.
  - `link_overlay_and_replacement`  / `link_ovl_repl`     - TBA.
  - `overlay_stops_if_source_stops` / `ovl_stop_with_src` - TBA.
  - `overlays_ignore_restarts`      / `ovl_ign_restart`   - TBA.
- **Script Effects** (WIP)
  - `target_group_script`      / `tg_lua`    - TBA.
  - `enable_dynamic_targeting` / `tg_dyn`    - TBA.
  - `smooth_dynamic_targeting` / `tg_smooth` - TBA.
- **Metadata** (WIP)
  - `%id`               - Identifier. Identity of the audio pack for ModAudio, otherwise using folder names.
  - `@displayname`      - Displayed name on EasySettings.
  - `%enabledbydefault` - State (true by default). First time the audio pack is saved to `Marioalexsan.ModAudio.CFG`, it'll follow this.
  - `%customclippath`   - TBA.
  - `%customclipvolume` - TBA.
  - `%updatescript`     - Constant LUA function calls. Used by scripts when a function has to be called every frame, mine are named "pack_update" and these need to be embedded to routes that *use* the script functions.
- **Extras** (WIP)
  - `modaudio_atlyss_map_{map_name}_{day/night/action/null}` - TBA.
  - `<game>target_clip` - Vanilla clips.
  - `___default___`     - TBA.
  - `___nothing___`     - TBA.
  - `___disable___`     - TBA.
  - `___nomap___`      - TBA.
