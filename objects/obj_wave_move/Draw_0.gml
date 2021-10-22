//if shader_enabled 
shader_set(shd_wave_move);
shader_set_uniform_f(uni_time, time_var);
shader_set_uniform_f(uni_pos, pos_x, pos_y);
shader_set_uniform_f(uni_res, res_x, res_y);
shader_set_uniform_f(uni_wave_amount, wave_amount);
shader_set_uniform_f(uni_wave_distortion, wave_distortion );
shader_set_uniform_f(uni_wave_speed, wave_speed);
shader_set_uniform_f(uni_move, moveX, moveY);
script_execute(draw_method);
//if full_screen_effect draw_surface(surf,0,0);
shader_reset();

