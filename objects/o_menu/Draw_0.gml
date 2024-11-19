/// @description Insert description here
// You can write your code in this editor


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

*/

//////////////////////////////////

//draw
draw_sprite_ext(sprite_index,image_index,x,y,width/sprite_width,height/sprite_height,0,c_white,1);


var _new_w = 0;
for (var i=0; i<op_length; i++;)
{
	var _op_w = string_width(option[i]);
	_new_w = max(_new_w, _op_w);
	
}

width=_new_w + op_border*2;
height = op_border*2 + sprite_get_height(spr_main_font) + (op_length-1)*op_space;


//center menu
x = camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0])/2 - width/2;
y = camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0])/2 - width/2;

//draw the options
//draw_set_font
draw_set_valign(fa_top);
draw_set_halign(fa_left);

for (var i=0; i<op_length; i++;)
{
	var _c = c_black;
	if pos == i { _c =c_yellow;}
	//draw_set_color(c_black);
	//draw_text(x+op_border,y+op_border+op_space*i, option[i]);
	draw_text_color(x+op_border,y+op_border+op_space*i, option[i],_c,_c,_c,_c,1);
	
	
}

// DRAW SHIP
var shipSprite;
var shipSprite2;
var shipAngle;
var img_count;

switch (ship) {
    case 0:
        shipSprite = sprShip;
		shipSprite2 = -1;
        shipAngle = 270;
        break;
    case 1:
        shipSprite = sprUFO2;
		shipSprite2 = -1;
        shipAngle = 0;
        break;
    case 2:
        shipSprite = sprScrew;
		shipSprite2 = sprRocketMetal;
        shipAngle = 0;
        break;
    case 3:
        shipSprite = sprCan;
		shipSprite2 = -1;
        shipAngle = 0;
        break;
    // Add more cases if needed
    
    default:
        shipSprite = -1; // Handle invalid ship values
        break;
}
if shipSprite2 != -1 {
	draw_sprite_ext(shipSprite2, 0, room_width / 2 +100  , room_height / 4, 0.5, 0.5, shipAngle, c_white, 1);
}
if (shipSprite != -1) {
    draw_sprite_ext(shipSprite, 0, room_width / 2  , room_height / 4, 0.5, 0.5, shipAngle, c_white, 1);
}


//DRAWN LEVEL
// Define the level names in an array
var level_names = [
    "SKY", "SPACE", "AERIAL", "CITYSCAPE", "MOONWALK", "ASTEROIDS",
    "BEACH", "FOREST", "OCEANA", "DESERT", "SKYLINE", "FOREST SIDE",
    "JUNGLE SIDE", "RAINBOW FOREST", "BLIZZARD", "SKETCHBOOK", "COMIC",
    "PIXEL", "MOON LANDING", "WORMHOLE", "3D", "ASTEROID BALL", "UFO PINBALL",
    "HYPER DRIVE", "DISCO"
];

//DRAWN LEVEL
if (level >= 0 && level <= 24) {
    var levelName = level_names[level];
    draw_text_outlined(room_width / 2 - (string_width(levelName) / 2 ), room_height / 4 , levelName, c_white, c_black);
}



	
	//scr_draw_border_text(x, y, text, color, border, thickness, alpha)
