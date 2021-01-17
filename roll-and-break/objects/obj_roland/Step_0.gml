switch (state) {
	case rolandState.ready: {
		sprite_index = spr_roland_start;
	}; break;
	case rolandState.rolling: {
		handleRollDirectionInput();
		sprite_index = getRollSprite();
		image_speed = clamp(phy_speed/5, 0, 1);
		var currentTile = tilemap_get_at_pixel(layer_tilemap_get_id(layer_get_id("Tiles_Ground")), x, y);
		if (currentTile == obj_tile_style_manager.stdGrass) {
			var tileX = x div tile_width;
			var tileY = y div tile_height;
			obj_tile_style_manager.markTileAsBroken(tileX, tileY);
		} else if (currentTile == 0) {
			// Falling!
			state = rolandState.falling;
			image_speed = 1;
		}
	} break;
	case rolandState.falling: {
		if (stateChanged) {
			audio_play_sound(sound_roland_fall, 2, false);
		}
		sprite_index = spr_roland_fall;
		obj_gamemgr.phase = gamePhase.dying;
		stopMoving();
	} break;
	case rolandState.goal: {
		if (stateChanged) {
			audio_play_sound(sound_roland_goal, 2, false);
		}
		sprite_index = spr_roland_celebrate;
		stopMoving();
	}
}