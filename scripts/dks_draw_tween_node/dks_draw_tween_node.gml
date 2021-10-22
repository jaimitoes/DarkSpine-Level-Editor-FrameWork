function dks_draw_tween_node() 
{
	if instance_exists(obj_motion_controller) and (obj_motion_controller.k_play[0])
	{
	 shader_set(shd_colour);
	 var cl = shader_get_uniform(shd_colour,"u_color");
	 if(start_color = c_red)
	 {
	  shader_set_uniform_f(cl,1.0,0.2,0.0,0.5);
	 }
	 else
	 {
	  shader_set_uniform_f(cl,0.2,1.0,0.0,0.5);
	 }
	 script_execute(Dmethod);
	 shader_reset();
	}
}