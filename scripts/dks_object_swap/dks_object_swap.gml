/// @description dks_object_swap(x,y,object)
/// @param x
/// @param y
/// @param object
function dks_object_swap(argument0, argument1, argument2) {
	var ob = instance_create_depth(argument0,argument1,depth,argument2);
	with (ob)
	{
	 var creator = other.id;
	 parent = creator.parent;
	 //current_tab = creator.current_tab;
	 have_texture = creator.have_texture;
	 have_path_texture = creator.have_path_texture;
	 have_tween = creator.have_tween;
	 have_polygon = creator.have_polygon;
	 is_spine = creator.is_spine;
	 //have_light = creator.have_light;
	 is_physics = creator.is_physics;
	 lay_depth = creator.lay_depth;
	 layer_offset = creator.layer_offset;
	 x_rotation = creator.x_rotation;
	 y_rotation = creator.y_rotation;
	 object_transform = creator.object_transform;
	 blend_mode = creator.blend_mode;
	 draw_method = creator.draw_method;
	 visible = creator.visible;
	 vertex_xscale = creator.vertex_xscale;
	 vertex_yscale = creator.vertex_yscale;
	 vertex_angle = creator.vertex_angle;
	 col_xoff = creator.col_xoff;
	 col_yoff = creator.col_yoff;
	 corner1_xoff = creator.corner1_xoff;
	 corner1_yoff = creator.corner1_yoff;
	 corner2_xoff = creator.corner2_xoff;
	 corner2_yoff = creator.corner2_yoff;
	 activated = creator.activated;
	 is_visible = creator.is_visible;
	 perform_event = creator.perform_event;
	 object_execute = creator.object_execute;
	 path_image = creator.path_image;
	 fill_image = creator.fill_image;
	 // light intensity
	 //light_intensity = creator.light_intensity;
	 sprite_index = creator.sprite_index;
	 image_speed = creator.image_speed;
	 depth = lay_depth + layer_offset;
	 image_blend = creator.image_blend;
	 image_angle = creator.image_angle;
	 image_xscale= creator.image_xscale;
	 image_yscale= creator.image_yscale;
	 image_alpha = creator.image_alpha;
	 bl_h = colour_get_hue(image_blend);
	 bl_s = colour_get_saturation(image_blend);
	 bl_v = colour_get_value(image_blend);
	 dks_set_offset(id, global.mouse_xd, global.mouse_yd);
	 if is_array(creator.variables)
	 {
	  variables = dks_array_copy(creator.variables);
	 }
	 if is_array(creator.dk_part)
	 {
	  dk_part = dks_array_copy(creator.dk_part);
	 }
 
	 if (is_spine)
	 {       
	  with(creator)
	  {
	   other.spine_animation = skeleton_animation_get();
	   other.frame = skeleton_animation_get_frame(0);
	  } 
	  skeleton_animation_set_frame(0,frame);
	 }
	 else
	 {
	  image_index = creator.image_index;
	 }      
	 image_speed = creator.image_speed;       

	 if(have_polygon)
	 {
	  dks_matrix_update();
	  poly_closed = creator.poly_closed;
	  path_texture = creator.path_texture;
	  poly_list = ds_list_create();
	  ds_list_copy(poly_list,creator.poly_list);
	  bezier_n1 = dks_array_copy(creator.bezier_n1);
	  bezier_n2 = dks_array_copy(creator.bezier_n2);
	  poly_off = dks_array_create_from_list(poly_list);
	  bz1_off = dks_array_copy(bezier_n1);
	  bz2_off = dks_array_copy(bezier_n2);
	  if (have_path_texture)
	  {
	   smooth_terrain = creator.smooth_terrain;
	   terrain_split = creator.terrain_split;
	   v_split = creator.v_split;
	   segment_split = creator.segment_split;
	   corner_left = creator.corner_left;
	   corner_right = creator.corner_right;
	   have_path_texture = false;
	   dks_vertex_terrain_create();
	  }
	  if(have_texture)
	  {
	   vertex_texture = creator.vertex_texture;
	   have_texture = false;
	   dks_vertex_shape_create();
	  }
	 }
         
	 if (have_tween)
	 {
	  var ea,mo,de,del,du,prop,st,dt;	 
	  if is_array(creator.tweenS)
	  {
	   tweenS = dks_array2d_copy(creator.tweenS);
	   tweenD = dks_array2d_copy(creator.tweenD);
	   if is_array(creator.tweenCst)
	   {
		   tweenCst = dks_array2d_copy(creator.tweenCst);   
	   }
	   if is_array(creator.tweenCed)
	   {
	    tweenCed = dks_array2d_copy(creator.tweenCed);   
	   }
   
	   if is_array(creator.tweenCstop)
	   {
	    tweenCstop= dks_array2d_copy(creator.tweenCstop);   
	   }
	   for (var j =0; j<10; j++)
	   {
	    if (creator.tween[j] != -1)
	    {
	      ea = TweenGet(creator.tween[j],"ease");
	      mo = TweenGet(creator.tween[j],"mode");
	      de = TweenGet(creator.tween[j],"delta");
	      del = TweenGet(creator.tween[j],"delay_start");
	      du = TweenGet(creator.tween[j],"duration");
	      prop = TweenGet(creator.tween[j], "property");
	      st = TweenGet(creator.tween[j], "start");
	      dt = TweenGet(creator.tween[j], "destination");
	 
		 switch(j)
		 {
		  case 6:
		  var pr, dat;
	      pr = "image_blend";
	      dat = prop[1];
	      tween[j] = TweenCreate(id, ea, mo, de, del, du, pr, dat[0], dat[1]);
		  TweenAddCallback(tween[j],TWEEN_EV_FINISH,id, dks_sequence_set, j, "image_blend");
		  break;
		  case 7:
		  if variable_instance_exists(id,"z")
		  {
		   prop = "z";	  
		  }
		  tween[j] = TweenCreate(id, ea, mo, de, del, du, prop, st, dt);
		  TweenAddCallback(tween[j],TWEEN_EV_FINISH,id, dks_sequence_set, j, prop); 
		  break;
		  default :
		  tween[j] = TweenCreate(id, ea, mo, de, del, du, prop, st, dt);
		  TweenAddCallback(tween[j],TWEEN_EV_FINISH,id, dks_sequence_set, j, prop); 
		 }
	    }
	    else
	    {
	     tween[j] = -1;
	    }
	   } 
   
	  }
	  else
	  {
	   for (var j =0; j<10; j++)
	   {
	    if (creator.tween[j] != -1)
	    {
	     var ea = TweenGet(creator.tween[j],"ease");
	     var mo = TweenGet(creator.tween[j],"mode");
	     var de = TweenGet(creator.tween[j],"delta");
	     var del = TweenGet(creator.tween[j],"delay_start");
	     var du = TweenGet(creator.tween[j],"duration");
	     var prop = TweenGet(creator.tween[j], "property");
	     var st = TweenGet(creator.tween[j], "start");
	     var dt = TweenGet(creator.tween[j], "destination");
	     switch(j)
		 {
		  case 6:
		  var pr, dat;
	      pr = "image_blend";
	      dat = prop[1];
	      tween[j] = TweenCreate(id, ea, mo, de, del, du, pr, dat[0], dat[1]);
		  break;
		  default :
		  tween[j] = TweenCreate(id, ea, mo, de, del, du, prop, st, dt);
		 }
		}
	    else
	    {
	     tween[j] = -1;
	    }
	   }   
	  }
	 }        
        
	 if (is_physics)
	 {
	  //physics varialbes
	  phyprops = ds_list_create();
	  ds_list_copy(phyprops,creator.phyprops);
	  //physics_joint_variables
	  joint = creator.joint;
	  joint_target = creator.joint_target;
	  joint_parent = creator.joint_parent;
	  if (joint)
	  {
	   joint_list = ds_list_create();
	   ds_list_copy(joint_list,creator.joint_list);
	   joint_offset = ds_list_create();
	   ds_list_copy(joint_offset,creator.joint_offset);
	  }
	 }
 
	 if(other.bind_target !=noone)
	 {
	  bind_target = other.bind_target;
	  var s = array_length(bind_target.child)
	  for(var z =0; z<s; z++)
	  {
	   if (bind_target.child[z] = other.id)
	   {
	    bind_target.child[@ z] = id;
	    other.bind_target = noone;
	    break;
	   }
	  }
	 }

	 if (parent)
	 {
	  var s = array_length(other.child)
	  for(var z =0; z<s; z++)
	  {
	   child[z] = other.child[z];
	   child[z].bind_target = id;
	   if(other.child[z].joint)
	   {
	    if(other.child[z].joint_target = other.id)
	    {
	     child[z].joint_target = id;
	     child[z].joint = true;
	    }
	    else
	    {
	     child[z].joint_target = other.child[z].joint_target;
	    }
	   }
	  }
	 }
	}
 instance_destroy();
	return ob.id;
}