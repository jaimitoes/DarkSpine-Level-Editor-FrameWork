/// @description dks_draw_protect
function dks_draw_protect() 
{
	gpu_set_blendenable(0);
	gpu_set_colorwriteenable(0,0,0,1);
	dks_matrix_update();
	matrix_set(matrix_world, mtx);
	gpu_set_zwriteenable(false);
	if (have_texture)
	{
	 vertex_submit(v_buffer, pr_trianglelist, v_texture);
	}
	if (have_path_texture)
	{
	 vertex_submit(buffer_path, pr_trianglelist, p_texture);
	}
	gpu_set_zwriteenable(true);
	matrix_set(matrix_world, global.mat_world);
	gpu_set_blendenable(1);
	gpu_set_colourwriteenable(1,1,1,1);
}