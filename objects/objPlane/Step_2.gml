action_inherited();
///Control
// Check if gamepad is connected
if gamepad_is_connected(0) {
    // Gamepad is plugged in, set controls to gamepad
    // Use analog stick axis for movement
    var axislh_value = gamepad_axis_value(0, gp_axislh);
    var axislv_value = gamepad_axis_value(0, gp_axislv);
    var kShoot = gamepad_button_check_pressed(0, gp_face1);
    var kRocket = gamepad_button_check_pressed(0, gp_face2);
    var kTurob = gamepad_button_check(0, gp_shoulderl);
    var right_stick_x = gamepad_axis_value(0, gp_axisrh);
    var right_stick_y = gamepad_axis_value(0, gp_axisrv);

    kLeft = axislh_value < -0.5;
    kRight = axislh_value > 0.5;
    kUp = axislv_value < -0.5;
    kDown = axislv_value > 0.5;
    
    if (right_stick_x != 0 || right_stick_y != 0) {
        var target_direction = point_direction(0, 0, right_stick_x, -right_stick_y);
        var angle_diff = target_direction - image_angle;
        
        if (angle_diff > 180) {
            angle_diff -= 360;
        } else if (angle_diff < -180) {
            angle_diff += 360;
        }
        
        var rotation_speed = 5; // Adjust the rotation speed as needed
        
        if (abs(angle_diff) < rotation_speed) {
            image_angle = target_direction;
        } else {
            image_angle += sign(angle_diff) * rotation_speed;
        }
    }
}
else {
    // Gamepad is not plugged in, set controls to keyboard
    // Use arrow keys for movement
    kLeft = keyboard_check(k_left);
    kRight = keyboard_check(k_right);
    kUp = keyboard_check(k_up);
    kDown = keyboard_check(k_down);
    
    var kShoot = keyboard_check_pressed(k_shoot);
    var kRocket = keyboard_check_pressed(k_rocket);
    var kTurbo = keyboard_check(k_turbo);
}

//turbo
if speed>maxspeed then speed=maxspeed;
if (kTurbo) && (kUp) && fuel>0 then
{
	turbo+=.05;
	maxspeed=20;
	fuel-=5;
}
if !(kTurbo) then
{
	turbo=0;
	maxspeed=10;
}

if turbo>5 then turbo=5;
//Boosting
if (kUp)
{
    motion_add(image_angle, speedSet+turbo);
    var rot = boost_rotate;
    instance_create(x, y, objTrail);
}
else
{
    var rot = rotate;
}

//Rotating
if (kLeft || kRight)
{
    if (kLeft)
    {
        image_angle += rot;
        if (image_angle > 360)
        {
            image_angle -= 360;
        }
    }
    if (kRight)
    {
        image_angle -= rot;
        if (image_angle < 0)
        {
            image_angle += 360;
        }
    }
    image_index = (image_angle/360)*image_number;
}

//Firing
if (shoot_cooldown <= 0)
{
    if (kShoot)
    {
        var a;
        a = instance_create(x, y, objPlaneFire);
        a.parent = id;
        a.image_angle = image_angle;
        a = instance_create(x, y, objBullet);
        a.direction = image_angle;
        a.hspeed += hspeed;
        a.vspeed += vspeed;
        shoot_cooldown = 10;
    }
}
shoot_cooldown--;

if (rocket_cooldown <= 0)
{
    if (kRocket)
    {
        var a;
        a = instance_create(x, y, objPlaneFire);
        a.parent = id;
        a.image_angle = image_angle;
        a = instance_create(x, y, objMissile);
        a.direction = image_angle;
        a.hspeed += hspeed;
        a.vspeed += vspeed;
        rocket_cooldown = 50;
    }
}
rocket_cooldown--;



