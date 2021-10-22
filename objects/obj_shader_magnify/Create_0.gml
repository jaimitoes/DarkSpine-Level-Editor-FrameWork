event_inherited();
val[4] = 0;
uni_pos = shader_get_uniform(shd_magnify,"mouse_pos");
pos_x = global.mouse_xd - camera_get_view_x(Cam);
pos_y = global.mouse_xd - camera_get_view_y(Cam);
uni_res = shader_get_uniform(shd_magnify,"resolution");
res_x = camera_get_view_width(Cam);
res_y = camera_get_view_height(Cam);
uni_circle_radius = shader_get_uniform(shd_magnify,"circleRadius");
circle_radius = 0.25; //higher = more waves
uni_circle_zoom_min = shader_get_uniform(shd_magnify,"minZoom");
zoom_min = 0.4; //higher = less distortion
uni_circle_zoom_max = shader_get_uniform(shd_magnify,"maxZoom");
zoom_max = 0.6; //higher = faster

