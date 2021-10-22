shader_set(shader);
shader_set_uniform_f(u_color,R,G,B,image_alpha);
script_execute(draw_method);
shader_reset();

