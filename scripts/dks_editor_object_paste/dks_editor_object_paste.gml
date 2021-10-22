/// @description dks_object_paste(x,y,object)
/// @param x
/// @param y
/// @param object
/// antes de la release hay que ordenar las variables segun si tiene polygonos ect y ahorrar en procesos...
function dks_editor_object_paste(argument0, argument1, argument2) 
{
	with instance_create_depth(argument0,argument1,depth,argument2)
	{
	 var creator = obj_editor_control;
		
	 if is_array(creator.save_variables)
	 {
	  variables = dks_array_copy(creator.save_variables);
	 }
 
	 if is_array(creator.save_dk_part)
	 {
	  dk_part = dks_array_copy(creator.save_dk_part);
	 } 
 
	 have_texture = creator.save_texture;
	 have_path_texture = creator.save_have_path_texture;
	 have_tween = creator.save_have_tween;
	 have_polygon = creator.save_polygon;
	 is_spine = creator.save_is_spine;
	 is_physics = creator.save_is_physics;
	 lay_depth = creator.save_layer_depth;
	 layer_offset = creator.save_layer_offset;
	 x_rotation = creator.save_x_rotation;
	 y_rotation = creator.save_y_rotation;
	 object_transform = creator.save_object_transform;
	 blend_mode = creator.save_blend_mode;
	 draw_method = creator.save_draw_method;
	 visible = creator.save_visible;
	 vertex_xscale = creator.save_vertex_xscale;
	 vertex_yscale = creator.save_vertex_yscale;
	 vertex_angle = creator.save_vertex_angle;
	 col_xoff = creator.save_col_xoff;
	 col_yoff = creator.save_col_yoff;
	 corner1_xoff= creator.save_corner1_xoff;
	 corner1_yoff= creator.save_corner1_yoff;
	 corner2_xoff= creator.save_corner2_xoff;
	 corner2_yoff= creator.save_corner2_yoff;
	 activated = creator.save_activated;
	 is_visible = creator.save_is_visible;
	 perform_event = creator.save_perform_event;
	 object_execute = creator.save_object_execute;
	 path_image = creator.save_path_image;
	 fill_image = creator.save_fill_image;
  sprite_index = creator.save_sprite;
	 depth = lay_depth + layer_offset;
	 image_blend = creator.save_blend;
	 image_angle = creator.save_angle;
	 image_xscale= creator.save_xscale;
	 image_yscale= creator.save_yscale;
	 image_alpha = creator.save_alpha;
	 bl_h = colour_get_hue(image_blend);
	 bl_s = colour_get_saturation(image_blend);
	 bl_v = colour_get_value(image_blend);
	 dks_set_offset(id, global.mouse_xd, global.mouse_yd);////inportante el orden todo
 
	 if (is_spine)
		{       
		 spine_animation = creator.save_spine_animation;
		 skeleton_animation_set(spine_animation);
		 image_index = creator.save_image_index; 
		 skeleton_animation_set_frame(0,creator.save_image_index);
		}
		else
		{
		 image_index = creator.save_image_index;
		}      
		image_speed =creator.save_image_speed;       
 
		if(have_polygon)
		{
		 dks_matrix_update();
		 poly_closed = creator.save_poly_closed;
		 path_texture = creator.save_path_texture;
		 poly_list = ds_list_create();
		 ds_list_copy(poly_list,creator.save_poly_list);
		 bezier_n1 = dks_array_copy(creator.save_bezier_n1);
		 bezier_n2 = dks_array_copy(creator.save_bezier_n2);
		 poly_off = dks_array_create_from_list(poly_list);
		 bz1_off = dks_array_copy(bezier_n1);
		 bz2_off = dks_array_copy(bezier_n2);
		 if (have_path_texture)
		 {
		  smooth_terrain = creator.save_smooth_terrain;
		  terrain_split = creator.save_terrain_split;
		  v_split = creator.save_v_split;
		  segment_split = creator.save_segment_split;
		  corner_left = creator.save_corner_left;
		  corner_right = creator.save_corner_right;
		  have_path_texture = false;
		  dks_vertex_terrain_create();
		 }
		 if(have_texture)
		 {
		  vertex_texture = creator.save_vertex_texture;
		  have_texture = false;
		  dks_vertex_shape_create();
		 }
		}
         
  if (have_tween)
	 {
	  if is_array(creator.save_tweenS)
	  {
	   tweenS = dks_array2d_copy(creator.save_tweenS);
	   tweenD = dks_array2d_copy(creator.save_tweenD);
	   if is_array(creator.save_tweenCst)
	   {
		   tweenCst = dks_array2d_copy(creator.save_tweenCst);   
	   }
	   if is_array(creator.save_tweenCed)
	   {
		   tweenCed = dks_array2d_copy(creator.save_tweenCed);   
	   }
	   if is_array(creator.save_tweenCstop)
	   {
		   tweenCstop = dks_array2d_copy(creator.save_tweenCstop);   
	   }
	   for (var j =0; j<10; j++)
	   {
	    if (creator.save_tween[j][0] != -1)
	    {
	     var ea = creator.save_tween[j][0];
	     var mo = creator.save_tween[j][1];
	     var de = creator.save_tween[j][2];
	     var del = creator.save_tween[j][3];
	     var du = creator.save_tween[j][4];
	     var prop = creator.save_tween[j][5];
	     var st = creator.save_tween[j][6];
	     var dt = creator.save_tween[j][7]; 
	     tween[j] = TweenCreate(id, ea, mo, de, del, du, prop, st, dt);
		    TweenAddCallback(tween[j],TWEEN_EV_FINISH,id, dks_sequence_set, j, prop); 	
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
	    if (creator.save_tween[j][0] != -1)
	    {
	     var ea = creator.save_tween[j][0];
	     var mo = creator.save_tween[j][1];
	     var de = creator.save_tween[j][2];
	     var del = creator.save_tween[j][3];
	     var du = creator.save_tween[j][4];
	     var prop = creator.save_tween[j][5];
	     var st = creator.save_tween[j][6];
	     var dt = creator.save_tween[j][7]; 
	     tween[j] = TweenCreate(id, ea, mo, de, del, du, prop, st, dt);
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
	  ds_list_copy(phyprops,creator.save_phyprops);
  }
  if(object_execute)
		{
		 if(perform_event>-1)
		 {
		  event_user(perform_event);
		 }
		}
	 return id;
 }    
}