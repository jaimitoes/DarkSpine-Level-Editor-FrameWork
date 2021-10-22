if !surface_exists(Surf)
{
 surface_create(res_x,res_y);
}
shader_set(shd_radial_blur);
shader_set_uniform_f(uni_pos, pos_x, pos_y);
shader_set_uniform_f(uni_res, res_x, res_y);
shader_set_uniform_f(uni_radial_blur_offset, blur_offset);
shader_set_uniform_f(uni_radial_brightness, brightness);
if (s_app)
{
  
 surface_set_target(Surf);
 draw_surface_stretched(application_surface,0,0,res_x,res_y);
 surface_reset_target();
 draw_surface_stretched(Surf,0,0,dw,dh);
}
else
{
 gpu_set_blendmode_ext(bm_inv_dest_color,bm_subtract);
 draw_surface_stretched(Surf,0,0,dw,dh);
 gpu_set_blendmode(bm_normal);
}
shader_reset();


