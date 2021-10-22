function dks_grid_check(argument0, argument1) 
{
	var i,j,x1,y1,x2,y2;
	var hw = argument0;
	var hh = argument1;
	var cx = camera_get_view_x(Cam);
	var cy = camera_get_view_y(Cam);
	var w = cx + camera_get_view_width(Cam);
	var h = cy + camera_get_view_height(Cam);
	for(var i = 0; i < room_width/grid_width;i++)
	{
	 x1 = grid_width*i;
	 x2 = grid_width+grid_width*i;
	 if (x1 < cx)
	 {
	  continue;
	 }
	 else if (x2 > w)
	 {
	  break;
	 }
	 
		for (var j = 0; j<room_height/grid_height; j++)
	 {
	  y1 = grid_height*j;
	  y2 = grid_height+grid_height*j;
	  if(y1 < cy)
	  {
	   continue;
	  }
	  else if (y2 > h)
	  {
	   break;
	  }
   if point_in_rectangle(Mxd, Myd,x1,y1,x2,y2)
	  {
	   mouse_grid_x = x1 +hw;
	   mouse_grid_y = y1 +hh;
    break;
	  }
	 }
	}
}