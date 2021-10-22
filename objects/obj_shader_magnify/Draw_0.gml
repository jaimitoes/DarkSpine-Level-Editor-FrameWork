shader_set(shd_magnify);
shader_set_uniform_f(uni_pos, pos_x, pos_y);
shader_set_uniform_f(uni_res, res_x, res_y);
shader_set_uniform_f(uni_circle_radius, circle_radius);
shader_set_uniform_f(uni_circle_zoom_min, zoom_min);
shader_set_uniform_f(uni_circle_zoom_max, zoom_max);
script_execute(draw_method);
shader_reset();


