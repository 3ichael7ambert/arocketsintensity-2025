/// @description Insert description here
// You can write your code in this editor


/// @description  DRAW THE BOTTOM AND THE SIDES IN THE DRAW EVENT
//  SO THAT THEY WILL NOT COVER THE TOP OF OTHER CUBES

//draw_self();

// LEFT
draw_sprite_pos(sprStreetLamp,2,x-8,y-8,x-8-hdepth,y-8-vdepth,x-8-hdepth,y+8-vdepth,x-8,y+8,1);

// RIGHT
draw_sprite_pos(sprStreetLamp,2,x+8,y-8,x+8-hdepth,y-8-vdepth,x+8-hdepth,y+8-vdepth,x+8,y+8,1);

// TOP
draw_sprite_pos(sprStreetLamp,3,x-8-hdepth,y-8-vdepth,x+8-hdepth,y-8-vdepth,x+8,y-8,x-8,y-8,1);

// BOTTOM
draw_sprite_pos(sprStreetLamp,1,x-8-hdepth,y+8-vdepth,x+8-hdepth,y+8-vdepth,x+8,y+8,x-8,y+8,1);

