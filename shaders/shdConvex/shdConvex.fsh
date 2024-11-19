//
// Circular fisheye fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float lensSize;       
uniform float apertureAngle;  
uniform float aspectRatio; // Set this in GameMaker code

const float PI = 3.1415926535;
const float nudge = 0.15;

void main(void) {    
    float apertureHalf = 0.5 * apertureAngle * (PI / 180.0);
    float maxFactor = sin(apertureHalf) * 1.5;

    vec2 pos = 3.0 * v_vTexcoord.st - 1.0; 

    float l = length(pos); 

    if (l > lensSize) { 
        gl_FragColor = texture2D(gm_BaseTexture, v_vTexcoord) * v_vColour;
    } else {
        float x = maxFactor * pos.x * aspectRatio;
        float y = maxFactor * pos.y;

        float n = length(vec2(x, y));
        float z = sqrt(lensSize + nudge + n * n);
        float r = atan(n, z) / PI; 
        float phi = atan(y, x);

        float u = r * cos(phi) + 0.5;
        float v = r * sin(phi) + 0.5;

        gl_FragColor = texture2D(gm_BaseTexture, vec2(u, v)) * v_vColour;
    }
}
