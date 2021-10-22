event_inherited();
val[5] = 0;
uni_time = shader_get_uniform(shd_ripple,"time");
time_var = 0;
time = 0.04;
uni_pos = shader_get_uniform(shd_ripple,"mouse_pos");
pos_x = global.mouse_xd - camera_get_view_x(Cam);
pos_y = global.mouse_yd - camera_get_view_y(Cam);
uni_res = shader_get_uniform(shd_ripple,"resolution");
res_x = camera_get_view_width(Cam);
res_y = camera_get_view_height(Cam);
uni_wave_amount = shader_get_uniform(shd_ripple,"wave_amount");
wave_amount = 80; 
uni_wave_distortion = shader_get_uniform(shd_ripple,"wave_distortion");
wave_distortion = 30; 
uni_wave_speed = shader_get_uniform(shd_ripple,"wave_speed");
wave_speed = 5.0;



