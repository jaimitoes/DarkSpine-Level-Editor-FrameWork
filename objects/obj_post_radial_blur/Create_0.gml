uni_pos = shader_get_uniform(shd_radial_blur,"mouse_pos");
uni_res = shader_get_uniform(shd_radial_blur,"resolution");
pos_x = 0;
pos_y = 0;

if window_get_fullscreen()
{
 res_x = display_get_width();
 res_y = display_get_height();
}
else
{
 res_x = window_get_width();
 res_y = window_get_height();
}

uni_radial_blur_offset = shader_get_uniform(shd_radial_blur,"radial_blur_offset");
blur_offset = 0;
uni_radial_brightness = shader_get_uniform(shd_radial_blur,"radial_brightness");
brightness = 1;
s_app = 0;
old_view = view_get_surface_id(global.start_3d);
Surf = surface_create(res_x, res_y);
dw = display_get_gui_width();
dh = display_get_gui_height();
if application_surface_is_enabled()
{ 
 application_surface_draw_enable(0);
 s_app = 1;
} 
view_set_surface_id(global.start_3d, Surf);
alarm[0] = 60;
blur = 30;


