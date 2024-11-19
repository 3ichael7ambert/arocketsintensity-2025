action_inherited();
///Set variables
image_angle = 0;
image_speed = 0;
gravity = 0.05;
max_speed = 6;
friction = 0.025;
rotate = 3;
boost_rotate = 1;
shoot_cooldown = 0;
boosting = true;
image_angle = irandom(180)*2;
alarm[0] = irandom_range(room_speed, room_speed*10);
target = objPlane;
z=0;

var ship_type;
ship_type=random(2);
sprite_index=choose(sprUFO,sprUFO2);

if (level>=0&&level<=14) || (level=16) || (level>=18){
	scale=.25;
	ship_style=choose(0,1,2,4);
}
if level=15 { //SKETCH
	ship_style=choose(0,1,2,3,4,5);
	scale=.2;}
if level=17 {//pixel
	ship_style=choose(0,1,3);
	scale=1;
	}
// colors
color1 = make_color_rgb(random(255),random(255),random(255));
color2 = make_color_rgb(random(255),random(255),random(255));
color3 = make_color_rgb(random(255),random(255),random(255));

