/// @description Insert description here
// You can write your code in this editor


//draw_text(x+10,y+10,turbo);
//draw_text(x+20,y+20,speed);
draw_self();
switch (ship)
{
case 0:
sprite_index=sprShip;
draw_sprite_ext(sprShip_body,image_index,x,y,scale,scale,image_angle,color1,1);
draw_sprite_ext(sprShip_wings,image_index,x,y,scale,scale,image_angle,color2,1);
break;

case 1:
sprite_index=sprUFO2;
draw_sprite_ext(spr_UFO_body,image_index,x,y,scale,scale,image_angle,color1,1);
draw_sprite_ext(spr_UFO_lights,image_index,x,y,scale,scale,image_angle,color2,1);
draw_sprite_ext(sprUFOoutline,image_index,x,y,scale,scale,image_angle,color2,1);
break;

case 2:
sprite_index=sprRocketMetal;
//
var cx, cy, crad, clen, cdir, cnext, nx, ny;
// retrieve variables for later use:
cx = x;
cy = y;
crad = 50; // Adjust the radius value as per your requirements
// find "length" of circle:
clen = crad * pi * 2;
// find current angle on circle:
cdir = point_direction(cx, cy, x, y);//image_angle+180;
// find next angle on circle:
cnext = cdir + (3 * 360) / clen;
// find coordinates of next point:
nx = cx + lengthdir_x(crad, cnext);
ny = cy + lengthdir_y(crad, cnext);


// screw animation
screw += 1;
if (screw > 7)
    screw = 0;

// draw sprites
draw_sprite_ext(sprRocketMetal, image_index, x, y, scale, scale, image_angle, color1, 1);
draw_sprite_ext(sprScrew, screw, nx, ny, scale, scale, image_angle, color2, 1);
draw_sprite_ext(sprRocketMetal, image_index, x, y, scale, scale, image_angle, color2, 1);
break;



case 3:
sprite_index=sprCan;
draw_sprite_ext(sprCan,image_index,x,y,scale,scale,image_angle,c_white,1);
draw_sprite_ext(sprCan,image_index,x,y,scale,scale,image_angle,c_white,1);
break;

}



//draw_text(x+10,y+10,depth);

//drift
//part_system_drawit(drift);