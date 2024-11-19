/// @function           halftone_set_cmyk_offsets(shift, angle);
/// @param {real}		shift CMYK color shift (in pixels)
/// @param {real}		angle CMYK angle shift (in degrees)
/// @description        Update halftone CMYK parameters

function halftone_set_cmyk_offsets(shift = v_cmyk_shift, angle = -1)
{
	v_cmyk_shift = shift;
	
	if (angle != -1)
	{
		v_cmyk_angles = [degtorad(angle+15), degtorad(angle+155), degtorad(angle+90), degtorad(angle+315)];
	}
}