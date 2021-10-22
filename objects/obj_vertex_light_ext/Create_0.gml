/// Child object, extended version of the "obj_vertex_light" buffer.
event_inherited();//Inherit the vertex light initial data
// Create 6 custom variables to link with the editor, 4 of them are already inherited.
val[5] = 0;
movex = 0;
movey = 0;
//////////////////////////////////////////////////////////////////////////////
//Get the vertex light shader ID
shader = shd_vertex_light;
// Get the uniform shaders (translation texture and colour)
uv_move = shader_get_uniform(shader,"unimov");
u_color = shader_get_uniform(shader,"u_color");
// This variables is used to update the UV translation of our textures
X = 0;
Y = 0;
// Set the default normalised channel colors
R = 0.0;
G = 0.0;
B = 0.0;







