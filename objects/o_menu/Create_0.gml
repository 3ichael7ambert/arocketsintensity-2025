/// @initialize

globalvar level, ship;
level=0;
ship=0;

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
18 3d moon
19 Worm hole
20 3D World
21 Asteroid Ball (soccer)
22 ALIEN UFO PINBALL
23 Hyper Drive - Tron
24 - dancefloor disco


*/
screw=0;

k_right =vk_right;
k_left =vk_left;
k_up=vk_up;
k_down=vk_down;
k_enter=vk_enter;

//health=100;

off_on =0;
offline="Offline";

width=640;
height=640;

op_border=32;
op_space=32;
pos = 0;
//var _c=c_white;

op_length = 0;
menu_level = 0;

option[0]="Start";
option[1]="Ship";
option[2]="Level";
option[3]="Offline";
option[4]="Options";
option[5]="Quit Game";


op_length=array_length(option);

draw_set_font(fnt_monogram);