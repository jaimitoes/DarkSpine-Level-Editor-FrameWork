event_inherited();
uni_pos = shader_get_uniform(shd_mosaic,"mouse_pos");
uni_res = shader_get_uniform(shd_mosaic,"resolution");
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
pos_x = res_x*0.5;
pos_y = res_y*0.5;
pixel_amount = shader_get_uniform(shd_mosaic,"pixel_amount");
blur_offset = 0;
s_app = 0;
Surf = surface_create(res_x, res_y);
old_view = view_get_surface_id(global.start_3d);
if application_surface_is_enabled()
{
 application_surface_draw_enable(0);
 s_app = 1;
} 
view_set_surface_id(global.start_3d, Surf);
alarm[0] = 60;
pixel = 0;
add_pixel = 1;
plus = 2;
minus = 2;


