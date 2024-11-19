/// @description Draw layer


if level=16 {
	if (!surface_exists(surfF)){
    surfF = surface_create(sprite_width,sprite_height);
}
draw_sprite_ext(sprComic,6,0,0,1,1,0,c_white,1);
//draw overlay
gpu_set_colorwriteenable(1,1,1,1);

surface_reset_target();

	//Create Surface
if (!surface_exists(surf)){
    surf = surface_create(sprite_width,sprite_height);
}

//Set Target
surface_set_target(surf);
//Draw Sprite
draw_sprite_ext(sprComic,1,0,0,1,1,0,bgColor1,1);
//draw overlay
gpu_set_colorwriteenable(1,1,1,0);
draw_sprite_tiled(backCloudLayer1,0,x,y);
draw_sprite_tiled(backCloudLayer2,0,x,y);
draw_sprite_tiled(backCloudLayer3,0,x,y);
gpu_set_colorwriteenable(1,1,1,0);

//reset target
surface_reset_target();

//Create Surface 2
if (!surface_exists(surf2)){
    surf2 = surface_create(sprite_width,sprite_height);
}
//Set Target
surface_set_target(surf2);
//Draw Sprite
draw_sprite_ext(sprComic,2,0,0,1,1,0,bgColor2,1);
//draw overlay
gpu_set_colorwriteenable(1,1,1,0);
draw_sprite_tiled(backStars1,0,x,y);
draw_sprite_tiled(backStars2,0,x,y);
draw_sprite_tiled(backStars4,0,x,y);
draw_sprite_tiled(backStars5,0,x,y);
draw_sprite_tiled(backStars3,0,x,y);
gpu_set_colorwriteenable(1,1,1,0);

//reset target
surface_reset_target();

//Create Surface 3
if (!surface_exists(surf3)){
    surf3 = surface_create(sprite_width,sprite_height);
}
//Set Target
surface_set_target(surf3);
//Draw Sprite
draw_sprite_ext(sprComic,3,0,0,1,1,0,bgColor3,1);
//draw overlay
gpu_set_colorwriteenable(1,1,1,0);
draw_sprite_tiled(sprAerialView1,0,x,y);
draw_sprite_tiled(sprAerialView2,0,x,y);
draw_sprite_tiled(sprAerialView3,0,x,y);
draw_sprite_tiled(sprAerialView4,0,x,y);
draw_sprite_tiled(sprAerialView5,0,x,y);
draw_sprite_tiled(sprAerialView6,0,x,y);
gpu_set_colorwriteenable(1,1,1,0);

//reset target
surface_reset_target();

//Create Surface 4
if (!surface_exists(surf4)){
    surf4 = surface_create(sprite_width,sprite_height);
}
//Set Target
surface_set_target(surf4);
//Draw Sprite
draw_sprite_ext(sprComic,4,0,0,1,1,0,bgColor4,1);
//draw overlay
gpu_set_colorwriteenable(1,1,1,0);
draw_sprite_tiled(sprBeach,0,x,y);
draw_sprite_tiled(sprAerialView4,0,x,y);
draw_sprite_tiled(sprAerialView5,0,x,y);
draw_sprite_tiled(sprAerialView6,0,x,y);
gpu_set_colorwriteenable(1,1,1,0);

//reset target
surface_reset_target();

//Create Surface 5
if (!surface_exists(surf5)){
    surf5 = surface_create(sprite_width,sprite_height);
}
//Set Target
surface_set_target(surf5);
//Draw Sprite
draw_sprite_ext(sprComic,5,0,0,1,1,0,bgColor5,1);
//draw overlay
gpu_set_colorwriteenable(1,1,1,0);
draw_sprite_tiled(sprOceanOld,0,x,y);
draw_sprite_tiled(sprAerialView4,0,x,y);
draw_sprite_tiled(sprAerialView5,0,x,y);
draw_sprite_tiled(sprAerialView6,0,x,y);

gpu_set_colorwriteenable(1,1,1,0);
//reset target
surface_reset_target();
//draw surface





draw_surface_tiled(surfF,x,y);



}

