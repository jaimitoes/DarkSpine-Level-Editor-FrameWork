/// Update user event, this event can be used like a create end event and/or a custom step event like this case...
//... a light can be updated calling this event.
// If a buffer exists
if(buffer_light != -1)
{
  //Delete the old buffer
  vertex_delete_buffer(buffer_light);
  vertex_format_delete(format_light);
  buffer_light = -1;
}
//If this deco light contains vertex data...
if(have_polygon)
{
 // Vertex lights can be customized activating the custom variables from the editor
 if is_array(variables)
 {
  // Get the variables data from the editor
  dks_array_update(val,variables);
  // Set from the "val" array our custom variables
  vx = real(val[0]);
  vy = real(val[1]);
  blend1 = real(val[2]);
  blend2 = real(val[3]);
  /////////////////////////////////////////////////
  //Creating the buffer light based on the polygon/vertex data
  if(poly_closed)
  {
   var l = ds_list_create();
   ds_list_copy(l,poly_list);
   dks_vertex_scale_simple(l,0,0,0,vx, vy, 1);
   vertex_format_begin();
   vertex_format_add_position_3d();
   vertex_format_add_texcoord();
   vertex_format_add_colour();
   format_light = vertex_format_end();
   buffer_light = vertex_create_buffer();
   vertex_begin(buffer_light, format_light);
   s = ds_list_size(l) div 2;
   var sx, sy;
   for(var i=0; i<s; i++)
   {
    sx = i*2;
    sy = i*2+1;
    scr_vertex_add_point(buffer_light, l[| sx], l[| sy], 0, 0,1,c_black, 0);
    scr_vertex_add_point(buffer_light, poly_list[| sx], poly_list[| sy], 0, 0,1,image_blend,image_alpha);
   }
   scr_vertex_add_point(buffer_light, l[| 0], l[| 1], 0, 0,1,c_black,0);
   scr_vertex_add_point(buffer_light, poly_list[| 0], poly_list[| 1], 0, 0,1,image_blend,image_alpha);
   vertex_end(buffer_light);
   vertex_freeze(buffer_light);
   ds_list_destroy(l);
  }
  else // Creating a Path light buffer
  {
   if(have_path_texture)
   {
	//Destroy any buffer related with path or edges from terrains
    vertex_delete_buffer(buffer_path);
    vertex_format_delete(format_path);
	// Creating the light path/
    dks_vertex_light_path(path_texture, path_image,image_blend,image_alpha,terrain_split, v_split, segment_split,corner_left,corner_right);
   }
  }
 }
}


