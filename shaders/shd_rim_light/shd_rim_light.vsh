//
// Simple passthrough vertex shader
//
attribute vec3 in_Position;                  // (x,y,z)
attribute vec3 in_Normal;                  // (x,y,z)
attribute vec4 in_Colour;                    // (r,g,b,a)
attribute vec2 in_TextureCoord;              // (u,v)

varying vec2 v_vTexcoord;
varying vec4 v_vColour;
varying vec3 v_Normal;
varying vec3 v_Pos;
varying mat4 v_vm;
uniform vec2 uv_move;

void main()
{
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    v_Normal = in_Normal;
    v_vColour = in_Colour;
    v_vTexcoord = in_TextureCoord + uv_move;
    v_Pos = in_Position;
    v_vm = gm_Matrices[MATRIX_VIEW];
    
}

