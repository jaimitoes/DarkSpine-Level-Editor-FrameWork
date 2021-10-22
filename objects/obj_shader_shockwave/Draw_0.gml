shader_set(shd_shockwave);
shader_set_uniform_f(uni_time, time_var);
shader_set_uniform_f(uni_pos, pos_x, pos_y);
shader_set_uniform_f(uni_resolution, res_x, res_y);
shader_set_uniform_f(uni_shock_amplitude, shock_amplitude);
shader_set_uniform_f(uni_shock_refraction, shock_refraction);
shader_set_uniform_f(uni_shock_width, shock_width);
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



