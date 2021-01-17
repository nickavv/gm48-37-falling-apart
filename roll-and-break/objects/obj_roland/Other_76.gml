switch (event_data[? "message"]) {
	case "start_rolling": state = rolandState.rolling; 
						  // Apply a force downward to get the ball rolling
				     	  physics_apply_local_force(0, 0, 0, 3 * rollForce);
						  break;
	case "fall_done": image_speed = 0; break;
	case "ready_sfx": audio_play_sound(sound_roland_ready, 2, false); break;
}