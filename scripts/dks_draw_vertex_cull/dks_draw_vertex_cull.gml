function dks_draw_vertex_cull() 
{
	dks_matrix_update();
	matrix_set(matrix_world, mtx);
	gpu_set_zwriteenable(false);
	gpu_set_cullmode(1);
	if (have_texture)
	{
  vertex_submit(v_buffer, pr_trianglelist, v_texture);
 }
	if (have_path_texture)
	{
	 vertex_submit(buffer_path, pr_trianglelist, p_texture);
	}
	gpu_set_cullmode(0);
	gpu_set_zwriteenable(true);
	matrix_set(matrix_world, global.mat_world);
}