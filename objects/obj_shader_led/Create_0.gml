event_inherited();
val[3] =0;
uni_res = shader_get_uniform(shd_led,"resolution");
res_x = camera_get_view_width(Cam);
res_y = camera_get_view_height(Cam);
uni_led_size = shader_get_uniform(shd_led,"led_size");
led_size = 100;
uni_led_brightness = shader_get_uniform(shd_led,"brightness");
led_brightness = 1.0;


