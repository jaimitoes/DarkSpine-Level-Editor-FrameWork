///Extended vertex light Draw

// Updating the local transformation matrix
dks_matrix_update();
// Set the previous matrix as the matrix world
matrix_set(matrix_world, mtx);// Moving the world before submitting the vertex, vertex are stored with local coordinates.
// Set the light shader
shader_set(shader);
// Set the texture traslation speed of our light
shader_set_uniform_f(uv_move,X,Y);
// Set the light colour and alpha like a deco object
shader_set_uniform_f(u_color,R,G,B,image_alpha);
// Set the custom blend mode depending on the desired effect by the user.
gpu_set_blendmode_ext(blend[blend1],blend[blend2]);
// Deactivate the z-write ordering to prevent artifacts 
gpu_set_zwriteenable(false);
// If a texture is assign, we can reproduce the light, in a regular case, we must to use a white texture, you can get it...
//...in the sprite "spr_fill_pack_0", you can mix any texture and test any combination of blending to get other.id effects.
if (have_texture)
{
 vertex_submit(v_buffer, pr_trianglelist, v_texture);
 vertex_submit(buffer_light, pr_trianglestrip,v_texture);
}
// Activating the Z-write ordering
gpu_set_zwriteenable(true);
// Reset the draw blend mode
gpu_set_blendmode(bm_normal);
// Reset to the default draw 
shader_reset();
// Move the world to the default coordinates
matrix_set(matrix_world, global.mat_world);


