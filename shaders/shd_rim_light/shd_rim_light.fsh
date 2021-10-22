//
// Simple passthrough fragment shader
//
//uniform mat4 u_pm;
varying mat4 v_vm;
varying vec3 v_Normal;
varying vec3 v_Pos; 
varying vec4 v_vColour;
varying vec2 v_vTexcoord;
uniform vec3 u_res;

 
void main() {
 
  vec3 n = normalize(mat3(v_vm) * v_Normal);      // convert normal to view space, u_vm (view matrix), is a rigid body transform.
  vec3 pv = vec3(mat3(v_vm) * v_Pos);                   // position in view space
  vec3 v = normalize(-pv);                       // eye vector
  float vdn = u_res.z - max(dot(v, n), 0.0);        // the rim contribution
 
  gl_FragColor.a = texture2D(gm_BaseTexture,v_vTexcoord).a;
  gl_FragColor.rgb = v_vColour.rgb*vec3(smoothstep(u_res.x, u_res.y, vdn))*texture2D(gm_BaseTexture,v_vTexcoord).rgb;
}
