
if !surface_exists(surf) {
    surf = surface_create(display_get_width(), display_get_height());
}
surface_set_target(surf);
draw_clear_alpha(c_white, 0);
var lay_id = layer_get_id("Effect_1");
if layer_get_visible(lay_id)
{
    layer_set_visible(lay_id, false);
}
shader_set(FishEye);
    shader_set_uniform_f(shader_get_uniform(FishEye, "apertureAngle"), 272);
    shader_set_uniform_f(shader_get_uniform(FishEye, "lensSize"), 25); //1 also remove the *4 arpeture
	shader_set_uniform_f(shader_get_uniform(FishEye, "aspectRatio"),width360/height360);
	draw_surface(application_surface,0,0);
	shader_reset();

gpu_set_blendmode(bm_subtract);
draw_sprite(sprCircleNegative,0,0,0);
gpu_set_blendmode(bm_normal);


surface_reset_target();
draw_surface(surf,0,0)






if !surface_exists(surf2) {
    surf2 = surface_create(display_get_width()+100, display_get_height());
}


var x_diff = __view_get( e__VW.XView, 0 )-previous_xview;
var y_diff = __view_get( e__VW.YView, 0 )-previous_yview;
x1 += x_diff*x_follow-x_speed;
y1 += y_diff*y_follow-y_speed;
x2 += x_diff*x_follow*.1-x_speed;
y2 += y_diff*y_follow*.1-y_speed;
x3 += x_diff*x_follow*.05-x_speed;
y3 += y_diff*y_follow*.05-y_speed;
x4 += x_diff*x_follow*.07+x_speed;
y4 += y_diff*y_follow*.07+y_speed;
x5 += x_diff*x_follow*.09+x_speed;
y5 += y_diff*y_follow*.09+y_speed;
previous_xview = __view_get( e__VW.XView, 0 );
previous_yview = __view_get( e__VW.YView, 0 );

surface_set_target(surf2);
draw_clear_alpha(c_white, 0);
draw_set_color(make_color_rgb(5,5,15));
draw_rectangle(0,0,width360,height360,0);
draw_set_color(c_black);


draw_background_tiled_ext(backStars4, x3, y3, .25, .25, c_white, 1);
draw_background_tiled_ext(backStars5, x4, y4, .25, .25, c_white, 1);
draw_background_tiled_ext(backStars3, x5, y5, .25, .25, c_white, 1);

surface_reset_target();

/// draw to first surface and clear out old data
surface_set_target(surf);
draw_clear_alpha(c_black, 0);

/// draw distorted surface
shader_set(shdConvex);
shader_set_uniform_f(shader_get_uniform(shdConvex, "apertureAngle"), 90);
shader_set_uniform_f(shader_get_uniform(shdConvex, "lensSize"), 2); //1 also remove the *4 arpeture
shader_set_uniform_f(shader_get_uniform(shdConvex, "aspectRatio"),width360/height360);
draw_surface(surf2,0,0);
shader_reset();


/// clear hole for planet / moon
gpu_set_blendmode(bm_subtract);
draw_sprite(sprCircleNegative,1,0,0);
gpu_set_blendmode(bm_normal);
surface_reset_target();

/// draw the effect
draw_surface(surf, 0, 0);





if !surface_exists(surf3) {
    surf3 = surface_create(display_get_width(), display_get_height());
}

surface_set_target(surf3);
draw_clear_alpha(c_white, 0);

var _color =  shader_get_uniform(shd_fog,"color");
var _time =  shader_get_uniform(shd_fog,"TIME");
var _FogAlpha =  shader_get_uniform(shd_fog,"FogAlpha");
var _FogXSpeed =  shader_get_uniform(shd_fog,"FogXSpeed");
var _FogYSpeed =  shader_get_uniform(shd_fog,"FogYSpeed");
var _FogDensity =  shader_get_uniform(shd_fog,"FogDensity");

// Convert light color to an array
colorArray = array_create(4);
colorArray[0] = (color & $FF) / $FF;			// R
colorArray[1] = ((color >> 10) & $FF) / $FF;	// G
colorArray[2] = ((color >> 16) & $FF) / $FF;	// B
colorArray[3] = ((color >> 24) & $FF) / $FF;	// A

shader_set(shd_fog)
shader_set_uniform_f_array(_color,colorArray);
shader_set_uniform_f(_time,current_time/5000);
shader_set_uniform_f(_FogAlpha,FogAlpha);
shader_set_uniform_f(_FogXSpeed,FogXSpeed);
shader_set_uniform_f(_FogYSpeed,FogYSpeed);
shader_set_uniform_f(_FogDensity,FogDensity);
	draw_surface(application_surface,0,0);
shader_reset();

surface_reset_target();
draw_surface(surf3,0,0)