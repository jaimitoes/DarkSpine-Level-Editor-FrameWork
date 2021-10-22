function dks_draw_3D()
{
	gpu_set_blendmode(blend_mode);
	mtx = matrix_build(0,0,0,x_rotation,y_rotation,z_rotation,1,1,1);
	matrix_set(matrix_world,mtx);
	draw_self();
	matrix_set(matrix_world,global.mat_world);
	gpu_set_blendmode(bm_normal);
}