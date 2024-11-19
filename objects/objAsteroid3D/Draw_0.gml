/// @description Insert description here
// You can write your code in this editor

gpu_set_zwriteenable(true);
 //gpu_set_ztestenable(true);

draw_sprite_3d_ext(sprite_index,image_index,xx,yy,zz,rotx,roty,rotz,scale,c_gray,image_angle);

gpu_set_zwriteenable(false);
 gpu_set_ztestenable(false);
 











