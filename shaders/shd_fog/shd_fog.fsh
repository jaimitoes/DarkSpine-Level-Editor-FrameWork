///Ground fog shader for GLSLes by xygthop3
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
varying vec4 WorldPos;
uniform vec3 u_fog_colour; //Red, Green, Blue
uniform vec3 u_fog_height; //Z near, Z height, Falloff
uniform vec3 u_camera_position; //Cameras X, Y, Z
void main()
{
 vec4 base = texture2D(gm_BaseTexture, v_vTexcoord);
 float dist = length(WorldPos.xyz - u_camera_position);   
 float fog = u_fog_height.z * smoothstep(u_fog_colour.z, u_fog_height.x, u_fog_height.y - WorldPos.z);
 float ext = exp2(-dist * fog);
 vec3 finalColor = base.rgb * vec3(ext,ext,ext) + u_fog_colour.rgb * (1.0 - ext);
 gl_FragColor = /*v_vColour * */vec4(finalColor, 1.0);
}
