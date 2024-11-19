/// @description Insert description here
// You can write your code in this editor


draw_self();
if ((level>=0&&level<=14) || (level=16) || (level>=18)) {
if ship_style=1{
sprite_index=sprShip;
draw_sprite_ext(sprShip_body,image_index,x,y,scale,scale,image_angle,color1,1);
draw_sprite_ext(sprShip_wings,image_index,x,y,scale,scale,image_angle,color2,1);
}
if ship_style=2{
sprite_index=sprUFO2;
draw_sprite_ext(spr_UFO_body,image_index,x,y,scale,scale,image_angle,color1,1);
draw_sprite_ext(spr_UFO_lights,image_index,x,y,scale,scale,image_angle,color2,1);
}
if ship_style=3{
sprite_index=sprRocketMetal;
draw_sprite_ext(sprRocketMetal,image_index,x,y,scale,scale,image_angle,color1,1);
draw_sprite_ext(sprRocketMetal,image_index,x,y,scale,scale,image_angle,color2,1);
}
if ship_style=4{
sprite_index=sprCan;
draw_sprite_ext(sprCan,image_index,x,y,scale,scale,image_angle,c_white,1);
draw_sprite_ext(sprCan,image_index,x,y,scale,scale,image_angle,c_white,1);
}
}

if level=15 { //SKETCH
if ship_style=1{
sprite_index=sprSketch_ship;
}
if ship_style=2{
sprite_index=sprSketch_UFO_new;
}
if ship_style=3{
sprite_index=sprSketch_UFO_old;
}
if ship_style=4{
sprite_index=sprSketch_UFO_old_v2;
}
if ship_style=5{
sprite_index=sprSketch_UFO_old_v3;
}
}


if level=17 { //PIXEL
if ship_style=1{
sprite_index=sprPixel_Ship;
draw_sprite_ext(sprPixel_Ship_body,image_index,x,y,scale,scale,image_angle,color1,1);
draw_sprite_ext(sprPixel_Ship_wings,image_index,x,y,scale,scale,image_angle,color2,1);
}
if ship_style=2{
sprite_index=sprPixel_UFO_new;
draw_sprite_ext(sprPixel_UFO_new_body,image_index,x,y,scale,scale,image_angle,color1,1);
draw_sprite_ext(sprPixel_UFO_new_wings,image_index,x,y,scale,scale,image_angle,color2,1);
}
if ship_style=3{
sprite_index=sprPixel_UFO;
}
}