shader_set(shd_refraction);
shader_set_uniform_f(uni_res, res_x, res_y);
shader_set_uniform_f(uni_tex_res, normal_w, normal_h);
shader_set_uniform_f(uni_tex_pos, pos_x, pos_y, refraction_amount);
texture_set_stage(samp_normal, normal_map);
texture_set_stage(samp_diffuse, diffuse);
script_execute(draw_method);
shader_reset();



