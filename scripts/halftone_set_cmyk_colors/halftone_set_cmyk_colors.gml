/// @function           halftone_set_cmyk_colors(c_color ,m_color, y_color, k_color);
/// @param {real}		c_color Cyan ink color
/// @param {real}		m_color Magenta ink color
/// @param {real}		y_color Yellow ink color
/// @param {real}		k_color Key (black) ink color
/// @description        Update halftone CMYK ink colors

function halftone_set_cmyk_colors(c_color = $FFFF00, m_color = $FF00FF, y_color = $00FFFF, k_color = $000000)
{
	var _c_r, _c_g, _c_b;
	_c_r = 1-sqrt(color_get_red(c_color)/255);
	_c_g = 1-sqrt(color_get_green(c_color)/255);
	_c_b = 1-sqrt(color_get_blue(c_color)/255);
	
	var _m_r, _m_g, _m_b;
	_m_r = 1-sqrt(color_get_red(m_color)/255);
	_m_g = 1-sqrt(color_get_green(m_color)/255);
	_m_b = 1-sqrt(color_get_blue(m_color)/255);
	
	var _y_r, _y_g, _y_b;
	_y_r = 1-sqrt(color_get_red(y_color)/255);
	_y_g = 1-sqrt(color_get_green(y_color)/255);
	_y_b = 1-sqrt(color_get_blue(y_color)/255);
	
	var _k_r, _k_g, _k_b;
	_k_r = 1-sqrt(color_get_red(k_color)/255);
	_k_g = 1-sqrt(color_get_green(k_color)/255);
	_k_b = 1-sqrt(color_get_blue(k_color)/255);
	
	//Invert and normalize values
	v_color_ink_c = [_c_r, _c_g, _c_b];
	v_color_ink_m = [_m_r, _m_g, _m_b];
	v_color_ink_y = [_y_r, _y_g, _y_b];
	v_color_ink_k = [_k_r, _k_g, _k_b];
}