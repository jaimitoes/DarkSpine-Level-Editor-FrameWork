shader_set(shd_backround);
shader_set_uniform_f(uni_move, moveX, moveY);
script_execute(draw_method);
shader_reset();

