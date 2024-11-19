/// @function           halftone_set_noise(noise_spr, noise_scale, noise_amp);
/// @param {real}		noise_spr Sprite index of noise texture
/// @param {real}		noise_scale Scale of noise texture (in pixels)
/// @param {real}		noise_amp  Noise amplitude (0 = no noise, 1 = full noise)
/// @description        Update halftone noise parameters

function halftone_set_noise(noise_spr = t_noise_texture, noise_scale = 1 / v_noise_scale, noise_amp = v_noise_amplitude)
{
	if (noise_spr>=0) t_noise_texture = sprite_get_texture(noise_spr, 0);
	
	v_noise_scale = 1 / noise_scale;
	v_noise_amplitude = noise_amp;
}