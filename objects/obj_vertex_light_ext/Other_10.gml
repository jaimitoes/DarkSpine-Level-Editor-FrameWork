///Custom vertex light extended user event

// Destroy any previous light buffer
if(buffer_light != -1)
{
  vertex_delete_buffer(buffer_light);
  vertex_format_delete(format_light);
  buffer_light = -1;
}
// Create the buffer light (See the "obj_vertex_light" object to look the documentation)
if(have_polygon)
{
 if is_array(variables)
 {
  dks_array_update(val,variables);
  var vx,vy;
  vx = real(val[0]);
  vy = real(val[1]);
  movex = real(val[2]);
  movey = real(val[3]);
  blend1 = real(val[4]);
  blend2 = real(val[5]);
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
  var s = ds_list_size(l) div 2;
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
}


