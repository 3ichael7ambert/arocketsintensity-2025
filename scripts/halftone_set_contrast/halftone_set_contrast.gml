/// @function           halftone_set_contrast(contrast, brightness);
/// @param {real}		contrast Contrast adjustment (higher = greater contrast)
/// @param {real}		brightness Brightness adjustment (higher = brighter)
/// @description        Update halftone contrast and brightness parameters

function halftone_set_contrast(contrast = v_contrast, brightness = v_brightness)
{
	v_contrast = contrast;
	v_brightness = brightness;
	
	return contrast;
}