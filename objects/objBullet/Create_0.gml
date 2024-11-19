/// @description Set variables
weapon=0;
decay = room_speed*2;
speed = 10;
min_speed = 5;
damage = 60;



//--------------------//
// STEAM
steam_set_stat_int("shots_fired", steam_get_stat_int("shots_fired") + 1);
//--------------------//



//weapon type
//rotate bullet
if objPlane.weapon=0 then
{
sprite_index=sprBullet;
weapon=0;
image_xscale=.25;
image_yscale=.25;
direction=objPlane.direction;

}

if objPlane.weapon=1 then
{
sprite_index=sprLaserShot;
weapon=1;
image_xscale=.25;
image_yscale=.25;
direction=objPlane.direction;
image_angle=direction;
}

if objPlane.weapon=2 then
{
sprite_index=sprCircles;
weapon=2;
image_xscale=.25;
image_yscale=.25;
direction=objPlane.direction;
}

if objPlane.weapon=3 then
{
sprite_index=sprTriangles;
weapon=3;
image_xscale=.25;
image_yscale=.25;
direction=objPlane.direction;
}

if objPlane.weapon=4 then
{
sprite_index=choose(sprSquares,sprSquares2);
weapon=4;
image_xscale=.25;
image_yscale=.25;
direction=objPlane.direction;
}

if objPlane.weapon=5 then
{
sprite_index=sprRocketSpin;
weapon=5;
image_xscale=.05;
image_yscale=.05;
direction=objPlane.direction;
//HOMING
target = instance_nearest(x, y, objEnemy);

}

//if objPlane.weapon=0



