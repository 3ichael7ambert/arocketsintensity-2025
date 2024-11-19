/*
	"Xor-Halftone" by @XorDev
	
	This shader separates the texture in to four CMYK ink layers and blends
	them together giving an authentic halftone printing look.
	There are many, many parameters to customize the exact appearance.
	
	Shout out to MRMO for inspiration.
*/

//Texture texel size (1 / resolution)
uniform vec2 u_texel;
//Camera position offset (screenspace)
uniform vec2 u_position;
//Halftone pixel scale (should be >1 for best results)
uniform float u_scale;
//Color contrast and brightness respectively: (1, 0.5) = normal
uniform vec2 u_contrast;

//The amount of noise (0 = no noise, 1 = full-noise)
uniform float u_noise_amplitude;
//Scale of repeating noise texture (in pixels)
uniform float u_noise_scale;
//Noise texture (blue noise works well)
uniform sampler2D u_noise_texture;

//The amount of color shift in pixels
uniform float u_cmyk_shift;
//The angles of orientation for each ink (in radians)
uniform vec4 u_cmyk_angles;

//The inverted RGB color of the cyan ink
uniform vec3 u_color_ink_c;
//The inverted RGB color of the magenta ink
uniform vec3 u_color_ink_m;
//The inverted RGB color of the yellow ink
uniform vec3 u_color_ink_y;
//The inverted RGB color of the key (black) ink
uniform vec3 u_color_ink_k;

//Pass color and coordinates
varying vec2 v_coord;
varying vec4 v_color;

//Standard sRGB gamma exponent
#define GAMMA 2.2
//Ink sharpness (lower = smoother, higher = sharper)
#define SHARPNESS 3.0
//Amount of noise distortion (higher = more jagged)
#define NOISE_SHIFT 0.5

//Pre-computed square root of 2
#define SQRT_2 1.414214

//Rotates, rounds and rotates back to original orientation
vec2 rotate_round(vec2 p, mat2 m)
{
	return floor(m * p + .5) * m;
}
//Sample texture with contrast
vec4 sample(vec2 pixel)
{
	//Convert coords to centered texture coordinates (correcting for camera position)
	vec2 texcoord = (pixel - floor(u_position+0.5)) * u_texel + 0.5;
	//Sample at these coordinates
	vec4 col = texture2D(gm_BaseTexture, texcoord);
	col = (col - 0.5) * u_contrast[0] + u_contrast[1];
	//Linearly adjust contrast and brightness
	return pow(max(col, 0.0), vec4(1.0 / GAMMA));
}
//Converts an RGB color to CMYK vector
vec4 RGBtoCMYK (vec3 c)
{
	//Maximum of RGB channels, which is 1.0 - k
    float M = max(c.r, max(c.g, c.b));
	//Compute CMY values using the maximum (default 0)
    vec3 CMY = (M > 0.0) ? (M - c) / (M * 0.99 + 0.01) : vec3(0.0);
	
	//Compute fourth-root:
	//First square-root is to correct for radius to area conversion.
	//Honestly, not sure why this is square-rooted again, but it is gamma-correct!
    return pow(max(vec4(CMY, 1.0 - M), 0.0), vec4(0.25));
}

//Samples CMYK ink layer (index corresponds to respective CMYK ink)
float CMYK_ink(vec2 coord, float noise, const int index)
{
	//Convert angle to direction vector
	vec2 dir = vec2(cos(u_cmyk_angles[index]), -sin(u_cmyk_angles[index]));
	//Compute rotation matrix from direction
	mat2 rot = mat2(dir, -dir.y, dir.x);
	
	//Get rotate-rounded coordinates
	vec2 rcoord = rotate_round(coord, rot);
	//Sample texture using the pixel coordinates with CMYK color shift
	vec4 samp =  sample(rcoord * u_scale + u_cmyk_shift * dir);
	//Pick C, Y, M or K using color index
	float ink = RGBtoCMYK(samp.rgb)[index];
	
	//Get roundness exponent from ink and noise (2.0 = circle, higher approaches square)
	float exponent = 1.0 + (ink + noise) * 2.0;
	//Rotate the difference between the coordinates and the rotate-rounded coordinates
	//This tells us how close we are to the pixel center (abs and doubled so it ranges from 0 to 1)
	vec2 cell_diff = abs(rot * (coord - rcoord)) * 2.0;
	//Raise this to a higher power for rounded or sharp corners
	vec2 cell_exp = pow(cell_diff, vec2(exponent));
	//Compute distance by reversing exponent
	float dist = pow(cell_exp.x + cell_exp.y, 1.0 / exponent);
	//Convert back to 0 - 1 range
	return clamp((ink * SQRT_2 + noise - dist) * SHARPNESS, 0.0, 1.0);
}

void main()
{
	//Convert texture coordinates to centered pixel coordinates
	vec2 pixel = (v_coord - 0.5) / u_texel + u_position;
	//Get scaled texture coordinates
	vec2 coord = pixel / u_scale;
	
	//Sample noise texture
	vec4 noise_tex = texture2D(u_noise_texture, pixel * u_noise_scale);
	//Convert to signed range (-amp/2 to +amp/2)
	vec4 noise = (noise_tex - 0.5) * u_noise_amplitude;
	//Add RG noise to coordinates for random offset
	coord += NOISE_SHIFT * noise.rg;
	
	//Sample ink layers
	float tex_c = CMYK_ink(coord, noise.b, 0);
	float tex_m = CMYK_ink(coord, noise.b, 1);
	float tex_y = CMYK_ink(coord, noise.b, 2);
	float tex_k = CMYK_ink(coord, noise.b, 3);
	
	//Blend inks together
	vec4 ink_color = vec4(1.0);
	ink_color.rgb *= 1.0 - tex_c * u_color_ink_c * noise_tex.a;
	ink_color.rgb *= 1.0 - tex_m * u_color_ink_m * noise_tex.a;
	ink_color.rgb *= 1.0 - tex_y * u_color_ink_y * noise_tex.a;
	ink_color.rgb *= 1.0 - tex_k * u_color_ink_k * noise_tex.a;
	
	//Output gamma-corrected results
    gl_FragColor = v_color * pow(ink_color, vec4(GAMMA));
}