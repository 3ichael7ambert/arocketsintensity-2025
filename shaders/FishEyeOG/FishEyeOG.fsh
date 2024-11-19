//
// Simple fisheye fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float lensSize;
uniform float apertureAngle;
uniform vec2 iResolution;
uniform vec3 iMouse;
uniform sampler2D iChannel0;

const float PI = 3.1415926535;

vec2 norm(vec2 v) {
    return 2.0 * v - 1.0;
}

vec2 abnorm(vec2 norm) {
    return 0.5 * (norm + 1.0);
}

vec2 f1(vec2 uv) {
    vec2 v = norm(uv);
    return v * exp(length(v)) / 4.0;
}

void main(void) {
    vec2 factor = 1.0 / iResolution.xy;
    vec2 uv = v_vTexcoord;
    vec2 mouseNorm = -0.5 + iMouse.xy * factor;
    mouseNorm *= float(iMouse.z > 0.0);

    uv -= mouseNorm;
    vec2 transformed = abnorm(f1(uv)) + mouseNorm;

    vec4 fragColor;
    if (all(greaterThanEqual(transformed, vec2(0))) && all(lessThan(transformed, vec2(1))))
        fragColor = texture2D(iChannel0, transformed);
    else
        fragColor = vec4(0);

    gl_FragColor = fragColor;
}
