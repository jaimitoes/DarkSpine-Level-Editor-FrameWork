event_inherited();
val[3] = 0;
uni_res = shader_get_uniform(shd_refraction,"u_resolution");
uni_tex_res = shader_get_uniform(shd_refraction,"u_textureRes");
uni_tex_pos = shader_get_uniform(shd_refraction,"u_texturePos");
samp_normal = shader_get_sampler_index(shd_refraction, "s_normalMap");
samp_diffuse = shader_get_sampler_index(shd_refraction, "s_diffuseTex");
normal_map = sprite_get_texture(spr_light_8,0);  
normal_w = sprite_get_width(spr_light_8);
normal_h = sprite_get_height(spr_light_8);
diffuse = normal_map;
res_x = 0;
res_y = 0;
pos_x = 0;
pos_y = 0;
refraction_amount = 0.03;

