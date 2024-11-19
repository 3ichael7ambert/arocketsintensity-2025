/// @description Insert description here
// You can write your code in this editor


image_angle=direction-90;


x_dist1=(x-room_width/2)/50;
y_dist1=(y-room_height/2)/50;
x_dist=x_dist1;
y_dist=y_dist1;
//if sb_p1.y>self.y then {depth-=y;} else {depth=0;}
//if sb_p1.y<self.y then {depth-=y;}
//depth=distance_to_point(room_width,room_height);

//vspeed=__background_get( e__BG.VSpeed, 0 );
if x_dist1>10 then
{
x_dist=10;
}
if x_dist1<-10 then
{
x_dist=-10;
}


if y_dist1>10 then
{
y_dist=10;
}
if y_dist1<-10 then
{
y_dist=-10;
}





y-=o_menuMain.roomSpeed;





if level=4 then visible=true else visible=false;
//move_wrap(true, true, sprite_width);

if y<-300 instance_destroy();
action_wrap();


