switch (state) {
	case rolandState.ready: {
		sprite_index = spr_roland_start;
	}; break;
	case rolandState.rolling: {
		handleRollDirectionInput();
		sprite_index = getRollSprite();
	} break;
}