enum rolandState {
	ready,
	rolling
}
enum rollDir {
	d,
	dl,
	dr,
	l,
	r,
	u,
	ul,
	ur
}
state = rolandState.ready;
dir = rollDir.d;

function getRollSprite() {
	switch (dir) {
		case rollDir.d:  return spr_roland_roll_d; break;
		case rollDir.dl: return spr_roland_roll_dl; break;
		case rollDir.dr: return spr_roland_roll_dr; break;
		case rollDir.l:  return spr_roland_roll_l; break;
		case rollDir.r:  return spr_roland_roll_r; break;
		case rollDir.u:  return spr_roland_roll_u; break;
		case rollDir.ul: return spr_roland_roll_ul; break;
		case rollDir.ur: return spr_roland_roll_ur; break;
	}
}

function handleRollDirectionInput() {
	// Determine direction
	var hStick = 0;
	var vStick = 0;
	if (keyboard_check(vk_left)) {
		hStick = -1;
	} else if (keyboard_check(vk_right)) {
		hStick = 1;
	}
	if (keyboard_check(vk_up)) {
		vStick = -1;
	} else if (keyboard_check(vk_down)) {
		vStick = 1;
	}
	
	if (hStick == -1) {
		switch (vStick) {
			case -1: dir = rollDir.ul; break;
			case  0: dir = rollDir.l; break;
			case  1: dir = rollDir.dl; break;
		}
	} else if (hStick == 0) {
		switch (vStick) {
			case -1: dir = rollDir.u; break;
			case  1: dir = rollDir.d; break;
		}
	} else if (hStick == 1) {
		switch (vStick) {
			case -1: dir = rollDir.ur; break;
			case  0: dir = rollDir.r; break;
			case  1: dir = rollDir.dr; break;
		}
	}
}