/// @function           halftone_set_cmyk_offsets_ext(shift, c_angle, m_angle, y_angle, k_angle);
/// @param {real}		shift CMYK color shift (in pixels)
/// @param {real}		c_angle Cyan color angle (in degrees)
/// @param {real}		m_angle Magenta color angle (in degrees)
/// @param {real}		y_angle Yellow color angle (in degrees)
/// @param {real}		k_angle Key (black) color angle (in degrees)
/// @description        Update halftone CMYK parameters

function halftone_set_cmyk_offsets_ext(shift = v_cmyk_shift, c_angle = 15, m_angle = 155, y_angle = 90, k_angle = 315)
{
	v_cmyk_shift = shift;
	v_cmyk_angles = [degtorad(c_angle), degtorad(m_angle), degtorad(y_angle), degtorad(k_angle)];
}