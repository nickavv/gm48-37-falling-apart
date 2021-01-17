phaseFrame += 1;
if (phase == gamePhase.playing) {
	timeRemaining -= 1;
}

// reset controller axis held variable
if (xAxisHeld) {
	var anyHeldX = false;
	for (var i = 0; i < array_length(connectedGamepads); i++) {
		var gamepadId = connectedGamepads[i];
		if (abs(gamepad_axis_value(gamepadId, gp_axislh)) > 0.5) {
			anyHeldX = true;
			break;
		}
	}
	xAxisHeld = anyHeldX;
}
if (yAxisHeld) {
	var anyHeldY = false;
	for (var i = 0; i < array_length(connectedGamepads); i++) {
		var gamepadId = connectedGamepads[i];
		if (abs(gamepad_axis_value(gamepadId, gp_axislv)) > 0.5) {
			anyHeldY = true;
			break;
		}
	}
	yAxisHeld = anyHeldY;
}