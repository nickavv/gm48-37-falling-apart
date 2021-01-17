event_inherited();

stickTime = 0;

function check_complete() {
	if (check_dir_up(false) || check_dir_down(false) || check_dir_left(false) || check_dir_right(false)) {
		stickTime += 1;
	}
	if (stickTime > 15) {
		complete = true;
	}
}