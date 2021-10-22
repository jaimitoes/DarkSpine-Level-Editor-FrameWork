/// @description dks_undo_write(undo_map,id source, UndoType [0 = update 1= destruction 2= creation]);
/// @param undo_map
/// @param id source
/// @param  UndoType [0 = update 1= destruction 2= creation]
///
function dks_undo_write(argument0, argument1, argument2)
{
	if(total_undo >=1000)
	{
	 ds_map_clear(argument0);
	 step_undo = 0;
	 total_undo = 0;
 }
 var map = ds_map_create();
	map[? "type"] = argument2;
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
	var inst= argument1;
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
	 value[| 51] = perform_event;
	 value[| 52] = id;
	 value[| 53] = parent;
	 value[| 54] = path_image;
	 value[| 55] = fill_image;
  
	 if is_array(variables)
	 {
	  var var_list = ds_list_create_from_array(variables);
	  ds_map_add_list(map,"variables",var_list);
	 }
  
	 if is_array(dk_part)
	 {
	  var part_list = ds_list_create_from_array(dk_part);
	  ds_map_add_list(map,"particles",part_list);
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
	  ds_map_add_list(map, "phyprops", proplist);
   if (joint)
	  {
	   var jl = ds_list_create();
	   ds_list_copy(jl,joint_list);
	   ds_map_add_list(map,"joint_list",jl);
    var jo = ds_list_create();
	   ds_list_copy(jo,joint_offset);
	   ds_map_add_list(map,"joint_offset",jo);
   }
  }
  
  if (have_polygon)
	 {
   var pl = ds_list_create();
	  ds_list_copy(pl,poly_list);
	  var bz1 = ds_list_create_from_array(bezier_n1);
	  var bz2 = ds_list_create_from_array(bezier_n2);
	  ds_map_add_list(map,"poly_list",pl);
	  ds_map_add_list(map,"bezier1",bz1);
	  ds_map_add_list(map,"bezier2",bz2);
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
	  ds_map_add_list(map,"tween",t_list);
	 }
	 if(parent)
	 {
	  var ch = ds_list_create_from_array(child);
	  ds_map_add_list(map,"child",ch);
	 }
	 ds_map_add_list(map, "value", value);     
	}
	ds_map_add_map(argument0,total_undo,map);
 total_undo += 1;
	step_undo = total_undo;
}