attribute vec3 in_Position;
attribute vec4 in_Colour;
attribute vec2 in_TextureCoord;
uniform float time;
varying vec2 v_texcoord;
varying vec4 v_colour;
uniform vec2 mouse_pos;
uniform vec2 resolution;
uniform float wave_amount;
uniform float wave_distortion;
uniform float wave_speed;

void main()
{   
   /*
    vec2 uv = v_texcoord;
    uv.x *= (resolution.x/resolution.y);
    float centre_x = (mouse_pos.x / resolution.x) * (resolution.x/resolution.y);
    float centre_y = mouse_pos.y / resolution.y;
   */
    float centre_x = (mouse_pos.x / resolution.x) * (resolution.x/resolution.y);
    float centre_y = mouse_pos.y / resolution.y;
    vec3 dir = in_Position - vec3(0.5);
    float dist = distance(dir, vec3(centre_x,centre_y,0));
    vec3 offset = dir * (sin(dist * wave_amount - time * wave_speed)) / wave_distortion;
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * vec4(in_Position +offset, 1.0);
    v_texcoord = in_TextureCoord;
}
