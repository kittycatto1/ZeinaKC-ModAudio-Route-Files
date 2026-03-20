# (Comment)
\ (Connective newline)
# ===== Metadata ===== #
%id               ZeinaKC_References (Identification)
%displayname      ZeinaKC References (EasySettings display name)
%enabledbydefault true               (Should the pack be toggled off or on when first installed?)
%updatescript pack_update

# ===== Clip Replacement ===== #
= (Replace)
@ (Overlay)
~ (Effect)
SourceClip = ___default___
SourceClip = ___nothing___
SourceClip = <atlyss>VanillaClip

# ===== Effects ===== #
- `weight` - `rw`  - `w` (Weight of being selected, gets naurally more improbable the more calcuations there are)
- `volume` - `vol` - `v`
- `pitch`  - `pit` - `p`

- `map_name`   - `map` (Only play the route if the Source is coming from these instances. ___NOMAP___)
- `force_loop` - `fl`
- `force_play` - `fp`
- `relative_replacement_effects` - `rel_repl_fx`
- `relative_overlay_effects`     - `rel_ovl_fx`

- `link_overlay_and_replacement`  - `link_ovl_repl`
- `overlay_stops_if_source_stops` - `ovl_stop_with_src`
- `overlays_ignore_restarts`      - `ovl_ign_restart`

- `target_group_script`      - `tg_lua`
- `enable_dynamic_targeting` - `tg_dyn`
- `smooth_dynamic_targeting` - `tg_smooth`
- `chain_route`              - `chain`

# ===== Clips ===== #
%customclippath   CLIP = `relative/path/to/clip`
%customclipvolume CLIP = Value