/// @description sPlayer_carcontrol();
function sPlayer_carcontrol() {
	keys_init(); //edit keys_init script for change controls
	//left
	if key_left{
	phy_rotation-=phy_speed/2
	}
	//right
	if key_right{
	phy_rotation+=phy_speed/2
	}
	//acceleration
	if key_up{
	physics_apply_local_force(0, 0, 0, -250*spd);
	}
	//brake
	if key_down{
	physics_apply_local_force(0, 0, 0, 250*spd);
	}




}
