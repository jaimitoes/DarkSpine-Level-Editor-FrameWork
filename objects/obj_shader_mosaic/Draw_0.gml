shader_set(shd_mosaic);
shader_set_uniform_f(uni_pixel_amount, pixel_amount);
shader_set_uniform_f(uni_pos, pos_x, pos_y);
shader_set_uniform_f(uni_resolution, res_x, res_y);
script_execute(draw_method);
if(parent)
{
 size = array_length(child);
 for(var i =0; i<size;i++)
 {
  with(child[i])
  {
   script_execute(draw_method);
  }
 }
} 
shader_reset();


