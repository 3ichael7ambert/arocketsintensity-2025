function sPlayer_control() {
	keys_init(); //edit keys_init script for change controls
	
	// Drifting effect
	var driftForce = 0; // Adjust this value to control the intensity of drifting
	
	// Left
	if key_left {
		image_angle -= rotate;
		// Apply drifting force
		var driftX = lengthdir_x(-driftForce, image_angle - 90);
		var driftY = lengthdir_y(-driftForce, image_angle - 90);
		hspeed += driftX;
		vspeed += driftY;
	}
	
	// Right
	if key_right {
		image_angle += rotate;
		// Apply drifting force
		var driftX = lengthdir_x(-driftForce, image_angle + 90);
		var driftY = lengthdir_y(-driftForce, image_angle + 90);
		hspeed += driftX;
		vspeed += driftY;
	}
	
	// Acceleration
	if key_up {
		direction = image_angle;
		var forceX = lengthdir_x(250 * spd, direction);
		var forceY = lengthdir_y(250 * spd, direction);
		hspeed += forceX;
		vspeed += forceY;
	}
	
	// Brake
	if key_down {
		direction = image_angle;
		var forceX = lengthdir_x(-250 * spd, direction);
		var forceY = lengthdir_y(-250 * spd, direction);
		hspeed += forceX;
		vspeed += forceY;
	}
}
