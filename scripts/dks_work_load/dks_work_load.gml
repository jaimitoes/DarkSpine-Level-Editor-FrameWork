/// @description dks_work_load( Folder name, level_name)
/// @param  Folder name
/// @param  level_name
function dks_work_load(argument0, argument1) 
{
	// LOAD ANY WORK STORED IN THE INDICATED LEVEL FOLDER STRUCTURE
 //Destroy all the current Deco object placed in the editor 
	dks_level_destroy();
	// Get the name of the level to load
	var lvstr = working_directory + "DarkSpine\\Levels\\"+argument0+"\\"+argument1+".json";
	// Creates a temporary map from our Json level file
	var buffer_level = buffer_load(lvstr);
	var js1 = buffer_read(buffer_level,buffer_string);
	var map = json_decode(js1);
	buffer_delete(buffer_level);    
	//Check if a sprite structure exists and load it into the default sprite manager structure
	var texture_pack = map[? "texture_pack"];
	if (texture_pack)
	{
	 current_tab = -1;
	 ds_map_destroy(sp_map);
	 ds_list_copy(sprite_tab,map[? "sprite_tab"]);
	 sp_map = json_decode(map[? "sp_map"]);
	}
	//Load the room properties
	var room_list = map[? "room_settings"];
	room_width = room_list[| 0];
	room_height= room_list[| 1];
	room_speed = room_list[| 2];
	physics_pause = room_list[| 3];
	physics_grav_x = room_list[| 4];
	physics_grav_y = room_list[| 5];
	physics_p_to_m = room_list[| 6];
	physics_iterations = room_list[| 7];
	physics_update_speed = room_list[| 8];
	texture_flushing = room_list[| 9];
	texture_interpolation = room_list[| 10];
	//Check the variable "texture_flushing" if level to load needs a texture flushing
	if (texture_flushing)
	{
	 draw_texture_flush()
	}
	// Set the physics world properties
	physics_world_create(physics_p_to_m);
	physics_world_update_iterations(physics_iterations);
	physics_world_update_speed(physics_update_speed);
	physics_world_gravity(physics_grav_x,physics_grav_y);
	physics_pause_enable(physics_pause);
	// Set the texture interpolation type
	gpu_set_texfilter(texture_interpolation);
	// Load the Layer properties create previously for this level
	var layer_list = map[? "layers"];
	layer_index = 0;
	var s = ds_list_size(layer_list);
	var c = 0,r = 0;
	for (var i =0; i<s; i++)
	{
	 layer_index[c][r] = layer_list[| i];
	 if(r = 3)
	 {
	  c +=1;
	  r =0;
	  continue;
	 }
	 r+=1;
	}
	//N1 LOOP:
	//Loop trought the stored Deco objects
	var total_inst = map[?  "objects"];
	if(total_inst >0)
	{
	 for (var i = 0;i<total_inst;i++)
	 {
	  var value = map[? "ob"+string(i)+"value"];
	  var ob = obj_deco; 
	  // Check from this value if our object starts like a regular Deco object or into another.id assigned previously from the editor.
	  if (value[|51])
	  {
	   ob = asset_get_index(value[| 37]);
	   if !object_exists(ob)
	   {
	    ob = obj_deco;
	   }
	  }
	  // Set the saved values of our default Deco variables.
	  with(instance_create_depth(value[| 0],value[| 1],value[| 8],ob))
	  {    
	   sprite_index = asset_get_index(value[| 2]);
	   image_speed =0;
	   image_index =0;
	   image_xscale  = value[| 3];
	   image_yscale  = value[| 4];
	   image_angle   = value[| 5];
	   image_blend   = value[| 6];
	   image_alpha   = value[| 7];
	   //depth       = value[| 8];
	   bind_xoffset  = value[| 9];
	   bind_yoffset  = value[| 10];
	   //free slot  value[| 11];
	   have_texture  = value[| 12];
	   have_polygon  = value[| 13];
	   joint         = value[| 14];
	   joint_target  = value[| 15];
	   joint_parent  = value[| 16];
	   //free slot value[| 17];
	   path_texture = asset_get_index(value[| 18]);
	   is_spine = value[| 19];
	   have_path_texture = value[| 20];
	   smooth_terrain = value[| 21];
	   terrain_split = value[| 22];
	   segment_split = value[| 23];
	   perform_event = value[| 24];
	   is_physics = value[| 25];
	   vertex_texture = asset_get_index(value[| 26]);
	   poly_closed = value[| 28];   
	   corner_left = value[| 29];
	   corner_right = value[| 30];
	   lay_depth = value[| 33];
	   layer_offset = value[| 34];
	   x_rotation = value [| 35];
	   y_rotation = value [| 36];
	   object_transform = value[| 37];
	   blend_mode = value[| 38];
	   draw_method = asset_get_index(value[| 39]);
	   visible = value[| 40];
	   have_tween = value[| 41];
	   v_split = value[| 42];
	   col_xoff = value[|43];
	   col_yoff = value[|44];
	   corner1_xoff = value[|45];
	   corner1_yoff = value[|46];
	   corner2_xoff = value[|47];
	   corner2_yoff = value[|48];
	   activated = value[| 49];
	   is_visible = value[| 50];
	   object_execute = value[| 51];
	   path_image = value[| 52];
	   fill_image = value[| 53];
	   // Set the offset and start values relative to the World and mouse coordinates
	   dks_set_offset(id, x, y);
	   // Set our custom variables if this structure exist, always stored in the variable "variables"
	   if (map[? "ob"+string(i)+"variables"] !=undefined)
	   {
	    variables = dks_array_create_from_list(map[? "ob"+string(i)+"variables"]);
	   }
	   // Set the particle structure if this one exists 
	   if (map[? "ob"+string(i)+"particles"] !=undefined)
	   {
	    dk_part = dks_array_create_from_list(map[? "ob"+string(i)+"particles"]);
	   }
	   // Set the animation and frame of a Spine sprite
	   if (is_spine)
	   {
	    skeleton_animation_set(value[| 27]);
	    skeleton_animation_set_frame(0,value[| 31]);
	   }
	   else
	   {
		  //Set the index of a regular sprite   
	    image_index = value[| 31];
	   }
	   // Set the saved image speed
	   image_speed = value[| 32];
	   //Check if our deco object contains any vertex buffer structure
	   if (have_polygon)
	   {
		   // Update the default matrix of our Deco object based on your coordinates   
	    dks_matrix_update();
	    poly_list = dks_list_create_from_map(map[?  "ob"+string(i)+"poly_list"]);
	    bezier_n1 = dks_array_create_from_list(map[?  "ob"+string(i)+"bezier1"]);
	    bezier_n2 = dks_array_create_from_list(map[?  "ob"+string(i)+"bezier2"]);
	    poly_off = dks_array_create_from_list(poly_list);
	    bz1_off = dks_array_copy(bezier_n1);
	    bz2_off = dks_array_copy(bezier_n2);
     if(have_path_texture)
	    {
	     have_path_texture = false;
	     dks_vertex_terrain_create();
	    }
     if(have_texture)
	    {
	     have_texture = false;
	     dks_vertex_shape_create();
	    }
	   }
            
	   if(is_physics)
	   {    
	    phyprops = dks_list_create_from_map(map[?  "ob"+string(i)+"phyprops"]);
	    if (joint)
	    {
	     joint_list = dks_list_create_from_map(map[? "ob"+string(i)+"joint_list"]);
	     joint_offset = dks_list_create_from_map(map[? "ob"+string(i)+"joint_offset"]);
	    }
	   }
   
	   if (have_tween) ///Tweens
	   {
		   if ds_map_exists(map, "ob"+string(i)+"sequence")
		   {
		    var tt = map[? "ob"+string(i)+"sequence"];	
		    for (var j = 0; j<tt; j++)
		    {
		     var tslist = map[? "ob"+string(i)+"tweenS"+string(j)];
		     var tdlist = map[? "ob"+string(i)+"tweenD"+string(j)];
		     var tsz = ds_list_size(tslist);
		     for ( var z = 0; z<tsz; z++)
		     {
		      tweenS[j][z] = tslist[| z];	
		     }
		     var tdz = ds_list_size(tdlist);
		     for ( var z = 0; z<tdz; z++)
		     {
		      tweenD[j][z] = tdlist[| z];	
	      }
		     ///////////////////////////////////////////////
						 var tcst = "ob"+string(i)+"tweenCst"+string(j);
						 var tced = "ob"+string(i)+"tweenCed"+string(j);
						 var tcstop = "ob"+string(i)+"tweenCstop"+string(j);
						 if ds_map_exists(map, tcst)
						 {
		      var stlist = map[? tcst];
		      var sts = ds_list_size(stlist);
		      for (var z = 0; z<sts; z++)
		      {
			      tweenCst[j][z] = stlist[| z];   
		      }
		     }
							
					  if ds_map_exists(map, tced)
					  {
					   var cedlist = map[? tced];
					   var ceds = ds_list_size(cedlist);
					   for (var z = 0; z<ceds; z++)
					   {
						   tweenCed[j][z] = cedlist[| z];   
					   }	  
					  }
							
					  if ds_map_exists(map, tcstop)
					  {
					   var cstoplist = map[? tcstop];
					   var cstops = ds_list_size(cstoplist);
					   for (var z = 0; z<cstops; z++)
					   {
						   tweenCstop[j][z] = cstoplist[| z];   
					   }	  
					  }
		    }
		   }   
		   ///////////////////////////////////////
	    for (var j =0; j<10; j++)
	    {
	     tween[j] = -1;
	    }
	    var t_list = map[? "ob"+string(i)+"tween"];
	    var ss = ds_list_size(t_list);
	    var pp;
					if is_array(tweenS)
					{
					 for (var j =0; j<ss; j+=9)
				  {
				   pp = t_list[| j];
				   tween[@ pp] = TweenCreate(id, asset_get_index(t_list[| j+1]),t_list[| j+2], t_list[| j+3], t_list[| j+4], t_list[| j+5], t_list[| j+6], t_list[| j+7], t_list[| j+8]);
					  TweenAddCallback(tween[pp],TWEEN_EV_FINISH,id, dks_sequence_set, pp, t_list[| j+6]);
					 }
	    }
	    else
		   {
		    for (var j =0; j<ss; j+=9)
	     {
	      pp = t_list[| j];
	      tween[@ pp] = TweenCreate(id, asset_get_index(t_list[| j+1]),t_list[| j+2], t_list[| j+3], t_list[| j+4], t_list[| j+5], t_list[| j+6], t_list[| j+7], t_list[| j+8]);
		    }
		   }
	   }
	  }
	 }
	 //N2 LOOP:
	 for (var i = 0;i<total_inst;i++)
	 {
	  var inst= instance_find(obj_deco,i);
	  with(inst)
	  {
	   // Draw the current sprite for a texture flushing proposite	  
	   script_execute(draw_method);
	   // Get the id for any parent related with this object 
	   var b_target = map[?  "ob"+string(i)+"bind"];
	   if (!is_undefined(b_target))
	   {
	    var this_target = instance_find(obj_deco,b_target);
	    bind_target = this_target.id;
	    this_target.parent = true;
	    with(this_target)
	    {
	     dks_matrix_update();
	    }
	    if (is_array(this_target.child))
	    {
	     var size = array_length(this_target.child);
	     this_target.child[size]= id;
	    } 
	    else
	    {
	     this_target.child[0] = id;
	    }
	   } 
	   // Get the id of secondary object involved in a Joint
	   if (joint)
	   {
	    var j_target = map[? "ob"+string(i)+"joint_target"];
	    if (!is_undefined(j_target))
	    {
	     var this_target = instance_find(obj_deco,j_target);
	     joint_target = this_target.id;
	    }
		// Get the third id related with a Gear Joint
	    if (phyprops[| physics.joint_type] = "Joint gear")
	    {
	     var gear_target = joint_list[| e_joint_gear.joint_2];
	     var this_joint = instance_find(obj_deco,gear_target);
	     joint_list[| e_joint_gear.joint_1] = joint_target;
	     joint_list[| e_joint_gear.joint_2] = this_joint.id;
	    }
	   }
	  }   
	 }
	 //N3 Loop
	 // Perform any event assigned in a Deco object, like a create End event
	 with(obj_deco)
	 {
	  if(object_execute)
	  {
	   if(perform_event >-1)
	   {
	    event_user(perform_event);
	   }
	  }
	 }
	}
	//Destroy the temporary map
	ds_map_destroy(map);
}