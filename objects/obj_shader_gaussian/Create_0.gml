event_inherited();
val[2] = 0;
uni_res_w = shader_get_uniform(shd_gaussian_horizontal,"resolution");
res_x = camera_get_view_width(Cam);
res_y = camera_get_view_height(Cam);
uni_blur_w_amount = shader_get_uniform(shd_gaussian_vertical,"blur_amount");
uni_blur_h_amount = shader_get_uniform(shd_gaussian_horizontal,"blur_amount");
blur_amount = 1.0;

