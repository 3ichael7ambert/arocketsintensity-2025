/// @description Draw layer


if level=16 {
	
	
	//draw_background_tiled_ext(image, x, y, 1, 1, colour, alpha);


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
//draw surface
draw_surface_tiled(surf,x,y);





//Create Surface    2
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
//draw surface
draw_surface_tiled(surf2,x,y);




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
//draw surface
draw_surface_tiled(surf3,x,y);





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
//draw surface
draw_surface_tiled(surf4,x,y);






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
draw_sprite_tiled(sprOceanOld,-1,x,y);
draw_sprite_tiled(sprAerialView4,0,x,y);
draw_sprite_tiled(sprAerialView5,0,x,y);
draw_sprite_tiled(sprAerialView6,0,x,y);

gpu_set_colorwriteenable(1,1,1,0);
//reset target
surface_reset_target();
//draw surface
draw_surface_tiled(surf5,x,y);




/*
gpu_set_blendmode(bm_dest_alpha);
// Draw a mask sprite with alpha 0 over the area to be masked
draw_sprite_tiled_ext(sprComic, 2, x, y,1,1,bgColor1,1);
// Set the blend mode back to normal
gpu_set_blendmode(bm_normal);
// Draw the tiled background over the masked area
draw_background_tiled_ext(backCloudLayer1, x, y, 1, 1, c_white, 1);
//draw_background_tiled_ext(parallax_layer2, x, y, 1, 1, c_white, 1);
//draw_background_tiled_ext(parallax_layer3, x, y, 1, 1, c_white, 1);

	
	


gpu_set_blendmode(bm_dest_alpha);
// Draw a mask sprite with alpha 0 over the area to be masked
draw_sprite_tiled_ext(sprComic, 2, x, y,1,1,bgColor2,1);
// Set the blend mode back to normal
gpu_set_blendmode(bm_normal);
// Draw the tiled background over the masked area
draw_background_tiled_ext(backCloudLayer1, x, y, 1, 1, c_white, 1);
//draw_background_tiled_ext(parallax_layer2, x, y, 1, 1, c_white, 1);
//draw_background_tiled_ext(parallax_layer3, x, y, 1, 1, c_white, 1);


gpu_set_blendmode(bm_dest_alpha);
// Draw a mask sprite with alpha 0 over the area to be masked
draw_sprite_tiled_ext(sprComic, 3, x, y,1,1,bgColor3,1);
// Set the blend mode back to normal
gpu_set_blendmode(bm_normal);
// Draw the tiled background over the masked area
draw_background_tiled_ext(backCloudLayer1, x, y, 1, 1, c_white, 1);
//draw_background_tiled_ext(parallax_layer2, x, y, 1, 1, c_white, 1);
//draw_background_tiled_ext(parallax_layer3, x, y, 1, 1, c_white, 1);



gpu_set_blendmode(bm_dest_alpha);
// Draw a mask sprite with alpha 0 over the area to be masked
draw_sprite_tiled_ext(sprComic, 4, x, y,1,1,bgColor4,1);
// Set the blend mode back to normal
gpu_set_blendmode(bm_normal);
// Draw the tiled background over the masked area
draw_background_tiled_ext(backCloudLayer1, x, y, 1, 1, c_white, 1);
//draw_background_tiled_ext(parallax_layer2, x, y, 1, 1, c_white, 1);
//draw_background_tiled_ext(parallax_layer3, x, y, 1, 1, c_white, 1);



gpu_set_blendmode(bm_dest_alpha);
// Draw a mask sprite with alpha 0 over the area to be masked
draw_sprite_tiled_ext(sprComic, 5, x, y,1,1,bgColor5,1);
// Set the blend mode back to normal
gpu_set_blendmode(bm_normal);
// Draw the tiled background over the masked area
draw_background_tiled_ext(backCloudLayer1, x, y, 1, 1, c_white, 1);
//draw_background_tiled_ext(parallax_layer2, x, y, 1, 1, c_white, 1);
//draw_background_tiled_ext(parallax_layer3, x, y, 1, 1, c_white, 1);

	
*/
}

