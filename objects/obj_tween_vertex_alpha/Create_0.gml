event_inherited();
tween_alpha = TweenCreate(id,EaseInOutSine,0,0,0,60,"image_alpha",image_alpha,0);
shader = shd_vertex_alpha;
u_alpha = shader_get_uniform(shader,"uni_alpha");



