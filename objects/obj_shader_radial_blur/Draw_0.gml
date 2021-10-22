shader_set(shd_radial_blur);
shader_set_uniform_f(uni_pos, pos_x, pos_y);
shader_set_uniform_f(uni_res, res_x, res_y);
shader_set_uniform_f(uni_radial_blur_offset, blur_offset);
shader_set_uniform_f(uni_radial_brightness, brightness);
script_execute(draw_method);
shader_reset();

