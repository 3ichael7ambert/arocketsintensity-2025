action_inherited();
///Set variables
image_angle = 0;
image_speed = 0;
rotate = 5;
boost_rotate = 2;
shoot_cooldown = 0;
rocket_cooldown= 0;
turbo=0;
scale=.25;
maxspeed=10;
fuel=100;
hp=100;
maxhp=100;
screw=0;
spd=1;

// colors
color1 = c_red;//objLevel.color1;
color2 = c_blue;//objLevel.color2;
color3 = c_yellow;//objLevel.color3;
///Set up controls
///The reason for this is to make it easier to
///change the controls
k_up = vk_up;
k_left = vk_left;
k_right = vk_right;
k_down = vk_down;
k_shoot = vk_alt;
k_rocket = vk_space;
//k_weaponUp = ord("z");
//k_weaponDown = ord("x");
k_turbo=vk_control;

weapon=0;

image_xscale=scale;
image_yscale=scale;

/*
if level=1 || level= 2 || level=3 || level=5 || level=6 || level=7 || level=8 || level=9 then gravity=0;
if level=0 || level>=10 then gravity=.1;

if level=4 and !place_free(x,y) {x=random(room_width);y=random(room_height);}




if level=16 {
	depth=1000;
	depth_add=choose(-1,1);
	alarm[0]=60;
}


*/

//drift
//sPlayer_init(5,10);
/// Create Event (obj_car)
car_mass = 100; // Car mass in kilograms
car_velocity = [0,0]; // Car velocity vector
car_angular_velocity = 0; // Car angular velocity

wheel_friction_coefficient = 0.8; // Friction coefficient for wheels
wheel_normal_force = .5; // Normal force on each wheel
/// Step Event (obj_car)
var wheel_forward_friction, wheel_sideways_friction;
var wheel_velocity, wheel_angular_velocity;
drift_magnitude = 0;