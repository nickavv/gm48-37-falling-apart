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
rollForce = 2;
antiSlipForce = 2.5;

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
		var forceAmt = -rollForce
		if (phy_speed_x > 0) {
			forceAmt -= antiSlipForce;
		}
		physics_apply_local_force(0, 0, forceAmt, 0);
	} else if (keyboard_check(vk_right)) {
		hStick = 1;
		var forceAmt = rollForce
		if (phy_speed_x < 0) {
			forceAmt += antiSlipForce;
		}
		physics_apply_local_force(0, 0, forceAmt, 0);
	}
	if (keyboard_check(vk_up)) {
		vStick = -1;
		var forceAmt = -rollForce;
		if (phy_speed_y > 0) {
			forceAmt -= antiSlipForce;
		}
		physics_apply_local_force(0, 0, 0, forceAmt);
	} else if (keyboard_check(vk_down)) {
		vStick = 1;
		var forceAmt = rollForce;
		if (phy_speed_y < 0) {
			forceAmt += antiSlipForce;
		}
		physics_apply_local_force(0, 0, 0, forceAmt);
	}
	
	if (hStick == -1) {
		switch (vStick) {
			case -1: dir = rollDir.ul; break;
			case  0: dir = rollDir.l;
					 if (phy_speed_y != 0) {
						physics_apply_local_force(0, 0, 0, (-1 * sign(phy_speed_y)) * antiSlipForce);
					 } 
					 break;
			case  1: dir = rollDir.dl; break;
		}
	} else if (hStick == 0) {
		switch (vStick) {
			case -1: dir = rollDir.u; break;
			case  1: dir = rollDir.d; break;
		}
		if (phy_speed_x != 0) {
			physics_apply_local_force(0, 0, (-1 * sign(phy_speed_x)) * antiSlipForce, 0);
		} 
	} else if (hStick == 1) {
		switch (vStick) {
			case -1: dir = rollDir.ur; break;
			case  0: dir = rollDir.r; 
					 if (phy_speed_y != 0) {
						physics_apply_local_force(0, 0, 0, (-1 * sign(phy_speed_y)) * antiSlipForce);
					 } 
					 break;
			case  1: dir = rollDir.dr; break;
		}
	}
}