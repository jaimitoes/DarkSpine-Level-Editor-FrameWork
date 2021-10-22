function dks_draw_vertex() 
{
	dks_matrix_update();
	matrix_set(matrix_world, mtx);
	gpu_set_zwriteenable(0);
	if (have_texture)
	{
	 vertex_submit(v_buffer, pr_trianglelist, v_texture);
	}
	if (have_path_texture)
	{
	 vertex_submit(buffer_path, pr_trianglelist, p_texture);
	}
	gpu_set_zwriteenable(1);
	matrix_set(matrix_world, global.mat_world);
}