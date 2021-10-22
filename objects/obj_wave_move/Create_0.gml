event_inherited();
val[8] = 0;
uni_time = shader_get_uniform(shd_wave_move,"time");
uni_pos = shader_get_uniform(shd_wave_move,"mouse_pos");
uni_res = shader_get_uniform(shd_wave_move,"resolution");
uni_wave_amount = shader_get_uniform(shd_wave_move,"wave_amount");
uni_wave_distortion = shader_get_uniform(shd_wave_move,"wave_distortion");
uni_wave_speed = shader_get_uniform(shd_wave_move,"wave_speed");
uni_move = shader_get_uniform(shd_wave_move,"unimov");
wave_distortion = 30; //higher = less distortion
wave_speed = 2.0; //higher = faster
time_var = 0;
time = 0.04;
wave_amount = 20; //higher = more waves
pos_x = x- camera_get_view_x(Cam);
 pos_y = y- camera_get_view_y(Cam);
res_x = camera_get_view_width(Cam);
res_y = camera_get_view_height(Cam);
moveX = 0;
moveY = 0;
move_x = 0.1;
move_y = 0.1;
//shader_enabled = true;
//full_screen_effect = true;
//surf = surface_create(view_wview, view_hview);
//view_surface_id[0] = surf;

