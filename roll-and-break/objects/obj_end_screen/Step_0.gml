endFrame += 1;

if (endFrame == 20) {
	audio_play_sound(sound_vo_thanks, 1, false);
}

if (endFrame > 30 && check_input(ord("A"), gp_face1, true)) {
	room_goto(rm_title);
}