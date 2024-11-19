/// @description  DRAW THE BOTTOM AND THE SIDES IN THE DRAW EVENT
//  SO THAT THEY WILL NOT COVER THE TOP OF OTHER CUBES

draw_self();
ysize=sprite_height;//*image_yscale;
xsize=sprite_width;//*image_xscale;

// LEFT
draw_sprite_pos(sprBuildingSide,0,x,y,x-hdepth,y-vdepth,x-hdepth,y+ysize-vdepth,x,y+ysize,1);

// RIGHT
draw_sprite_pos(sprBuildingSide,0,x+xsize,y,x+xsize-hdepth,y-vdepth,x+xsize-hdepth,y+ysize-vdepth,x+xsize,y+ysize,1);

// TOP
draw_sprite_pos(sprBuildingSide,0,x-hdepth,y-vdepth,x+xsize-hdepth,y-vdepth,x+xsize,y,x,y,1);

// BOTTOM
draw_sprite_pos(sprBuildingSide,0,x-hdepth,y+ysize-vdepth,x+xsize-hdepth,y+ysize-vdepth,x+xsize,y+ysize,x,y+ysize,1);

draw_text(x,y,sprite_width);
draw_text(x,y+20,image_xscale);