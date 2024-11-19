/// @description Insert description here
// You can write your code in this editor

zz+=zspeed;
xx=x;
yy=y;
x+=hspd;
y+=hspd;

if zz<-300 {
	zspeed=-zspeed;
}
if zz>300 {
	zspeed=-zspeed;
}

if (hp<0) instance_destroy();


image_speed=.2;

















