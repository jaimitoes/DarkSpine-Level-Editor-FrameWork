/// @description dks_vertex_terrain(sprite_index,image_index,color,alpha,terrain texture split);
/// @param sprite_index
/// @param image_index
/// @param color
/// @param alpha
/// @param terrain texture split
function dks_vertex_terrain(argument0, argument1, argument2, argument3, argument4) 
{
	var sw = sprite_get_width(argument0),
	split = argument4,
	color = argument2,
	alpha = argument3,
	width = sprite_get_height(argument0)/8,
	uv_split = 1/split,
	last_dir= noone,
	last_px =0,
	last_py =0,
	uv_left= 0,
	uv_right=0,
	uv_up=0,
	uv_down=0,
	var uv_prev_up = 0,
	var uv_prev_down = 0,
	zd = 0,

	var uv_ground_top = 0,
	uv_ground_bot = 0.125,
	uv_wall1_top  = 0.125,
	uv_wall1_bot = 0.250,
	uv_wall2_top = 0.250,
	uv_wall2_bot = 0.375,
	uv_floor_top = 0.500,
	uv_floor_bot = 0.375,
	uv_corner_ground_top = 0.500,
	uv_corner_ground_bot = 0.625,
	uv_corner_ground2_top = 0.625,
	uv_corner_ground2_bot = 0.750,
	uv_corner_wall_top = 0.750,
	uv_corner_wall_bot = 0.875,
	uv_corner_wall2_top = 0.875,
	uv_corner_wall2_bot = 1,
	corner_0 = uv_split, 
	corner_1 = 0,

	texture_split = sw/split,
	corner_split = texture_split*0.5;

	var sx,sy,sx2,sy2,x1,y1,x2,y2,dist,dir,val,pl,first_dir,lx,ly,
	xx1,yy1,xx2,yy2,xx3,yy3,xx4,yy4,cxx1,cyy1,cxx2,cyy2,cxx3,cyy3,cxx4,cyy4,clx,cly;

	p_texture = sprite_get_texture(argument0, argument1);

	vertex_format_begin();
	vertex_format_add_position_3d();
	vertex_format_add_texcoord();
	vertex_format_add_colour();

	format_path = vertex_format_end();

	val[0][0] = 0;
	val[0][1] = 0;
	val[1][0] = 0;
	val[1][1] = 0;
	val[2][0] = 0;
	val[2][1] = 0;
	val[3][0] = 0;
	val[3][1] = 0;
	val[4][0] = 0;
	val[4][1] = 0;
	val[5][0] = 0;
	val[5][1] = 0;
	pl = poly_list;


	if (!ds_exists(ed, ds_type_list))
	{
	 ed = ds_list_create();
 
	}
	else
	{
	 ds_list_clear(ed);
	}

	buffer_path  = vertex_create_buffer();
	vertex_begin(buffer_path, format_path);
 
	var size = ds_list_size(pl) div 2;
	for (var i = 0; i <size; i++)
	{
  sx = i*2;
	 sy = i*2+1;
  
		if (i = size-1)
	 {
	  sx2 = 0;
	  sy2 = 1;
	 }
	 else
	 {
	  sx2 = i*2+2;
	  sy2 = i*2+3;
	 }
 
	 x1 = pl[| sx];
	 y1 = pl[| sy];
	 x2 = pl[| sx2];
	 y2 = pl[| sy2];

	 dir = point_direction(x1,y1,x2,y2);
	 if(i !=0)
	 {
	  p1 = x1 + lengthdir_x(corner_split,dir);
	  p2 = y1 + lengthdir_y(corner_split,dir);
	 }
	 else
	 {
	  p1 = x1;
	  p2 = y1;
	  first_dir = dir;
	 }
	 if (i != size-1)
	 {
	  p3 = x2 - lengthdir_x(corner_split,dir);
	  p4 = y2 - lengthdir_y(corner_split,dir);
  }
	 else
	 {
	  p3 = x2;
	  p4 = y2;
	  dir = first_dir;
	 }
  dist = point_distance(p1,p2,p3,p4);
  if (dir >= 0) and (dir <=45)
	 {
   uv_up = uv_ground_top;
	  uv_down = uv_ground_bot;
  }
	 else if (dir >= 45) and (dir<=90)
	 {
   uv_up = uv_wall2_top;
			uv_down = uv_wall2_bot;
  }
	 else if (dir >=90) and (dir<=135)
	 {
	  uv_up = uv_wall2_top;
	  uv_down = uv_wall2_bot;
  }
	 else if (dir>=135) and (dir<=180)
	 {
	  uv_up = uv_floor_top;
	  uv_down = uv_floor_bot;
  }  
	 else if (dir>=180) and (dir<=225)
	 {
	  uv_up = uv_floor_top;
	  uv_down = uv_floor_bot;
  }
	 else if (dir>=225) and (dir<=270)
	 {
	  uv_up = uv_wall1_top;
	  uv_down = uv_wall1_bot;
  }
	 else if (dir>=270) and (dir<=315)
	 {
	  uv_up = uv_wall1_top;
	  uv_down = uv_wall1_bot;
  }
	 else if (dir>=315) and (dir<=360)
	 {
	  uv_up = uv_ground_top;
	  uv_down = uv_ground_bot;
  }
  if (uv_prev_up = uv_up)
	 {
	  p1 = last_px;
	  p2 = last_py;
	  if(i != size-1)
	  {
	  dir = last_dir;
	  }
	 }
 
  lx = lengthdir_x(width / 2, dir + 90);
	 ly = lengthdir_y(width / 2, dir + 90);
	 xx1 = p1 + lx ;
	 yy1 = p2 + ly ;
	 xx2 = p1 - lx ;
	 yy2 = p2 - ly ;
	 xx3 = p3 + lx ;
	 yy3 = p4 + ly ;
	 xx4 = p3 - lx ;
	 yy4 = p4 - ly ;
 
  if ( uv_prev_up != uv_up) and (i!=0)
	 {
   var cx = last_px,
	  cy = last_py,
	  cx2 =last_px + lengthdir_x(texture_split,last_dir),
	  cy2 =last_py + lengthdir_y(texture_split,last_dir);
        
	  clx = lengthdir_x(width / 2, last_dir + 90);
	  cly = lengthdir_y(width / 2, last_dir + 90);
       
	  cxx1 = cx + clx ;
	  cyy1 = cy + cly ;
	  cxx2 = cx - clx ;
	  cyy2 = cy - cly ;
        
	  cxx3 = cx2 + clx ;
	  cyy3 = cy2 + cly ;
	  cxx4 = cx2 - clx ;
	  cyy4 = cy2 - cly ;
	  uv_left =0;
	  uv_right =0;
        
   switch(uv_up)
	  {
	   case uv_ground_top : 
	   if(uv_prev_up = uv_wall1_top)// corner_ground_down_left
	   {
     corner_1 += uv_split;
	    xx1 = cxx1;
	    yy1 = cyy1;
	    xx2 = cxx3;
	    yy2 = cyy3;
         
	    val[0][@0] = corner_1 + uv_split;
	    val[0][@1] = uv_corner_ground2_top;
	    val[1][@0] = corner_1 + uv_split;
	    val[1][@1] = uv_corner_ground2_bot;
	    val[2][@0] = corner_1;
	    val[2][@1] = uv_corner_ground2_top;
	    val[3][@0] = corner_1+uv_split;
	    val[3][@1] = uv_corner_ground2_bot;
	    val[4][@0] = corner_1;
	    val[4][@1] = uv_corner_ground2_bot;
	    val[5][@0] = corner_1;
	    val[5][@1] = uv_corner_ground2_top;
	    corner_1 = corner_1 + uv_split;
    }
	   else if (uv_prev_up = uv_wall2_top)//corner_ground_up_left
	   {
	    corner_0 += uv_split;
	    xx1 = cxx4;
	    yy1 = cyy4;
	    xx2 = cxx2;
	    yy2 = cyy2;
         
	    val[0][@0] = corner_0;
	    val[0][@1] = uv_corner_ground_bot;
	    val[1][@0] = corner_0;
	    val[1][@1] = uv_corner_ground_top;
	    val[2][@0] = corner_0 + uv_split;
	    val[2][@1] = uv_corner_ground_bot;
	    val[3][@0] = corner_0;
	    val[3][@1] = uv_corner_ground_top;
	    val[4][@0] = corner_0+uv_split;
	    val[4][@1] = uv_corner_ground_top;
	    val[5][@0] = corner_0+uv_split;
	    val[5][@1] = uv_corner_ground_bot;
	    corner_0 = corner_0 + uv_split; 
    }
	   break;
	   case uv_wall2_top:
	   if (uv_prev_up = uv_ground_top)//corner_ground_down_right
	   {
	    corner_0 += uv_split;
	    xx1 = cxx1;
	    yy1 = cyy1;
	    xx2 = cxx3;
	    yy2 = cyy3;
	     val[0][@0] = corner_0;
	     val[0][@1] = uv_corner_ground2_top;
	     val[1][@0] = corner_0 + uv_split;
	     val[1][@1] = uv_corner_ground2_top;
	     val[2][@0] = corner_0;
	     val[2][@1] = uv_corner_ground2_bot;
	     val[3][@0] = corner_0 + uv_split;
	     val[3][@1] = uv_corner_ground2_top;
	     val[4][@0] = corner_0 + uv_split;
	     val[4][@1] = uv_corner_ground2_bot;
	     val[5][@0] = corner_0;
	     val[5][@1] = uv_corner_ground2_bot;
	     corner_0 = corner_0 + uv_split; 
     }
	    else if (uv_prev_up = uv_floor_top)//corner_floor_down_left
	    {
	     corner_0 += uv_split;
	     xx1 = cxx4;
	     yy1 = cyy4;
	     xx2 = cxx2;
	     yy2 = cyy2;
	     val[0][@0] = corner_0 + uv_split;
	     val[0][@1] = uv_corner_wall2_bot;
	     val[1][@0] = corner_0;
	     val[1][@1] = uv_corner_wall2_bot;
	     val[2][@0] = corner_0 + uv_split;
	     val[2][@1] = uv_corner_wall2_top;
	     val[3][@0] = corner_0;
	     val[3][@1] = uv_corner_wall2_bot;
	     val[4][@0] = corner_0;
	     val[4][@1] = uv_corner_wall2_top;
	     val[5][@0] = corner_0 + uv_split;
	     val[5][@1] = uv_corner_wall2_top;
	     corner_0 = corner_0 + uv_split; 
     }
	    break;
	    case uv_wall1_top:
	    if (uv_prev_up = uv_ground_top)///corner_ground_up_right
	    {
	     corner_1 += uv_split;
	     xx1 = cxx4;
	     yy1 = cyy4;
	     xx2 = cxx2;
	     yy2 = cyy2;
	     val[0][@0] = corner_1;
	     val[0][@1] = uv_corner_ground_top;
	     val[1][@0] = corner_1 +uv_split;
	     val[1][@1] = uv_corner_ground_top;
	     val[2][@0] = corner_1;
	     val[2][@1] = uv_corner_ground_bot;
	     val[3][@0] = corner_1 + uv_split;
	     val[3][@1] = uv_corner_ground_top;
	     val[4][@0] = corner_1 + uv_split;
	     val[4][@1] = uv_corner_ground_bot;
	     val[5][@0] = corner_1;
	     val[5][@1] = uv_corner_ground_bot;
	     corner_1 = corner_1 + uv_split;
     }
	    else if (uv_prev_up = uv_floor_top)//corner_floor_up_left
	    {
	     corner_1 += uv_split;
	     xx1 = cxx1;
	     yy1 = cyy1;
	     xx2 = cxx3;
	     yy2 = cyy3;
	      val[0][@0] = corner_1+uv_split;
	      val[0][@1] = uv_corner_wall_bot;
	      val[1][@0] = corner_1;
	      val[1][@1] = uv_corner_wall_bot;
	      val[2][@0] = corner_1 + uv_split;
	      val[2][@1] = uv_corner_wall_top;
	      val[3][@0] = corner_1;
	      val[3][@1] = uv_corner_wall_bot;
	      val[4][@0] = corner_1;
	      val[4][@1] = uv_corner_wall_top;
	      val[5][@0] = corner_1 + uv_split;
	      val[5][@1] = uv_corner_wall_top;
	      corner_1 = corner_1 + uv_split; 
     }
	    break;
	    case uv_floor_top:
	    if (uv_prev_up = uv_wall2_top)///corner_floor_up_right
	    {
	     corner_0 += uv_split;
	     xx1 = cxx1;
	     yy1 = cyy1;
	     xx2 = cxx3;
	     yy2 = cyy3;
	     val[0][@0] = corner_0;
	     val[0][@1] = uv_corner_wall_bot;
	     val[1][@0] = corner_0;
	     val[1][@1] = uv_corner_wall_top;
	     val[2][@0] = corner_0+ uv_split;
	     val[2][@1] = uv_corner_wall_bot;
	     val[3][@0] = corner_0;
	     val[3][@1] = uv_corner_wall_top;
	     val[4][@0] = corner_0 + uv_split;
	     val[4][@1] = uv_corner_wall_top;
	     val[5][@0] = corner_0 + uv_split;
	     val[5][@1] = uv_corner_wall_bot;
	     corner_0 = corner_0 + uv_split; 
     }
	    else if (uv_prev_up = uv_wall1_top)//corner_floor_down_right
	    {
	     corner_1 += uv_split;
	     xx1 = cxx4;
	     yy1 = cyy4;
	     xx2 = cxx2;
	     yy2 = cyy2;
	     val[0][@0] = corner_1 + uv_split;
	     val[0][@1] = uv_corner_wall2_top;
	     val[1][@0] = corner_1 + uv_split;
	     val[1][@1] = uv_corner_wall2_bot;
	     val[2][@0] = corner_1;
	     val[2][@1] = uv_corner_wall2_top;
	     val[3][@0] = corner_1 + uv_split;
	     val[3][@1] = uv_corner_wall2_bot;
	     val[4][@0] = corner_1;
	     val[4][@1] = uv_corner_wall2_bot;
	     val[5][@0] = corner_1;
	     val[5][@1] = uv_corner_wall2_top;
	     corner_1 = corner_1 + uv_split; 
     }
	    break;
    } 
   }
   ////////////////////////////////////////////////////////////////////////////////////////////////
   var d = dist/sw;
	  while(d>uv_split)
	  {
	   uv_right += uv_split;
	   d-=uv_split;
	  }
	  if (d > uv_split*0.30)
	  {
	    uv_right += uv_split;
	  }
      
   scr_vertex_add_point(buffer_path,xx2,yy2,zd,uv_left,uv_down,color,alpha);
		 scr_vertex_add_point(buffer_path,xx3,yy3,zd,uv_right,uv_up,color,alpha);
		 scr_vertex_add_point(buffer_path,xx1,yy1,zd,uv_left,uv_up,color,alpha);
	  
   scr_vertex_add_point(buffer_path,xx2,yy2,zd,uv_left,uv_down,color,alpha);
		 scr_vertex_add_point(buffer_path,xx4,yy4,zd,uv_right,uv_down,color,alpha);
		 scr_vertex_add_point(buffer_path,xx3,yy3,zd,uv_right,uv_up,color,alpha);
	  
	  ds_list_add(ed,xx2,yy2,xx3,yy3,xx1,yy1,xx2,yy2,xx4,yy4,xx3,yy3);
      
   if ( uv_prev_up != uv_up)  and (i != 0)
	  {
    scr_vertex_add_point(buffer_path,cxx2,cyy2,zd,val[2][0],val[2][1],color,alpha);
		  scr_vertex_add_point(buffer_path,cxx3,cyy3,zd,val[1][0],val[1][1],color,alpha);
		  scr_vertex_add_point(buffer_path,cxx1,cyy1,zd,val[0][0],val[0][1],color,alpha);
	  
	   scr_vertex_add_point(buffer_path,cxx2,cyy2,zd,val[5][0],val[5][1],color,alpha);
		  scr_vertex_add_point(buffer_path,cxx4,cyy4,zd,val[4][0],val[4][1],color,alpha);
		  scr_vertex_add_point(buffer_path,cxx3,cyy3,zd,val[3][0],val[3][1],color,alpha);
	  
	   ds_list_add(ed,cxx2,cyy2,cxx3,cyy3,cxx1,cyy1,cxx2,cyy2,cxx4,cyy4,cxx3,cyy3);
	  }  
	 
	  uv_left = uv_right;
	  last_dir = dir;
	  last_px = p3;
	  last_py = p4;
	  uv_prev_up = uv_up;
	  uv_prev_down = uv_down;
  }
 val=0;
	vertex_end(buffer_path);
	vertex_freeze(buffer_path);
}