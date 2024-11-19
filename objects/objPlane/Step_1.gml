// Check input and update car controls
if (keyboard_check(ord("A"))) {
    car_angular_velocity -= 0.1; // Adjust the angular velocity change based on input
}
if (keyboard_check(ord("D"))) {
    car_angular_velocity += 0.1; // Adjust the angular velocity change based on input
}
if (keyboard_check(ord("W"))) {
    var acceleration = 0.5; // Adjust the acceleration value based on input
    car_velocity[0] += lengthdir_x(acceleration, image_angle); // Update the x component of car_velocity
    car_velocity[1] += lengthdir_y(acceleration, image_angle); // Update the y component of car_velocity
}

// Update car position and orientation
x += car_velocity[0]; // Update the x position using the x component of car_velocity
y += car_velocity[1]; // Update the y position using the y component of car_velocity
image_angle += car_angular_velocity;

// Calculate wheel physics
for (var i = 0; i < 4; i++) {
    // Calculate wheel velocity and angular velocity
    wheel_velocity = [car_velocity[0] + lengthdir_x(car_angular_velocity, -90 * i), car_velocity[1] + lengthdir_y(car_angular_velocity, -90 * i)];
    wheel_angular_velocity = lengthdir_x(car_angular_velocity, -90 * i);

    // Calculate rolling and sideways components
    var angle = -90 * i + image_angle; // Adjust the angle based on the image_angle of the car
    var rolling_component = lengthdir_x(point_distance(0, 0, wheel_velocity[0], wheel_velocity[1]), angle);
    var sideways_component = lengthdir_y(point_distance(0, 0, wheel_velocity[0], wheel_velocity[1]), angle);

    // Calculate wheel frictions
    wheel_forward_friction = wheel_friction_coefficient * wheel_normal_force;
    wheel_sideways_friction = wheel_friction_coefficient * wheel_normal_force * 2;

    // Apply friction forces
    var friction_force = [wheel_forward_friction * rolling_component, wheel_sideways_friction * sideways_component];
    var friction_torque = wheel_sideways_friction * sideways_component * car_mass;
    car_velocity[0] -= friction_force[0] / car_mass;
    car_velocity[1] -= friction_force[1] / car_mass;
    car_angular_velocity -= friction_torque / (car_mass * car_mass * 0.5);

    // Calculate drift magnitude
    drift_magnitude += abs(sideways_component);
}



//--------------------//
// STEAM
steam_set_stat_int("total_distance", steam_get_stat_int("total_distance") + 1);
//--------------------//








