/// @description Create objects
randomize();
//Player Color
color1 = make_color_rgb(random(255),random(255),random(255));
color2 = make_color_rgb(random(255),random(255),random(255));
color3 = make_color_rgb(random(255),random(255),random(255));

p1lives=3;
gui_pad=32;
///DEBUG
globalvar level,ship;
level=20;
ship=0;
////


playerScale=.2;


with (instance_create(0, 0, objCamera3D))
{	
    target = instance_create(__view_get( e__VW.WView, 0 )/2, __view_get( e__VW.HView, 0 )/2, objPlane3D);
	}
	

target=objPlane3D;

//STARS
for (var i=0; i<20; i++){
	instance_create(random(room_width),random(room_height),objStar3D);
}

//physics_world_create(.1/32);

/*
LEVELS
0 Sky -gravity
1 space -no gravity
2  sky top- no gravity
3 city top - gravity
4 moon - gravity
5 asteroids
6 desert beach
7 forest top - no gravity
8-ocean top
9 desert side
10 city side - no gravity
11 forest side - gravity
12 Jungle side
13 RAINBOW
14 Snow
15 Sketchbook
16 Comic
17 Pixel
18 ROUND MOON
19 Worm hole
20 3D World
21 Asteroid Ball (soccer)
22 ALIEN UFO PINBALL
23 Hyper Drive - Tron

*/
	alarm[0]=room_speed/2;



//RAGDOLL
global.cur_rag = 1;

kills=0;