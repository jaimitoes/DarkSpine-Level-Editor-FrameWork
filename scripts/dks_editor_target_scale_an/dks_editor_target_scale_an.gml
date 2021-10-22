function dks_editor_target_scale_an() 
{
	var creator = obj_deco_creator;
	var scaler = ((creator.Mxd -mouse_startx)*creator.interface[3]);

	if keyboard_check(vk_control)
	{
 
	 y_rotation = anoffy +scaler;
	}  
	else if keyboard_check(vk_shift)
	{
	 scaler = ((creator.Myd -mouse_starty)*creator.interface[3]);
	 x_rotation = anoffx -scaler;
	}

	else if keyboard_check(vk_tab)
	{
	 vertex_angle = vanoff+scaler;
	 dks_vertex_scale( poly_list,0,0, vertex_angle, vertex_xscale, vertex_yscale, z_scale);
	 dks_vertex_check(id);
	}
	else
	{
	 image_angle = anoff +scaler;
	}        

	/*
	if (image_angle<0)
	{
	 image_angle+=360;
	}
	else if(image_angle >360)
	{
	 image_angle -=360;
	}


	if (x_rotation<0)
	{
	 x_rotation+=360;
	}
	else if(x_rotation>360)
	{
	 x_rotation -= 360;
	}

	if (y_rotation<0)
	{
	 y_rotation+=360;
	}
	else if(y_rotation>360)
	{
	 y_rotation -= 360;
	}
	*/
	if (vertex_angle<0)
	{
	 vertex_angle+=360;
	}
	else if(vertex_angle>360)
	{
	 vertex_angle -= 360;
	}
}