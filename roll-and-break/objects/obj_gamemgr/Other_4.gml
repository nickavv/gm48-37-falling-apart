/// @description New Room Stuff

// Singleton, don't let other instances of me exist
if (instance_number(object_index) > 1) {
	instance_destroy();
} else {
	phase = gamePhase.ready;
	lastPhase = phase;
	phaseFrame = 0;
	coinsCollected = 0;
}