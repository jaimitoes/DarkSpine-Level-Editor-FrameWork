/// 
// If the user event is activated (any event number, -1 means deactivated)
if(perform_event = 0)
{
 //Update the local custom matrix.
 dks_matrix_update();
 //Moving the world setting up the local custom world matrix.
 matrix_set(matrix_world, mtx);
 // Set the blend mode from the custom variables.
 gpu_set_blendmode_ext(blend[blend1],blend[blend2]);
 // Deactivate the z draw order.
 gpu_set_zwriteenable(false);
 // // If a texture is assign, we can reproduce the light, in a regular case, we must to use a white texture, you can get it...
//...in the sprite "spr_fill_pack_0", you can mix any texture and test any combination of blending to get other.id effects.
 if (have_texture)
 {
  vertex_submit(v_buffer, pr_trianglelist, v_texture);
  vertex_submit(buffer_light,pr_trianglestrip,v_texture);
 }
 // Under construction....?? This is not needed to create a light, but can be done at the same time.
 if (have_path_texture)
 {
  vertex_submit(buffer_path, pr_trianglelist, p_texture);
 }
 // Activate the z draw order.
 gpu_set_zwriteenable(true);
 // Reset the blending mode.
 gpu_set_blendmode(bm_normal);
 // Reset the matrix world.
 matrix_set(matrix_world, global.mat_world);
} 

