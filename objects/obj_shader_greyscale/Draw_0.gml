shader_set(shd_greyscale);
shader_set_uniform_f(uni_greyscale_fade, greyscale_fade);
script_execute(draw_method);
shader_reset();



