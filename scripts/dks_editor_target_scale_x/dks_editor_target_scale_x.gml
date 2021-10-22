function dks_editor_target_scale_x() 
{
	var creator = obj_deco_creator;
	var scaler = (creator.Mxd -mouse_startx)*creator.interface[2];
	if(have_texture) or (have_path_texture)
	{
	 if keyboard_check(vk_control)
	 {
	  vertex_xscale = vxsoff+scaler;
	  dks_vertex_scale(poly_list,0,0, vertex_angle, vertex_xscale, vertex_yscale, z_scale);
	  dks_vertex_check(id);
	 }
  else
	 {
   image_xscale = xsoffset+scaler;
	 }
	}
	else
	{
	 image_xscale = xsoffset+scaler;
	}
}