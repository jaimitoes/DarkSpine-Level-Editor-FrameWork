/// @description dks_pipeline_optimize
function dks_pipeline_optimize() 
{
	if instance_exists(obj_deco) and (modo = mode.create)
	{
	 /////////////////////////////////////////////////////
	 var d2d = ds_list_create();
	 var d_vertex = ds_list_create();
	 var d_spine = ds_list_create();
	 var s = instance_number(obj_deco);
	 show_debug_message("instances:" + string(s));
	 var i;
	 for(i =0; i<s; i++)
	 {
	  var inst = instance_find(obj_deco,i);
   if (inst.have_texture) or (inst.have_path_texture)
	  {
	   ds_list_add(d_vertex, inst.id);
	  }
	  else if (inst.is_spine)
	  {
	   ds_list_add(d_spine,inst.id);
	  }
	  else
	  {
	   ds_list_add(d2d,inst.id);
	  }
	 }
	 ////////////////////////////////////////////////////////////////// 
  var d2d_sort = ds_list_create();
	 s = ds_list_size(d2d);
	 show_debug_message("primary total 2d: "+string(s));
	 var text_match1,text_match2;
	 for(i =0; i<s; i++)
	 {
	  if (d2d[| i] != -1)
	  {
    for (var j =0; j<s;j++)
	   {
	    if(d2d[| j] !=-1) and (d2d[| j] != d2d[| i])
	    {
      tex_match1 = d2d[| i].sprite_index;
	     tex_match2 = d2d[| j].sprite_index;
	     if(tex_match1 = tex_match2) 
	     {
	      ds_list_add(d2d_sort,d2d[| j]);
	      show_debug_message(sprite_get_name(d2d[| j].sprite_index));
	      d2d[| j] = -1;
	     }
	    }
	   }
	   ds_list_add(d2d_sort, d2d[| i]);
	   show_debug_message(sprite_get_name(d2d[| i].sprite_index));
	   d2d[| i] = -1;
	  }
	 }
  ds_list_clear(d2d);
	 ds_list_copy(d2d,d2d_sort);
	 ds_list_destroy(d2d_sort);
	 s = ds_list_size(d2d);
	 show_debug_message("secondary total 2d: "+string(s));
  ////////////////////////////////////////////////////////////////// 
  var spine_sort = ds_list_create();
	 s = ds_list_size(d_spine);
	 show_debug_message("primary total Spine: "+string(s));
	 var text_match1,text_match2;
	 for(i =0; i<s; i++)
	 {
	  if (d_spine[| i] != -1)
	  {
    for (var j =0; j<s;j++)
	   {
	    if(d_spine[| j] !=-1) and (d_spine[| j] != d2d[| i])
	    {
      tex_match1 = d2d[| i].sprite_index;
	     tex_match2 = d2d[| j].sprite_index;
	     if(tex_match1 = tex_match2) 
	     {
	      ds_list_add(spine_sort,d_spine[| j]);
	      show_debug_message(sprite_get_name(d_spine[| j].sprite_index));
	      d_spine[| j] = -1;
	     }
	    }
	   }
	   ds_list_add(spine_sort, d_spine[| i]);
	   show_debug_message(sprite_get_name(d_spine[| i].sprite_index));
	   d_spine[| i] = -1;
	  }
	 }
  ds_list_clear(d_spine);
	 ds_list_copy(d_spine,spine_sort);
	 ds_list_destroy(spine_sort);
	 s = ds_list_size(d_spine);
	 show_debug_message("secondary total Spine: "+string(s));
  ////////////////////////////////////////////////////////////////
		if (!ds_list_empty(d_vertex))
		{
		 var vsort = ds_list_create();
		 s = ds_list_size(d_vertex);
		 show_debug_message("primary total Vertex: "+string(s));
		 for(i =0; i<s; i++)
		 {
		  if (d_vertex[| i] != -1)
		  {
     for (var j =0; j<s;j++)
	    {
	     if(d_vertex[| j] !=-1) and (d_vertex[| j] != d_vertex[| i])
	     {
	      var tex_match1 = d_vertex[| i].path_texture;
	      var tex_match2 = d_vertex[| j].path_texture;
	      if(tex_match1 = tex_match2) 
	      {
	       ds_list_add(vsort,d_vertex[| j]);
	       show_debug_message(sprite_get_name(d_vertex[| j].path_texture));
	       d_vertex[| j] = -1;
	      }
	     }
	    }
	    ds_list_add(vsort, d_vertex[| i]);
	    show_debug_message(sprite_get_name(d_vertex[| i].path_texture));
	    d_vertex[| i] = -1;
	   }
	  }
		 ds_list_clear(d_vertex);
		 ds_list_copy(d_vertex,vsort);
		 ds_list_clear(vsort);
		 s = ds_list_size(d_vertex);
		 show_debug_message("primary total Vertex: "+string(s)); 
	 }
  //////////////////////////////////////////////// 
  for(i =0; i<s; i++)
	 {
	  if (d_vertex[| i] != -1)
	  {
    for (var j =0; j<s;j++)
	   {
	    if(d_vertex[| j] !=-1) and (d_vertex[| j] != d_vertex[| i])  and sprite_exists(d_vertex[| i].vertex_texture)and sprite_exists(d_vertex[| j].vertex_texture)
	    {
	     var tex_match1 = d_vertex[| i].vertex_texture;
	     var tex_match2 = d_vertex[| j].vertex_texture;
	     if(tex_match1 = tex_match2) 
	     {
	      ds_list_add(vsort,d_vertex[| j]);
	      show_debug_message(sprite_get_name(d_vertex[| j].vertex_texture));
	      d_vertex[| j] = -1;
	     }
	    }
	   }
	   ds_list_add(d2d_sort, d_vertex[| i]);
	   show_debug_message(d_vertex[| i].vertex_texture);
	   d_vertex[| i] = -1;
	  }
	 }
		ds_list_clear(d_vertex);
		ds_list_copy(d_vertex,vsort);
		ds_list_destroy(vsort);
		////////////////////////////////////////////////
	 if not ds_list_empty(d_spine)
	 {
	  s = ds_list_size(d_spine);
	  for( i =0; i<s; i++)
	  {
	   ds_list_add(d2d,d_spine[| i]);
	  }
	 }
	 ds_list_destroy(d_spine);
	/////////////////////////////////////////////////// 
	 if not ds_list_empty(d_vertex)
	 {
	  s = ds_list_size(d_vertex);
	  for( i =0; i<s; i++)
	  {
	   ds_list_add(d2d,d_vertex[| i]);
	  }
	 }
	 ds_list_destroy(d_vertex);
	 //////////////////////////////////////////////////
	 
	 s = ds_list_size(d2d);
	 show_debug_message("total converted: "+ string(s));
  for(i =0; i<s; i++)
	 {
	  if instance_exists(d2d[| i])
	  { 
    show_debug_message("exist: " + string(i));
	   show_debug_message(sprite_get_name(d2d[| i].sprite_index));
	   if (d2d[| i].have_texture)
	   {
	    show_debug_message(sprite_get_name(d2d[| i].vertex_texture));
	   }
	   if (d2d[| i].have_path_texture)
	   {
	    show_debug_message(sprite_get_name(d2d[| i].path_texture));
	   }
	  }
	  else
	  {
	   show_debug_message("Null");
	  }
	 }
	 ///////////////////////////////////////////////// 
		var map = ds_map_create(), i,j;
		if !ds_map_empty(sp_map)
		{
		 var st = ds_list_create();
		 ds_list_copy(st,sprite_tab);
		 ds_map_add_list(map,"sprite_tab",st);
		 var st_map = ds_map_create();
		 ds_map_copy(st_map, sp_map);
		 var jmap = json_encode(st_map);
		 ds_map_add(map,"sp_map",jmap);
		 ds_map_add(map,"texture_pack",1);
		}
		else
		{
		 ds_map_add(map,"texture_pack",0);
		}
		var interface_list = ds_list_create_from_array(interface);
		ds_map_add_list(map,"interface",interface_list);
		// save room properties
		var room_list = ds_list_create();
		room_list[| 0] = room_width;
		room_list[| 1] = room_height;
		room_list[| 2] = room_speed;
		room_list[| 3] = physics_pause;
		room_list[| 4] = physics_grav_x;
		room_list[| 5] = physics_grav_y;
		room_list[| 6] = physics_p_to_m;
		room_list[| 7] = physics_iterations;
		room_list[| 8] = physics_update_speed;
		room_list[| 9] = texture_flushing;
		room_list[| 10]= texture_interpolation;
		ds_map_add_list(map,"room_settings",room_list);
  /// layers
	 var layer_list = ds_list_create_from_array2d(layer_index);
	 ds_map_add_list(map,"layers",layer_list);
	 // save objects settings
		var total_inst = ds_list_size(d2d);
		if (!ds_list_empty(d2d))
		{
		 var datatween;
		 datatween[0] = "x";
		 datatween[1] = "y";
		 datatween[2] = "image_xscale";
		 datatween[3] = "image_yscale";
		 datatween[4] = "image_angle";
		 datatween[5] = "image_alpha";
		 datatween[6] = "image_blend";
		 datatween[7] = "depth";
		 datatween[8] = "x_rotation";
		 datatween[9] = "y_rotation";
   map[? "objects"] =total_inst;
   for (var i = 0;i<total_inst;i++)
	  {
	   var inst= d2d[| i];
    with(inst)
			 {
			  var value = ds_list_create();
			  value[| 0] = x;
			  value[| 1] = y;
			  value[| 2] = sprite_get_name(sprite_index);
			  value[| 3] = image_xscale;
			  value[| 4] = image_yscale; 
			  value[| 5] = image_angle;
			  value[| 6] = image_blend;
			  value[| 7] = image_alpha;
			  value[| 8] = depth;
			  value[| 9] = bind_xoffset;
			  value[| 10]= bind_yoffset;
			  //value[| 11]= current_tab;
			  value[| 12]= have_texture;
			  value[| 13]= have_polygon;
			  value[| 14]= joint;
			  value[| 15]= joint_target;
			  value[| 16]= joint_parent;
			  //value[| 17]= light_intensity;
			  value[| 18]= sprite_get_name(path_texture);
			  value[| 19]= is_spine;
			  value[| 20]= have_path_texture;
			  value[| 21]= smooth_terrain;
			  value[| 22]= terrain_split;
			  value[| 23]= segment_split;
			  value[| 24]= perform_event;
			  value[| 25]= is_physics;
			  value[| 26]= sprite_get_name(vertex_texture);
			  value[| 27]= 0; // if is spine, get the animation
			  value[| 28] = poly_closed;
			  value[| 29] = corner_left;
			  value[| 30] = corner_right;
			  value[| 31] = 0; // if is spine, get the animation frame
     value[| 32] = image_speed;
			  value[| 33] = lay_depth;
			  value[| 34] = layer_offset;
			  value[| 35] = x_rotation;
			  value[| 36] = y_rotation;
			  value[| 37] = object_transform;
			  value[| 38] = blend_mode;
			  value[| 39] = script_get_name(draw_method);
			  value[| 40] = visible;
			  value[| 41] = have_tween;/// to check if have tween true/false
			  value[| 42] = v_split;/// number of vertical texture splits of a non closed path textute
			  value[| 43] = col_xoff;
			  value[| 44] = col_yoff;
			  value[| 45] = corner1_xoff;
			  value[| 46] = corner1_yoff;
			  value[| 47] = corner2_xoff;
			  value[| 48] = corner2_yoff;
			  value[| 49] = activated;
			  value[| 50] = is_visible;
			  value[| 51] = object_execute;
			  value[| 52] = path_image;
	    value[| 53] = fill_image;
			  if is_array(variables)
			  {
			   var var_list = ds_list_create_from_array(variables);
			   ds_map_add_list(map,"ob"+string(i)+"variables",var_list);
			  }
     
					if is_array(dk_part)
			  {
			   var part_list = ds_list_create_from_array(dk_part);
			   ds_map_add_list(map,"ob"+string(i)+"particles",part_list);
			  }
     
					if  (is_spine) 
	    {
      value[| 31] = skeleton_animation_get_frame(0);
	     value[| 27] = skeleton_animation_get();
			  }  
	    else
			  {
			   value[| 31] = image_index;
			  }
  
     if(is_physics)
				 { 
				  var proplist = ds_list_create()
				  ds_list_copy(proplist,phyprops);
				  ds_map_add_list(map, "ob"+string(i)+"phyprops", proplist);
      if (joint)
				  {
				   var jl = ds_list_create();
				   ds_list_copy(jl,joint_list);
				   ds_map_add_list(map,"ob"+string(i)+"joint_list",jl);
       var jo = ds_list_create();
				   ds_list_copy(jo,joint_offset);
				   ds_map_add_list(map,"ob"+string(i)+"joint_offset",jo);
      }
     }
     if (have_polygon)
	    {
		    var pl = ds_list_create();
			   ds_list_copy(pl,poly_list);
			   var bz1 = ds_list_create_from_array(bezier_n1);
			   var bz2 = ds_list_create_from_array(bezier_n2);
			   ds_map_add_list(map,"ob"+string(i)+"poly_list",pl);
			   ds_map_add_list(map,"ob"+string(i)+"bezier1",bz1);
			   ds_map_add_list(map,"ob"+string(i)+"bezier2",bz2);
	    }
     if (have_tween)
				 {
				  var t_list = ds_list_create();
      for (var j =0; j<10; j++)
				  {
				   if (tween[j] != -1)
				   {
				    ds_list_add(t_list, j);
				    ds_list_add(t_list, script_get_name(TweenGet(tween[j],"ease")));
				    ds_list_add(t_list, TweenGet(tween[j],"mode"));
				    ds_list_add(t_list, TweenGet(tween[j],"delta"));
				    ds_list_add(t_list, TweenGet(tween[j],"delay_start"));
				    ds_list_add(t_list, TweenGet(tween[j],"duration"));
				    ds_list_add(t_list, datatween[j]);
				    if(j = 6)
				    {
         var props = TweenGet(tween[j], "property");
	        var data = props[1];
         ds_list_add(t_list, data[0]);
	        ds_list_add(t_list, data[1]); 
	       }
				    else
				    {
			      ds_list_add(t_list, TweenGet(tween[j],"start"));
				     ds_list_add(t_list, TweenGet(tween[j],"destination"));
				    }
       }
	     } 
	     ds_map_add_list(map,"ob"+string(i)+"tween",t_list);
	     if is_array(tweenS)
						{
						 var z;	
						 var tl = array_length(tweenS);
						 ds_map_add(map, "ob"+string(i)+"sequence", tl);
						 for ( j = 0; j<tl; j++)
						 {
						  var ts_list = ds_list_create();	 
						  var td_list = ds_list_create();
						  for(z = 0; z<array_length(tweenS[j]); z++)
						  {
						   ts_list[| z] = tweenS[j][z];	  
						  }
		      ds_map_add_list(map, "ob"+string(i)+"tweenS"+string(j), ts_list);
						  for(z = 0; z<array_length(tweenD[j]); z++)
						  {
						   	td_list[| z] = tweenD[j][z];  
						  }
		      ds_map_add_list(map, "ob"+string(i)+"tweenD"+string(j), td_list);
						  if is_array(tweenCst)
						  {
						   var tcst_list = ds_list_create();	  
						   for(z = 0; z<array_length(tweenCst[j]); z++)
						   {
						  	tcst_list[| z] = tweenCst[j][z];  
						   }
						   ds_map_add_list(map, "ob"+string(i)+"tweenCst"+string(j), tcst_list);
						  } 
						  if is_array(tweenCed)
						  {
						   var tced_list = ds_list_create();	  
						   for(z = 0; z<array_length(tweenCed[j]); z++)
						   {
						  	tced_list[| z] = tweenCed[j][z];  
						   }
						   ds_map_add_list(map, "ob"+string(i)+"tweenCed"+string(j), tced_list);
						  } 
						  if is_array(tweenCstop)
						  {
						   var tcstop_list = ds_list_create();	  
						   for(z = 0; z<array_length(tweenCstop[j]); z++)
						   {
						  	tcstop_list[| z] = tweenCstop[j][z];  
						   }
						   ds_map_add_list(map, "ob"+string(i)+"tweenCstop"+string(j), tcstop_list);
						  } 
		     }
		    }
	    }
     ds_map_add_list(map, "ob"+string(i)+"value", value);
    } 
	  }  

	  for (var i = 0;i<total_inst;i++)
			{
			 var inst= d2d[| i];
			 with(inst)
			 {
			  var total_inst = ds_list_size(d2d);
			  if (bind_target !=noone)
			  {
			   for (var c =0;c<total_inst;c++)
			   {
			    var t_bind = d2d[| c];
			    if (bind_target = t_bind)
			    {
			     map[? "ob"+string(i)+"bind"] = c;break;
			    }
			   }
			  } 
    
			  if (joint)
			  {
			   for (var c =0;c<total_inst;c++)
			   {
			    var j_target = d2d[| c];
			    if (joint_target = j_target)
			    {
			     map[?"ob"+string(i)+"joint_target"] = c;break;
			    }
			   } 
    
		    if (phyprops[| physics.joint_type] = "Joint gear")
		    {
		     for (var g =0;g<total_inst;g++)
		     {
		      var g_target = d2d[| g];
		      if (joint_list[| e_joint_gear.joint_2] = g_target)
		      {
		       ds_list_replace(map[? "ob"+string(i)+"joint_list"],1,g); break;
		      }
		     }
		    }
     }
    }   
	  }
	 }
  ds_list_destroy(d2d);
	 var lvstr = working_directory + "DarkSpine\\Levels\\Launcher\\optimizer.json";
	 if file_exists(lvstr)
		{
		 file_delete(lvstr);
		}
	 var json_level = json_encode(map);
		var buffer = buffer_create(1024,buffer_grow,1);
		buffer_write(buffer,buffer_string,json_level);
		buffer_save(buffer,lvstr);
		buffer_delete(buffer);
		ds_map_destroy(map);
		dks_level_destroy();
		draw_texture_flush();
		dks_work_load("Launcher","optimizer");
		dks_message("Pipeline optimized");
	}
}