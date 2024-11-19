/// @description Insert description here
// You can write your code in this editor

speed=random(10);
direction=random(360);
var scale;
scale=random(360)/360;
if scale<.25 then scale+=.25;
if scale>.75 then scale-=.25;
image_xscale=scale-.5;
image_yscale=scale-.5;

depth=1000 + choose(random(500),-random(500));




//Generated for GMS2 in Geon FX v1.3
//Put this code in Create event

//NewEffect Particle System
global.ps = part_system_create();
part_system_depth(global.ps, -1);

//NewEffect Particle Types
//Effect1
global.pt_Effect1 = part_type_create();
part_type_shape(global.pt_Effect1, pt_shape_sphere);
part_type_size(global.pt_Effect1, 1, 3, 0, 0);
part_type_scale(global.pt_Effect1, 1, 1);
part_type_orientation(global.pt_Effect1, 0, 0, 0, 0, 0);
part_type_color3(global.pt_Effect1, 16777215, 16777215, 16777088);
part_type_alpha3(global.pt_Effect1, 0, 0.03, 0);
part_type_blend(global.pt_Effect1, 0);
part_type_life(global.pt_Effect1, 80, 80);
part_type_speed(global.pt_Effect1, 1, 10, 0, 0);
part_type_direction(global.pt_Effect1, direction-1, direction+1, 0, 0);
part_type_gravity(global.pt_Effect1, 0.10, 0);

//NewEffect Emitters
global.pe_Effect1 = part_emitter_create(global.ps);

//NewEffect emitter positions. Streaming or Bursting Particles.
var xp, yp;
xp = x;
yp = y;
part_emitter_region(global.ps, global.pe_Effect1, xp-100, xp+100, yp-100, yp+100, ps_shape_rectangle, ps_distr_gaussian);
part_emitter_stream(global.ps, global.pe_Effect1, global.pt_Effect1, 100);

//Destroying Emitters
//part_emitter_destroy(global.ps, global.pe_Effect1);