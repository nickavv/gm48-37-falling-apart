function check_dir_up(pressed) {
	checked = false;
	if (pressed ? keyboard_check_pressed(vk_up) : keyboard_check(vk_up)) {
		checked = true;
	} else {
		for (var i = 0; i < array_length(obj_gamemgr.connectedGamepads); i++) {
			var gamepadId = obj_gamemgr.connectedGamepads[i];
			if (pressed) {
				if (gamepad_button_check_pressed(gamepadId, gp_padu) ||
						(!obj_gamemgr.yAxisHeld && gamepad_axis_value(gamepadId, gp_axislv) < -0.5)) {
					checked = true;
					obj_gamemgr.yAxisHeld = true;
				}
			} else {
				if (gamepad_button_check(gamepadId, gp_padu) ||
					gamepad_axis_value(gamepadId, gp_axislv) < -0.5) {
					checked = true;
					obj_gamemgr.yAxisHeld = true;
				}
			}
		}
	}
	return checked;
}

function check_dir_down(pressed) {
	checked = false;
	if (pressed ? keyboard_check_pressed(vk_down) : keyboard_check(vk_down)) {
		checked = true;
	} else {
		for (var i = 0; i < array_length(obj_gamemgr.connectedGamepads); i++) {
			var gamepadId = obj_gamemgr.connectedGamepads[i];
			if (pressed) {
				if (gamepad_button_check_pressed(gamepadId, gp_padd) ||
						(!obj_gamemgr.yAxisHeld && gamepad_axis_value(gamepadId, gp_axislv) > 0.5)) {
					checked = true;
					obj_gamemgr.yAxisHeld = true;
				}
			} else {
				if (gamepad_button_check(gamepadId, gp_padd) ||
					gamepad_axis_value(gamepadId, gp_axislv) > 0.5) {
					checked = true;
					obj_gamemgr.yAxisHeld = true;
				}
			}
		}
	}
	return checked;
}

function check_dir_left(pressed) {
	checked = false;
	if (pressed ? keyboard_check_pressed(vk_left) : keyboard_check(vk_left)) {
		checked = true;
	} else {
		for (var i = 0; i < array_length(obj_gamemgr.connectedGamepads); i++) {
			var gamepadId = obj_gamemgr.connectedGamepads[i];
			if (pressed) {
				if (gamepad_button_check_pressed(gamepadId, gp_padl) ||
						(!obj_gamemgr.xAxisHeld && gamepad_axis_value(gamepadId, gp_axislh) < -0.5)) {
					checked = true;
					obj_gamemgr.xAxisHeld = true;
				}
			} else {
				if (gamepad_button_check(gamepadId, gp_padl) ||
					gamepad_axis_value(gamepadId, gp_axislh) < -0.5) {
					checked = true;
					obj_gamemgr.xAxisHeld = true;
				}
			}
		}
	}
	return checked;
}

function check_dir_right(pressed) {
	checked = false;
	if (pressed ? keyboard_check_pressed(vk_right) : keyboard_check(vk_right)) {
		checked = true;
	} else {
		for (var i = 0; i < array_length(obj_gamemgr.connectedGamepads); i++) {
			var gamepadId = obj_gamemgr.connectedGamepads[i];
			if (pressed) {
				if (gamepad_button_check_pressed(gamepadId, gp_padr) ||
						(!obj_gamemgr.xAxisHeld && gamepad_axis_value(gamepadId, gp_axislh) > 0.5)) {
					checked = true;
					obj_gamemgr.xAxisHeld = true;
				}
			} else {
				if (gamepad_button_check(gamepadId, gp_padr) ||
					gamepad_axis_value(gamepadId, gp_axislh) > 0.5) {
					checked = true;
					obj_gamemgr.xAxisHeld = true;
				}
			}
		}
	}
	return checked;
}