/// @description Insert description here
// You can write your code in this editor


//draw_self();
if ship_style=1{
sprite_index=sprRealShip;
	draw_sprite_3d_ext(sprRealShip,image_index,xx,yy,zz,rotx,rotyy,rotz,scale,c_white,image_angle);
}
if ship_style=2{
sprite_index=sprRealUFO;
	draw_sprite_ext(sprRealUFO,image_index,x,y,scale,scale,image_angle,c_white,1);
}
if ship_style=3{
sprite_index=sprRealShip;
	draw_sprite_3d_ext(sprRealShip,image_index,xx,yy,zz,rotx,rotyy,rotz,scale,c_white,image_angle);
}
if ship_style=4{
sprite_index=sprRealUFO;
	draw_sprite_ext(sprRealUFO,image_index,x,y,scale,scale,image_angle,c_white,1);
}

