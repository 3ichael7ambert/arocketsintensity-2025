/// @description Set variables
weapon=0;
decay = room_speed*2;
speed = 10;
min_speed = 5;
damage = 60;


//weapon type
//rotate bullet

sprite_index=sprRocketSpin;
weapon=5;
image_xscale=.05;
image_yscale=.05;
direction=objPlane.direction;
//HOMING
target = instance_nearest(x, y, objEnemy);


//if objPlane.weapon=0



