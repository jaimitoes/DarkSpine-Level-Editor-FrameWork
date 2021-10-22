//
// Simple passthrough fragment shader
//
varying vec2 v_texcoord;
varying vec4 v_colour;

void main()
{
    gl_FragColor = v_colour * texture2D( gm_BaseTexture, v_texcoord );
}
