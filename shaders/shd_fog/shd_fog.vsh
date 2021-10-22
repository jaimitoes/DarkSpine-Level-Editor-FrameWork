///Ground fog shader for GLSLes by xygthop3
attribute vec4 in_Position;
//attribute vec3 in_Normal;
attribute vec4 in_Colour;
attribute vec2 in_TextureCoord;
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
varying vec4 WorldPos;
void main()
{
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * in_Position;
    WorldPos = gm_Matrices[MATRIX_WORLD] * in_Position;

    v_vColour = in_Colour;
    v_vTexcoord = in_TextureCoord;
}
