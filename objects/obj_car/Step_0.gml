/// @description Control player
sPlayer_carcontrol();

///Particle system
sPlayer_partice_step();

///Smooth camera
scr_smoothcam(obj_car);

if !keyboard_check(ord("A"))
{
		instance_destroy();
}
	