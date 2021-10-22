function dks_draw_text3D() 
{
	dks_matrix_update();
	mtx = 0;
	mtx = matrix_build(x,y,depth,x_rotation,y_rotation,image_angle,image_xscale,image_yscale,z_scale);
	gpu_set_zwriteenable(0);
	matrix_set(matrix_world,mtx);
	draw_set_font(current_font);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_text_ext_transformed_colour(x,y,text,16,camera_get_view_width(Cam),image_xscale,image_yscale,image_angle,image_blend,image_blend,image_blend,image_blend,image_alpha);
	draw_set_font(previous_font);
	gpu_set_zwriteenable(0);
	matrix_set(matrix_world,global.mat_world);
}