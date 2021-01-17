if (obj_gamemgr.phase == gamePhase.playing) {
	if (!complete) {
		image_alpha = lerp(image_alpha, 1, 0.1);
	} else {
		image_alpha = lerp(image_alpha, 0, 0.1);
		if (image_alpha == 0) {
			instance_destroy();
		}
	}
	check_complete();
}