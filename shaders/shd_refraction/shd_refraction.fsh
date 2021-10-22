varying vec2 v_texcoord;
uniform sampler2D s_normalMap;
uniform sampler2D s_diffuseTex;
uniform vec2 u_resolution;
uniform vec2 u_textureRes;
uniform vec3 u_texturePos;
void main()
{   
 vec2 imagePos = v_texcoord - (u_texturePos.xy / u_resolution);
 vec2 aspectRatio = u_resolution / u_textureRes;
 vec2 ssUVs = imagePos * aspectRatio;
 vec2 normalMap = texture2D(s_normalMap, ssUVs).xy * 2.0 - 1.0;
 vec2 offset = v_texcoord + (normalMap * u_texturePos.z);
 gl_FragColor = texture2D(s_diffuseTex, ssUVs) * texture2D(gm_BaseTexture, offset.xy);
}

