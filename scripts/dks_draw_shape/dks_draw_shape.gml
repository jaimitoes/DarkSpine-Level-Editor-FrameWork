/// @description dks_draw_shape(objectobj, buffer)
/// @param objectobj
/// @param buffer
function dks_draw_shape(argument0, argument1, argument2) 
{
	with(argument0)
	{
  if (is_physics)
	 {
	  var vb = argument1;
	  var vf = argument2;
	  var i,
	  shape = phyprops[| physics.shape],
	  w = (sprite_get_width(sprite_index)*0.5)  *phyprops[| physics.radius],
	  h = (sprite_get_height(sprite_index)*0.5) *phyprops[| physics.radius],
	  x2 = w+col_xoff,
	  y2 = h+col_yoff;
   
			if(shape = "Circle")
	  {
				///linestrip
		  vertex_begin(vb,vf);
	   for(i = 0; i<8;i++)
	   {
	    scr_vertex_add_point_col(vb, lengthdir_x(x2,45*i),lengthdir_y(y2,45*i),depth-1,c_yellow,1);
	   }
	   scr_vertex_add_point_col(vb, lengthdir_x(x2,0),lengthdir_y(y2,0),depth-1,c_yellow,1);
	   vertex_end(vb);
	  }
	  else
	  {
	   var x1 = -w+col_xoff;
	   var y1 = -h+col_yoff;
	   vertex_begin(vb,vf);
	
	   scr_vertex_add_point_col(vb,x1,y1,depth-1,c_yellow,1);
	   scr_vertex_add_point_col(vb,x2,y1,depth-1,c_yellow,1);
	   scr_vertex_add_point_col(vb,x2,y2,depth-1,c_yellow,1);
	   scr_vertex_add_point_col(vb,x1,y2,depth-1,c_yellow,1);
	   scr_vertex_add_point_col(vb,x1,y1,depth-1,c_yellow,1);
	   vertex_end(vb);
   }
	  vertex_submit(vb,pr_linestrip,-1);
	 }
	}
}