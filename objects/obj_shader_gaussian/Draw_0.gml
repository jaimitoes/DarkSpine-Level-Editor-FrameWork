shader_set(shd_gaussian_horizontal);
shader_set_uniform_f(uni_res_w, res_x, res_y);
shader_set_uniform_f(uni_blur_w_amount, blur_amount);
script_execute(draw_method);
//Do vertical blur last
shader_set(shd_gaussian_vertical);
shader_set_uniform_f(uni_res_w, res_x, res_y);
shader_set_uniform_f(uni_blur_h_amount, blur_amount);
script_execute(draw_method);
shader_reset();

