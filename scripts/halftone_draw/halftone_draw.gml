/// @function           halftone_draw(surface, x, y, intensity, view);
/// @param {real}		surface Surface id for drawing
/// @param {real}		x Draw x position
/// @param {real}		y Draw y position
/// @param {real}		intensity Halftone effect intensity
/// @param {real}		view Optional view index
/// @description        Draw halftone effect on surface

function halftone_draw(surface, x, y, intensity = 1, view = -1)
{
	//Surface information
	var _tex, _w, _h, _texel_w, _texel_h;
	_tex = surface_get_texture(surface);
	_w = surface_get_width(surface)
	_h = surface_get_height(surface);
	_texel_w = texture_get_texel_width(_tex)
	_texel_h = texture_get_texel_height(_tex);
	
	//Camera offset position
	var _x, _y;
	_x = 0;
	_y = 0;
	
	//If a view is provided, use it
	if (view > -1)
	{
		//View scale x and y
		var _sx, _sy;
		_sx = _w / camera_get_view_width(view_camera[view]);
		_sy = _h / camera_get_view_height(view_camera[view]);
		//Position offset corrected for scale
		_x = camera_get_view_x(view_camera[view]) * _sx;
		_y = camera_get_view_y(view_camera[view]) * _sy;
	}
	
	//Optional paper texture
	if (s_paper_texture >= 0)
	{
		draw_sprite_tiled(s_paper_texture, 0, x-_x, y-_y);
		//Use a multiply blendmode if the paper is drawn
		gpu_set_blendmode_ext(bm_zero, bm_src_color);
	}

	//Apply shader with parameters
	shader_set(shd_halftone);
	shader_set_uniform_f(u_texel, _texel_w, _texel_h);
	shader_set_uniform_f(u_position, _x, _y);
	shader_set_uniform_f(u_scale, v_scale);
	shader_set_uniform_f(u_contrast, v_contrast, v_brightness);
	shader_set_uniform_f(u_noise_scale, v_noise_scale);
	shader_set_uniform_f(u_noise_amplitude, v_noise_amplitude);
		
	shader_set_uniform_f_array(u_color_ink_c, v_color_ink_c);
	shader_set_uniform_f_array(u_color_ink_m, v_color_ink_m);
	shader_set_uniform_f_array(u_color_ink_y, v_color_ink_y);
	shader_set_uniform_f_array(u_color_ink_k, v_color_ink_k);
		
	shader_set_uniform_f_array(u_cmyk_angles, v_cmyk_angles);
	shader_set_uniform_f(u_cmyk_shift, v_cmyk_shift);
	texture_set_stage(u_noise_texture, t_noise_texture);
	
	//Draw surface
	draw_surface(surface, x, y);
	shader_reset();
	
	//Reset blendmode and optional overlay
	gpu_set_blendmode(bm_normal);
	draw_surface_ext(surface, x, y, 1, 1, 0, c_white, 1 - intensity);
}