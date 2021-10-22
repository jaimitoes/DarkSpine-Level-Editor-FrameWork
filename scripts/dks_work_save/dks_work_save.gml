/// @description dks_work_save(Level folder, Level name)
/// @param Level folder
/// @param  Level name
function dks_work_save(argument0, argument1) 
{
	// Create the main map to store all the level and workspace data 
	var map = ds_map_create(), i,j;
	//Check if the current level contains a sprite structure and encode it in Json format
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
	//Check the current interface settings and save it into a map.
	var interface_list = ds_list_create_from_array(interface);
	ds_map_add_list(map,"interface",interface_list);
	// save the room properties into a list
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
	/// Save the current layer list structure into the main map
	var layer_list = ds_list_create_from_array2d(layer_index);
	ds_map_add_list(map,"layers",layer_list);
	// Loop throught all the existing object placed in the world
	var total_inst = instance_number (obj_deco);
	if (total_inst >0)
	{
	 // Create a temporal structure to store info related with Tweens	
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
	 //Store the total number of Deco objects placed in the room
	 map[? "objects"] = total_inst;
	 // N1 loop, store all data for each object
	 for (var i = 0;i<total_inst;i++)
	 {
	  var inst= instance_find(obj_deco,i);
	  with(inst)
	  {
	   // Store de default Deco variables into the list "value"	  
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
	   //value[| 11]= free slot;
	   value[| 12]= have_texture;
	   value[| 13]= have_polygon;
	   value[| 14]= joint;
	   value[| 15]= joint_target;
	   value[| 16]= joint_parent;
	   //value[| 17]= free slot;
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
	   // Store the custom variables structure
	   if is_array(variables)
	   {
	    var var_list = ds_list_create_from_array(variables);
	    ds_map_add_list(map,"ob"+string(i)+"variables",var_list);
	   }
	   // Store the particle data structure
	   if is_array(dk_part)
	   {
	    var part_list = ds_list_create_from_array(dk_part);
	    ds_map_add_list(map,"ob"+string(i)+"particles",part_list);
	   }
	   // Store the current spine animation and frame
	   if  (is_spine) 
	   {
	    value[| 31] = skeleton_animation_get_frame(0);
	    value[| 27] = skeleton_animation_get();
	   }  
	   else
	   {
		   // Store the image index of a regular sprite   
	    value[| 31] = image_index;
	   }
	   //Store the physcis data
	   if(is_physics)
	   { 
		   //Add the "phyprops" data structure if this exists   
	    var proplist = ds_list_create()
	    ds_list_copy(proplist,phyprops);
	    ds_map_add_list(map, "ob"+string(i)+"phyprops", proplist);
	    // Check and store if a joint exists
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
	   // Check if a vertex buffer structure exists and store it
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
	   // Store all existing Tweens of a deco object
	   if (have_tween)
	   {
		   var j;   
	    var t_list = ds_list_create();
	    for ( j = 0; j<10; j++)
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
	   // Store into the main map the default variable structure of our Deco object
	   ds_map_add_list(map, "ob"+string(i)+"value", value);     
	  } 
	 }  
	 ////////////////////////////////////////////////////////////////////////
	 //N2 loop:
	 //Store all the parentig data
	 for (var i = 0;i<total_inst;i++)
	 {
	  var inst= instance_find(obj_deco,i);
	  with(inst)
	  {
	   var total_inst = instance_number (obj_deco);
	   if (bind_target !=noone)
	   {
	    for (var c =0;c<total_inst;c++)
	    {
	     var t_bind = instance_find(obj_deco,c);
	     if (bind_target = t_bind)
	     {
	      map[? "ob"+string(i)+"bind"] = c;break;
	     }
	    }
	   } 
	   // Stores the Id of the second object belonging to a previously created.
	   if (joint)
	   {
	    for (var c =0;c<total_inst;c++)
	    {
	     var j_target = instance_find(obj_deco,c);
	     if (joint_target = j_target)
	     {
	      map[?"ob"+string(i)+"joint_target"] = c;break;
	     }
	    } 
	    // When our joint is a "joint gear" type, store the secondary target
		   // We need to pass another.id time trought all objects...
		   if (phyprops[| physics.joint_type] = "Joint gear")
	    {
	     for (var g =0;g<total_inst;g++)
	     {
	      var g_target = instance_find(obj_deco,g);
	      if (joint_list[| e_joint_gear.joint_2] = g_target)
	      {
	       ds_list_replace(map[? "ob"+string(i)+"joint_list"],1,g);break;
	      }
	     }
	    }
	   }
	  }   
	 }
	}
	// Assign the address where our level will be saved
	var lvstr = working_directory + "DarkSpine\\Levels\\"+argument0+"\\"+argument1+".json";
	// Delete any previous level created with the same name
	if file_exists(lvstr)
	{
	 file_delete(lvstr);
	}
	// encode the main map
	var json_level = json_encode(map);
	var buffer = buffer_create(1024,buffer_grow,1);
	// Write the buffer and save it
	buffer_write(buffer,buffer_string,json_level);
	buffer_save(buffer,lvstr);
	// Destroy all the temporary data from memory
	buffer_delete(buffer);
	ds_map_destroy(map);
}