shader_set(shd_led);
shader_set_uniform_f(uni_res, res_x, res_y);
shader_set_uniform_f(uni_led_size, led_size);
shader_set_uniform_f(uni_led_brightness, led_brightness);
script_execute(draw_method);
shader_reset();


