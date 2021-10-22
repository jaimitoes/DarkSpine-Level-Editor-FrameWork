event_inherited();
val[3] = 0;
uni_pos = shader_get_uniform(shd_radial_blur,"mouse_pos");
uni_res = shader_get_uniform(shd_radial_blur,"resolution");
pos_x = global.mouse_xd - camera_get_view_x(Cam);
pos_y = global.mouse_yd - camera_get_view_y(Cam);
res_x = 128;
res_y = 128;
uni_radial_blur_offset = shader_get_uniform(shd_radial_blur,"radial_blur_offset");
blur_offset = 0.05;
uni_radial_brightness = shader_get_uniform(shd_radial_blur,"radial_brightness");
brightness = 1;



