/// @function           halftone_initialize(noise_spr, paper_spr, contrast, brightness, scale, noise_scale, noise_amp);
/// @param {real}		noise_spr Sprite index of noise texture
/// @param {real}		paper_spr Sprite index of paper texture
/// @param {real}		scale Scale of halftone pattern (in pixels)
/// @param {real}		contrast Contrast adjustment (higher = greater contrast)
/// @param {real}		brightness Brightness adjustment (higher = brighter)
/// @param {real}		noise_scale Scale of noise texture (in pixels)
/// @param {real}		noise_amp  Noise amplitude (0 = no noise, 1 = full noise)
/// @description        Initialize halftone uniforms and values

function halftone_initialize(noise_spr = -1, paper_spr = -1, scale = 8, contrast = 1, brightness = 1, noise_scale = 128, noise_amp = 0.2)
{
	//General uniforms
	u_texel		= shader_get_uniform(shd_halftone, "u_texel");
	u_position	= shader_get_uniform(shd_halftone, "u_position");
	u_scale		= shader_get_uniform(shd_halftone, "u_scale");
	u_contrast	= shader_get_uniform(shd_halftone, "u_contrast");

	//Noise uniforms
	u_noise_amplitude = shader_get_uniform(shd_halftone, "u_noise_amplitude");
	u_noise_scale = shader_get_uniform(shd_halftone, "u_noise_scale");
	u_noise_texture = shader_get_sampler_index(shd_halftone, "u_noise_texture");
	//Enable filtering and repeat
	gpu_set_tex_filter_ext(u_noise_texture, true);
	gpu_set_tex_repeat_ext(u_noise_texture, true);

	//CMYK shift uniforms
	u_cmyk_angles = shader_get_uniform(shd_halftone, "u_cmyk_angles");
	u_cmyk_shift = shader_get_uniform(shd_halftone, "u_cmyk_shift");

	//Ink color uniforms
	u_color_ink_c = shader_get_uniform(shd_halftone, "u_color_ink_c");
	u_color_ink_m = shader_get_uniform(shd_halftone, "u_color_ink_m");
	u_color_ink_y = shader_get_uniform(shd_halftone, "u_color_ink_y");
	u_color_ink_k = shader_get_uniform(shd_halftone, "u_color_ink_k");
	
	//Set textures
	t_noise_texture = -1;
	if (sprite_exists(noise_spr)) t_noise_texture = sprite_get_texture(noise_spr, 0);
	s_paper_texture = -1;
	if (sprite_exists(paper_spr)) s_paper_texture = paper_spr;
	
	//Initialize default values
	v_scale = scale;
	v_contrast = contrast;
	v_brightness = brightness / 2;
	
	v_noise_scale = 1 / noise_scale;
	v_noise_amplitude = noise_amp;
	
	v_cmyk_shift = 2;
	v_cmyk_angles = [degtorad(20), degtorad(160), degtorad(95), degtorad(320)];
	
	v_color_ink_c = [1,0,0];
	v_color_ink_m = [0,1,0];
	v_color_ink_y = [0,0,1];
	v_color_ink_k = [1,1,1];
}