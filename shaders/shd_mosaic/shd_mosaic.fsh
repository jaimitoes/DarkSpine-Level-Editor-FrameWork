varying vec2 v_texcoord;
uniform vec2 mouse_pos;
uniform vec2 resolution;
uniform float pixel_amount;

void main()
{ 
    vec2 res = vec2(1.0, resolution.x/resolution.y);
    vec2 size = vec2(res.x/pixel_amount, res.y/pixel_amount);
    vec2 uv = v_texcoord - mod(v_texcoord,size)+ mouse_pos;
    gl_FragColor = texture2D( gm_BaseTexture, uv );
}
