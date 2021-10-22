varying vec2 v_vTexcoord;
varying vec4 v_vColour;
uniform sampler2D s_mask;
uniform vec4 l_color;



void main()
{
 vec4 tex1 = v_vColour * texture2D(gm_BaseTexture, v_vTexcoord); // get color
 vec4 tex2 = l_color * texture2D(s_mask, v_vTexcoord); // get color
 gl_FragColor =  tex1 + tex2;
}
