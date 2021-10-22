/// @description dks_vertex_shape(sprite or -1, image_index);
/// @param sprite or -1
/// @param  image_index
function dks_vertex_shape(argument0, argument1) 
{
	//Create a shape from a triangulated polygon list
 t_size = ds_list_size(tri);
 var x1,y1,x2,y2,x3,y3;
	//While a texture ID is setted
	if (vertex_texture != -1)
	{
	 v_texture = sprite_get_texture(argument0,argument1);
	 var tw = sprite_get_width(argument0);
	 var th = sprite_get_height(argument0);
	 vertex_format_begin();
	 vertex_format_add_position_3d();
	 vertex_format_add_texcoord();
	 vertex_format_add_colour();
	 v_format = vertex_format_end();
	 v_buffer = vertex_create_buffer();
	 vertex_begin(v_buffer, v_format);
	 //Adding the triangle vertex points
	 for (var i=0; i<t_size; i+=6) 
	 {
	  x1 = tri[| i];
	  y1 = tri[| i+1];
	  x2 = tri[| i+2];
	  y2 = tri[| i+3];
	  x3 = tri[| i+4];
	  y3 = tri[| i+5];
	  scr_vertex_add_point(v_buffer,x3,y3,0,x3/tw,y3/th,image_blend, image_alpha);
	  scr_vertex_add_point(v_buffer,x2,y2,0,x2/tw,y2/th,image_blend, image_alpha);
	  scr_vertex_add_point(v_buffer,x1,y1,0,x1/tw,y1/th,image_blend, image_alpha);
	 }
	}
	else // While the buffer does not contains any texture
	{
	 vertex_format_begin();
	 vertex_format_add_position_3d();
	 vertex_format_add_colour();
	 v_format = vertex_format_end();
	 v_buffer = vertex_create_buffer();
	 vertex_begin(v_buffer, v_format);
	 //Adding the triangle vertex points
	 for (var i=0; i<t_size; i+=6) 
	 {
	  x1 = tri[| i];
	  y1 = tri[| i+1];
	  x2 = tri[| i+2];
	  y2 = tri[| i+3];
	  x3 = tri[| i+4];
	  y3 = tri[| i+5];
	  scr_vertex_add_point_col(v_buffer,x3,y3,0,image_blend, image_alpha);
	  scr_vertex_add_point_col(v_buffer,x2,y2,0,image_blend, image_alpha);
	  scr_vertex_add_point_col(v_buffer,x1,y1,0,image_blend, image_alpha);
	 }
	}
 vertex_end(v_buffer);
	vertex_freeze(v_buffer);
}