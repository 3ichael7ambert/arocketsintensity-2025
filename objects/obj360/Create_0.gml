/// @description Insert description here
// You can write your code in this editor


randomize();

application_surface_draw_enable(false);
deltaT = 0;
shader = 0;

surf=-1;
surf2=-1;
surf3=-1;
if instance_exists(objLevel) {
width360=objLevel.width360;
height360=objLevel.height360;
}
if instance_exists(objLevelSide) {
width360=objLevelSide.width360;
height360=objLevelSide.height360;
}

camera_set_view_size(view_camera[0], width360, height360);

if instance_exists(objPlane)
{
target=objPlane;
} else {
	target = noone;
}



/////STARS
x_follow = 0.9;
y_follow = 0.9;
x_speed = -0.2;
y_speed = 0;
colour = c_white;
alpha = 1;

previous_xview = __view_get( e__VW.XView, 0 );
previous_yview = __view_get( e__VW.YView, 0 );
x1=x;
y1=y;
x2=x;
y2=y;
x3=x;
y3=y;
x4=x;
y4=y;
x5=x;
y5=y;