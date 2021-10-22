 //if shader_enabled 
shader_set(shd_wave);
shader_set_uniform_f(uni_time, time_var);
shader_set_uniform_f(uni_pos, pos_x, pos_y);
shader_set_uniform_f(uni_res, res_x, res_y);
shader_set_uniform_f(uni_wave_amount, wave_amount);
shader_set_uniform_f(uni_wave_distortion, wave_distortion );
shader_set_uniform_f(uni_wave_speed, wave_speed);
script_execute(draw_method);
if(parent)
{
 size = array_length(child);
 for(z = 0; z<size;z++)
 {
  with(child[z])
  {
   shader_set_uniform_f(uni_time, time_var);
   shader_set_uniform_f(uni_pos, pos_x, pos_y);
   shader_set_uniform_f(uni_res, res_x, res_y);
   shader_set_uniform_f(uni_wave_amount, wave_amount);
   shader_set_uniform_f(uni_wave_distortion, wave_distortion );
   shader_set_uniform_f(uni_wave_speed, wave_speed);
   script_execute(draw_method);
  }
 }
}
shader_reset();

