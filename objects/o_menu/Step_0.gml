/// Initialize

//GMLive
//if (live_call()) return live_result;

/*
LEVELS
0 Sky -gravity
1 space -no gravity
2  sky top- no gravity
3 city top - no gravity
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

PONG dodge
pixel battle
protect moon
pixel asteroids
sketch battle
3d battle
3d asteroids
3d sketch asteroids
3d sketch battle
3d pixel asteroids
3d pixel battle

*/

if level>24 then level=0;
if level<0 then level=24;

// Check if gamepad is connected
if gamepad_is_connected(0) {
    // Gamepad is plugged in, set controls to gamepad
    // Use gamepad inputs for navigation and selection
    var kUp = gamepad_button_check_pressed(0, gp_padu);
	up_key = gamepad_button_check_pressed(0, gp_padu);
    var kDown = gamepad_button_check_pressed(0, gp_padd);
	var kRight = keyboard_check_pressed(gp_padr)
	var kLeft = keyboard_check_pressed(gp_padl)
	down_key = gamepad_button_check_pressed(0, gp_padd);
    var kEnter = gamepad_button_check_pressed(0, gp_face1);
	accept_key = gamepad_button_check_pressed(0, gp_face1);
    
}
else {
    // Gamepad is not connected, set controls to keyboard
    // Use keyboard inputs for navigation and selection
    var kUp = keyboard_check_pressed(k_up);
    var kDown = keyboard_check_pressed(k_down);
	var kRight = keyboard_check(k_right);
	var kLeft = keyboard_check_pressed(k_left)
    var kEnter = keyboard_check_pressed(k_enter);
	//store number of options in current menu
	up_key = keyboard_check_pressed(vk_up);
	down_key = keyboard_check_pressed(vk_down);
	accept_key = keyboard_check_pressed(vk_enter);
}
//screw
//screw animation
/*
for (var i=0; i<=7; i++;)
{
	screw+=1;
}
if screw>7 {screw=0;}
screw+=1;
*/

//if  kRight then level+=1;
//if kLeft then level-=1;
/*
if kEnter and option=2 {level+=1}

if kEnter and level = 0 and option=0 then room_goto(r_level);
if kEnter and level = 1 and option=0 then room_goto(r_level);
if kEnter and level = 2 and option=0 then room_goto(r_level);
if kEnter and level = 3 and option=0 then room_goto(rm_City);
if kEnter and level = 4 and option=0 then room_goto(r_level);
if kEnter and level = 5 and option=0 then room_goto(r_level);
if kEnter and level = 6 and option=0 then room_goto(r_level);
if kEnter and level = 7 and option=0 then room_goto(r_level);
if kEnter and level = 8 and option=0 then room_goto(r_level);
*/
//health-=1;


if off_on =0 { offline="Offline"; 
option[3]="Offline"; }
if off_on =1 { offline="Online"; 
option[3]="Online";}
if off_on =1 { offline="Local 2P"; 
option[3]="Local 2P";}
if off_on>2 then off_on=0;


	op_length=array_length(option);

pos += down_key - up_key;
if pos >= op_length {pos = 0};
if pos < 0 {pos = op_length-1};


if kEnter && pos=0
{room_goto(r_level);}

if accept_key 
{
	
switch(pos) {
	case 0: 
		if level>=0 && level<3 {room_goto(r_level)}; //SKY SPACE SKY-TOP
		if level=3 then {room_goto(rm_City)}; // CITY
		if level=4 then {room_goto(r_levelMoon)}; //MOON GRAVITY
		if level=5 then {room_goto(r_asteroids)}; //ASTEROIDS
		if level>=6 && level<=8 {room_goto(r_level)}; //DESERT FOREST OCEAN /TOP
		if level>=9 && level<=12 {room_goto(r_levelSide)}; // DESER CITY FOREST JUNGLE /SIDE
		if level>=13 && level<=17 {room_goto(r_level)}; //RAINBOWFOREST, SNOW, SKETCH, COMIC, PIXEL
		if level>=18 && level<=19 then {room_goto(rm_moon360)}; //LILPLANET-MOON WORMHOLE
		if level=20 then {room_goto(rm_asteroid3D)}; //3D asteroids
		if level=21 then {room_goto(r_asteroidsBall)}; //SOCCER ASTEROIDS
		if level=22 then {room_goto(rm_pinball)}; //UFO PINBALL
		if level=23 then {room_goto(r_hyperDrive)}; //TRON HYPERDRIVE
		if level=24 then {room_goto(r_danceFloor)}; //DANCEFLOOR DISCO
		
		
		
		
		/*
LEVELS
0 Sky -gravity
1 space -no gravity
2  sky top- no gravity
3 city top - no gravity
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
24 -DANCE FLOOR
*/

		break;
	
	
	case 1:ship+=1; break;
	case 2:	level+=1; break;
	case 3: off_on+=1; break;
	case 4: break;
	case 5: exit; break;
}
}

if ship>3 then ship=0;