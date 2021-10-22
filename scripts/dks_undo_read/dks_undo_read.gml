/// @description dks_undo_read(undo_map, 0 = und; 1 = redo);
/// @param undo_map
/// @param  0 = und; 1 = redo
function dks_undo_read(argument0, argument1) 
{
 var step;
	if(argument1)
	{
	 step = step_undo +1;
	}
	else
	{
	step = step_undo -1;
	}

	if ds_map_exists(argument0,step)
	{
	 dks_message("Undo ["+string(step)+"] recovered");
	 var map =  argument0[? step];   
	 var value = map[? "value"];
	 if(argument1)
	 {
	  step_undo +=1;
	 }
	 else
	 {
	  step_undo -=1;
	 }
	 switch(map[? "type"])
	 {
	  case 0: 
	  with(value[| 52])
	  {
	   ///////////////////////////////
	   if is_array(dk_part)
	   {
	    dk_part = 0;    
	   }
	   if is_array(variables)
	   {
	    variables = 0;
	   }
    
	   if (have_polygon)
	   {
	    if(instance_exists(obj_node))
	    {
	      dks_vertex_destroy(id);
	    }
	   }
    /*
	     if (joint) 
	     {
	      ds_list_destroy(joint_list);
	      ds_list_destroy(joint_offset);
	      physics_joint_delete(joint_id);
	     }
	   */
    if (is_physics)
	   {
     ds_list_destroy(phyprops);
	    physics_fixture_delete(fix);
	    physics_fixture_delete(b_fixture);
	   }
    dks_tween_destroy();
    //////////////////////////////
	   //current_tab   = value[| 11];
	   x = value[| 0];
	   y = value[| 1];
	   sprite_index = asset_get_index(value[| 2]);
	   image_speed =0;
	   image_index =0;
	   image_xscale  = value[| 3];
	   image_yscale  = value[| 4];
	   image_angle   = value[| 5];
	   image_blend   = value[| 6];
	   image_alpha   = value[| 7];
	   depth         = value[| 8];
	   bind_xoffset  = value[| 9];
	   bind_yoffset  = value[| 10];
	   have_texture  = value[| 12];
	   have_polygon  = value[| 13];
	   joint         = value[| 14];
	   joint_target  = value[| 15];
	   joint_parent  = value[| 16];
	   //light_intensity = value[| 17];
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
	   path_image = value[| 54];
	   fill_image = value[| 55];
    if (map[? "variables"] !=undefined)
	   {
	    variables = dks_array_create_from_list(map[? "variables"]);
	   }
	   if (map[? "particles"] !=undefined)
	   {
	    dk_part =  dks_array_create_from_list(map[? "particles"]);
	   }
	   if (is_spine)
	   {
	    skeleton_animation_set(value[| 27]);
	    skeleton_animation_set_frame(0,value[| 31]);
    }
	   else
	   {
	    image_index = value[| 31];
	   }
	   image_speed = value[| 32];
    if (have_polygon)
	   {
	    if(instance_exists(obj_node))
	    {
	     dks_vertex_nodes_destroy();
	    } 
	    dks_matrix_update();
	    poly_list = dks_list_create_from_map(map[?  "poly_list"]);
	    bezier_n1 = dks_array_create_from_list(map[?  "bezier1"]);
	    bezier_n2 = dks_array_create_from_list(map[?  "bezier2"]);
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
	    if ds_exists(phyprops, ds_type_list)
	    {
	     ds_list_destroy(phyprops);
	    }
	    phyprops = dks_list_create_from_map(map[?  "phyprops"]);
	    if (joint)
	    {
	     if ds_exists(joint_list, ds_type_list)
	     {
	      ds_list_destroy(joint_list);
	     }
	     if ds_exists(joint_offset, ds_type_list)
	     {
	      ds_list_destroy(joint_offset);
	     }
	     joint_list = dks_list_create_from_map(map[? "joint_list"]);
	     joint_offset = dks_list_create_from_map(map[? "joint_offset"]);
	    }
	   }
    
    if (have_tween) ///Tweens
	   {
	    var t_list = map[? "tween"];
	    var ss = ds_list_size(t_list);
	    var pp;
	    var agi;
	    for (var j =0; j<ss; j+=9)
	    {
	     pp = t_list[| j];
	     tween[@ pp] = TweenCreate(id, asset_get_index(t_list[| j+1]),t_list[| j+2], t_list[| j+3], t_list[| j+4], t_list[| j+5], t_list[| j+6], t_list[| j+7], t_list[| j+8]);
	    }
	   }
    
	   if(parent)
	   {
	    dks_child_transform();
    }
   }///////
	  break;
	  case 1 :
	  map[? "type"] = 2;
	  if(obj_deco_creator.target = value[| 52])
	  {
	   obj_deco_creator.target = noone;
	   obj_draw_near.near = noone;
	  }
	  instance_destroy(value[| 52]);
	  break;
	  case 2:
	  var inst = instance_create_depth(value[| 0],value[| 1],value[| 8], obj_deco);
	  with(inst)
	  {
	   //////////////////////////////
	   //current_tab   = value[| 11];
	   sprite_index = asset_get_index(value[| 2]);
	   image_speed =0;
	   image_index =0;
	   image_xscale  = value[| 3];
	   image_yscale  = value[| 4];
	   image_angle   = value[| 5];
	   image_blend   = value[| 6];
	   image_alpha   = value[| 7];
	   //depth         = value[| 8];
	   bind_xoffset  = value[| 9];
	   bind_yoffset  = value[| 10];
	   have_texture  = value[| 12];
	   have_polygon  = value[| 13];
	   joint         = value[| 14];
	   joint_target  = value[| 15];
	   joint_parent  = value[| 16];
	   //light_intensity = value[| 17];
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
	   parent = value[| 53];
	   path_image = value[| 54];
	   fill_image = value[| 55];
	   if (map[? "variables"] !=undefined)
	   {
	    variables = dks_array_create_from_list(map[? "variables"]);
	   }
	   if (map[? "particles"] !=undefined)
	   {
	    dk_part =  dks_array_create_from_list(map[? "particles"]);
	   }
	   if (is_spine)
	   {
	    skeleton_animation_set(value[| 27]);
	    skeleton_animation_set_frame(0,value[| 31]);
    }
	   else
	   {
	    image_index = value[| 31];
	   }
	   image_speed = value[| 32];
	   if (have_polygon)
	   {
	    dks_matrix_update();
	    poly_list = dks_list_create_from_map(map[?  "poly_list"]);
	    bezier_n1 = dks_array_create_from_list(map[?  "bezier1"]);
	    bezier_n2 = dks_array_create_from_list(map[?  "bezier2"]);
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
     phyprops = dks_list_create_from_map(map[?  "phyprops"]);
	    if (joint)
	    {
	     joint_list = dks_list_create_from_map(map[? "joint_list"]);
	     joint_offset = dks_list_create_from_map(map[? "joint_offset"]);
	    }
	   }
    
    if (have_tween) ///Tweens
	   {
     var t_list = map[? "tween"];
	    var ss = ds_list_size(t_list);
	    var pp;
	    var agi;
	    for (var j =0; j<ss; j+=9)
	    {
	     pp = t_list[| j];
	     tween[ pp] = TweenCreate(id, asset_get_index(t_list[| j+1]),t_list[| j+2], t_list[| j+3], t_list[| j+4], t_list[| j+5], t_list[| j+6], t_list[| j+7], t_list[| j+8]);
	    }
	   }
	    
	   if(parent)
	   {
	    child = dks_array_create_from_list(map[? "child"]);
	    var s = array_length(child);
	    parent = false;
	    for(var i =0; i<s; i++)
	    {
	     if instance_exists(child[i])
	     {
	      child[i].bind_target = id;
	      parent = true;
	     }
	    }
	   }
   }
   for(var i =0; i<total_undo; i++)
	  { 
	   if (i != step)
	   {
	    var m = argument0[? i];
	    var v = m[? "value"];
	    if(v[| 52] = value[|52])
	    {
	     v[| 52] = inst.id;
	    }
	   }
	  }
	  value[| 52] = inst.id;
	  map[? "type"] = 1;
	  break;
	 }
 }
	else
	{
	 dks_message("Undo data finished!");
	}
}