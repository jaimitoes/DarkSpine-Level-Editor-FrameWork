event_inherited();

val[8] = 0;
image_xscale = 0;
image_yscale =0;
draw_set_color(c_white);
surf=0;
uni_time = shader_get_uniform(shd_shockwave,"time");
uni_pos = shader_get_uniform(shd_shockwave,"mouse_pos");
uni_resolution = shader_get_uniform(shd_shockwave,"resolution");
uni_shock_amplitude = shader_get_uniform(shd_shockwave,"shock_amplitude");
uni_shock_refraction = shader_get_uniform(shd_shockwave,"shock_refraction");
uni_shock_width = shader_get_uniform(shd_shockwave,"shock_width");
time_var = 0;
time = 1;
pos_x = camera_get_view_x(Cam);
pos_y = camera_get_view_y(Cam);
res_x = 1;
res_y = 1;
shock_amplitude = 0.5;
var_speed =0.060;
shock_refraction = 0.20;
shock_width = 0.20;


    
    



