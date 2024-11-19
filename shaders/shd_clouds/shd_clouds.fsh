varying vec2 v_vTexcoord;
uniform float u_time;
const vec3 cloud_color = vec3(1.0, 1.0, 1.0);

// Cloud velocities
const vec2 dir_a = vec2(0.76604, 0.64279);
const vec2 dir_b = vec2(0.58207, -0.48841);
const vec2 dir_c = vec2(0.54253, 0.19747);
const vec2 dir_d = vec2(0.41224, -0.15004);
const vec2 dir_e = vec2(0.33333, 0.00000);

void main() {

    float ca = texture2D(gm_BaseTexture, (v_vTexcoord + dir_a * u_time) * 1.000000000).r;
    float cb = texture2D(gm_BaseTexture, (v_vTexcoord + dir_b * u_time) * 0.759835686).r;
    float cc = texture2D(gm_BaseTexture, (v_vTexcoord + dir_c * u_time) * 0.577350269).r;
    float cd = texture2D(gm_BaseTexture, (v_vTexcoord + dir_d * u_time) * 0.438691338).r;
    float ce = texture2D(gm_BaseTexture, (v_vTexcoord + dir_e * u_time) * 0.333333333).r;
 
    // Changes how much each component affects the cloud density
    ce = pow(max(0.0, ce), 1.00000000);
    cd = pow(max(0.0, cd), 0.75983568);
    cc = pow(max(0.0, cc), 0.57735026);
    cb = pow(max(0.0, cb), 0.43869133);
    ca = pow(max(0.0, ca), 0.33333333);
 
    float cloud_dnsty = ca * cb * cc * cd * ce;
 
    // Make the clouds thinner by multiplying by itself
    cloud_dnsty = cloud_dnsty * (3.0 - 2.0 * cloud_dnsty);
 
    gl_FragColor = vec4(cloud_color, cloud_dnsty);
}