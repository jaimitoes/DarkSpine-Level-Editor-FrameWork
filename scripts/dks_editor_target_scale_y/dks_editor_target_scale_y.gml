function dks_editor_target_scale_y() 
{
	var creator = obj_deco_creator;
	var scaler = (creator.Myd -mouse_starty)*creator.interface[2];
	if(have_texture) or (have_path_texture)
	{
  if keyboard_check(vk_control)
	 {
   vertex_yscale = vysoff-scaler;
	  dks_vertex_scale(poly_list,0,0, vertex_angle, vertex_xscale, vertex_yscale, z_scale);
	  dks_vertex_check(id);
	 }
	 else
	 {
	  image_yscale = ysoffset-scaler;
	 }
	}
	else
	{
	 image_yscale = ysoffset -scaler;
	}
}