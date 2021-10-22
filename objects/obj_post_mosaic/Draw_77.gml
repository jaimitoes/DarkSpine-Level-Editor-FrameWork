
shader_set(shd_mosaic);
shader_set_uniform_f(uni_pos, pos_x, pos_y);
shader_set_uniform_f(uni_res, res_x, res_y);
shader_set_uniform_f(pixel_amount, pixel);
if (s_app)
{
 draw_surface_stretched(Surf,0,0,display_get_gui_width(),display_get_gui_height());
}
else
{
 //gpu_set_blendmode_ext(bm_inv_dest_alpha,bm_one);
 draw_surface_stretched(Surf,0,0,display_get_gui_width(),display_get_gui_height());
 //gpu_set_blendmode(bm_normal);
} 
shader_reset();



