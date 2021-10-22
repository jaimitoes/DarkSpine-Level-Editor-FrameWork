/// @description dks_editor_get_target_data
function dks_editor_get_target_data() 
{
	var creator = obj_editor_control;
	creator.save_sprite = sprite_index;
	creator.save_image_speed = image_speed;
	creator.save_depth = depth;
	creator.save_blend = image_blend;
	creator.save_blend_mode = blend_mode;
	creator.save_alpha = image_alpha;
	creator.save_angle = image_angle;
	creator.save_xscale = image_xscale;
	creator.save_yscale = image_yscale;
	creator.save_parent = parent;
	creator.save_polygon = have_polygon;
	creator.save_is_spine = is_spine;
	creator.save_is_physics = is_physics;
	creator.save_texture = have_texture;
	creator.save_have_path_texture = have_path_texture;
	creator.save_layer_depth = lay_depth;
	creator.save_layer_offset = layer_offset;
	creator.save_x_rotation = x_rotation;
	creator.save_y_rotation = y_rotation;
	creator.save_object_transform = object_transform;
	creator.save_draw_method = draw_method;
	creator.save_visible = visible;
	creator.save_vertex_xscale = vertex_xscale;
	creator.save_vertex_yscale = vertex_yscale;
	creator.save_vertex_angle = vertex_angle;
	creator.save_have_tween = have_tween;
	creator.save_col_xoff = col_xoff;
	creator.save_col_yoff = col_yoff;
	creator.save_corner1_xoff = corner1_xoff;
	creator.save_corner1_yoff = corner1_yoff;
	creator.save_corner2_xoff = corner2_xoff;
	creator.save_corner2_yoff = corner2_yoff;
	creator.save_activated = activated;
	creator.save_is_visible = is_visible;
	creator.save_perform_event = perform_event;
	creator.save_object_execute = object_execute;
	creator.save_path_image = path_image;
	creator.save_fill_image = fill_image;
 creator.save_dk_part = 0;
	if is_array(dk_part)
	{
	 creator.save_dk_part = dks_array_copy(dk_part);
	}

	creator.save_variables = 0;
	if is_array(variables)
	{
	 creator.save_variables = dks_array_copy(variables);
	}

 if(have_tween)
	{
	 creator.save_tween = 0;
	 creator.save_tweenS = 0;
	 creator.save_tweenD = 0;
	 creator.save_tweenCst = 0;
	 creator.save_tweenCed = 0;	
	 creator.save_tweenCstop = 0;
	 for (var i =0; i<10; i++)
	 {
	  if (tween[i] != -1)
	  {
	   creator.save_tween[i][0] = TweenGet(tween[i],"ease");
	   creator.save_tween[i][1] = TweenGet(tween[i],"mode");
	   creator.save_tween[i][2] = TweenGet(tween[i],"delta");
	   creator.save_tween[i][3] = TweenGet(tween[i],"delay_start");
	   creator.save_tween[i][4] = TweenGet(tween[i],"duration");
	   var prop = TweenGet(tween[i], "property");
	   var st = TweenGet(tween[i], "start");
	   var dest = TweenGet(tween[i], "destination"); 
   
	   if(i = 6)
	   {
	    creator.save_tween[i][5] = "image_blend";
	    var dat = prop[1];
	    creator.save_tween[i][6] = dat[0];
	    creator.save_tween[i][7] = dat[1];
	   }
	   else
	   {
	    creator.save_tween[i][5] = prop;
	    creator.save_tween[i][6] = st;
	    creator.save_tween[i][7] = dest;
	   }
	  }
	  else
	  {
	   creator.save_tween[i][0] = -1;
	  }
	 }

	 if is_array(tweenS)
	 {
	  creator.save_tweenS = dks_array2d_copy(tweenS);
	  creator.save_tweenD = dks_array2d_copy(tweenD);
	  if is_array(tweenCst)
	  {
	   creator.save_tweenCst = dks_array2d_copy(tweenCst);	  
	  }
	  if is_array(tweenCed)
	  {
	   creator.save_tweenCed = dks_array2d_copy(tweenCed);	  
	  }
	  if is_array(tweenCstop)
	  {
	   creator.save_tweenCstop = dks_array2d_copy(tweenCstop);	  
	  }
	 }
	}

	if (is_spine)
	{
	 creator.save_image_index = skeleton_animation_get_frame(0);
	 creator.save_spine_animation = skeleton_animation_get();
	//ds_list_clear(creator.save_bone_list);
	//ds_list_copy(creator.save_bone_list,bone_list); 
	//dks_editor_get_spine_bone_data();
	}
	else
	{
	 creator.save_image_index = image_index;
	}


	if (have_polygon)
	{
	 creator.save_poly_closed = poly_closed;
	 ds_list_clear(creator.save_poly_list);
	 ds_list_copy(creator.save_poly_list,poly_list);
	 //ds_list_clear(creator.save_poly_offset);
	 //ds_list_copy(creator.save_poly_offset,poly_offset);
	 creator.save_bezier_n1  =0;
	 creator.save_bezier_n1 = dks_array_copy(bezier_n1);
	 creator.save_bezier_n2 =0;
	 creator.save_bezier_n2 = dks_array_copy(bezier_n2);
  if (have_path_texture)
	 {
	  creator.save_smooth_terrain = smooth_terrain;
	  creator.save_terrain_split = terrain_split;
	  creator.save_segment_split = segment_split;
	  creator.save_path_texture = path_texture;
	  creator.save_v_split = v_split;
	  creator.save_corner_left = corner_left;
	  creator.save_corner_right = corner_right;
	 }
  if (have_texture)
	 {
	  creator.save_vertex_texture = vertex_texture;
	 }
 }
 
	if (is_physics)
	{
  ds_list_clear(creator.save_phyprops);
	 ds_list_copy(creator.save_phyprops,phyprops);
	 creator.save_joint = joint;
	 creator.save_joint_target = joint_target;
	 creator.save_joint_parent = joint_parent;
	 if (joint)
	 {
	  if (phyprops[| physics.joint_type] != "disabled")
	  {
	   switch(phyprops[| physics.joint_type])
	   {
	    case "Joint distance" :
	    ds_list_clear(creator.save_joint_distance);
	    ds_list_copy(creator.save_joint_distance,joint_list);break;
	    case "Joint rope" :
	    ds_list_clear(creator.save_joint_rope);
	    ds_list_copy(creator.save_joint_rope, joint_list);break;
	    case "Joint revolute" :
	    ds_list_clear(creator.save_joint_revolute);
	    ds_list_copy(creator.save_joint_revolute,joint_list);break;
	    case "Joint prismatic" :
	    ds_list_clear(creator.save_joint_prism);
	    ds_list_copy(creator.save_joint_prism, joint_list);break;
	    case "Joint gear" :
	    ds_list_clear(creator.save_joint_gear);
	    ds_list_copy(creator.save_joint_gear, joint_list);break;
	    case "Joint friction" :
	    ds_list_clear(creator.save_joint_friction);
	    ds_list_copy(creator.save_joint_friction, joint_list);break;
	    case "Joint pulley" :
	    ds_list_clear(creator.save_joint_pulley);
	    ds_list_copy(creator.save_joint_pulley, joint_list);break;
	    case "Joint weld" :
	    ds_list_clear(creator.save_joint_weld);
	    ds_list_copy(creator.save_joint_weld, joint_list);break;
	    case "Joint wheel" :
	    ds_list_clear(creator.save_joint_wheel);
	    ds_list_copy(creator.save_joint_wheel, joint_list);break;
	   }
	   ds_list_clear(creator.save_joint_offset);
	   ds_list_copy (creator.save_joint_offset, joint_offset);
	  }
	 }
	}
}