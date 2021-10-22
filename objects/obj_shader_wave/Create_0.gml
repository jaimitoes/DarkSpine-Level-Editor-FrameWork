event_inherited();
val[6] = 0;
uni_time = shader_get_uniform(shd_wave,"time");
uni_pos = shader_get_uniform(shd_wave,"mouse_pos");
uni_res = shader_get_uniform(shd_wave,"resolution");
uni_wave_amount = shader_get_uniform(shd_wave,"wave_amount");
uni_wave_distortion = shader_get_uniform(shd_wave,"wave_distortion");
uni_wave_speed = shader_get_uniform(shd_wave,"wave_speed");
wave_distortion = 30; 
wave_speed = 2.0; 
time_var = 0;
time = 0.04;
wave_amount = 20; 
pos_x = x- camera_get_view_x(Cam);
pos_y = y- camera_get_view_y(Cam);
res_x = camera_get_view_width(Cam);
res_y = camera_get_view_height(Cam);

z = 0;
size = 0;


