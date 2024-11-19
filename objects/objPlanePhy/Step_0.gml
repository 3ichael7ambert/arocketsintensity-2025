/*
WEAPONS
0 Bullet
1 Laser Shot
2 Circles
3 Triagles
4 Squares
5 Rockets
6
7

*/
/*
if weapon > 5 then weapon=0;
if weapon<0 then weapon=5;
if keyboard_check(ord("1")) then weapon=0;
if keyboard_check(ord("2")) then weapon=1;
if keyboard_check(ord("3")) then weapon=2;
if keyboard_check(ord("4")) then weapon=3;
if keyboard_check(ord("5")) then weapon=4;
if keyboard_check(ord("6")) then weapon=5;

if k_weaponUp then weapon +=1;
if k_weaponDown then weapon -=1;
*/
//fuel
if fuel<100 then {fuel+=3;}
//moon gravity
if instance_exists(o_moon) then gravity_direction=point_direction(x,y,o_moon.x,o_moon.y);

//map
var _moveDir = direction;
	minimapDir = _moveDir;//for minimap drawing
	
//screw
if screw>7 then screw=0;

//GMLive
if (live_call()) return live_result;


/*
if level=16 {
	if depth>1005 {depth=1005;}
	if depth<995 {depth=995;}
	depth+=depth_add;
}
*/




/*
if keyboard_check(ord("A"))
{
	if !instance_exists(obj_car)
	{
		with (instance_create_depth(x,y,10,obj_car))
		{
			
		}
	}
}
	



if instance_exists(obj_car)
{
	x=obj_car.x;
	y=obj_car.y;
	direction=obj_car.direction;
	image_angle=obj_car.image_angle;
}
*/
//drift
if keyboard_check(ord("Q")){
sPlayer_control();
///Particle system
//sPlayer_partice_step();
///Smooth camera
//scr_smoothcam(objPlane);
}

