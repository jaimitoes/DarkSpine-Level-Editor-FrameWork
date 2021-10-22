/// @description dks_draw_vertex_path(texture,color,alpha, poly list, terrain texture split, v-split,segments mult,corner left, corner right);
/// @param texture
/// @param color
/// @param alpha
/// @param  poly list
/// @param  terrain texture split
/// @param  v-split
/// @param segments mult
/// @param corner left
/// @param  corner right
function dks_draw_vertex_path(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8) 
{
	var sw = sprite_get_width(argument0),
	color = argument1,
	alpha = argument2,
	pl = argument3,
	split = argument4,
	vsplit = argument5,

	width = ((sprite_get_height(argument0)/2)*vsplit)/2,
	uv_split = 1/split,
	uv_left= 0,
	uv_right=0,
	uv_up=0,
	uv_down=0.5*vsplit,
	last_dir =0,
	l_corner = argument7,
	r_corner = argument8,
	zd = depth;
	texture_split = sw/split;
	var segments,sx,sy,sx2,sy2,x1,y1,x2,y2,dist,dir,dir2,lx,ly,lx2,ly2,pl,
	px,py,px2,py2,px3,py3,xx1,yy1,xx2,yy2,xx3,yy3,xx4,yy4;
	p_texture = sprite_get_texture(argument0, 0);//pr_trianglelist
	vertex_begin(buffpath,formpath);
	///////////////////////////////////////////////////////////////////////////////////////

	if (l_corner > 0)
	{
	x1 = pl[| 0];
	y1 = pl[| 1];
	x2 = pl[| 2];
	y2 = pl[| 3];
	uv_up=0.5;
	uv_down=1;
	uv_left = uv_split*l_corner;
	uv_right = uv_left+ uv_split;
	uv_up = 0.5;
	uv_down = 1;


	dir = point_direction(x1,y1,x2,y2);
	px = x1 - lengthdir_x(texture_split,dir);  
	py = y1 - lengthdir_y(texture_split,dir);
	px2 = x1;
	py2 = y1;
	lx = lengthdir_x(width, dir + 90);
	ly = lengthdir_y(width, dir + 90);


	xx1 = px + lx;
	yy1 = py + ly;
	xx2 = px - lx;
	yy2 = py - ly;
	xx3 = px2 + lx;
	yy3 = py2 + ly;
	xx4 = px2 - lx;
	yy4 = py2 - ly;


 
 
 
	 scr_vertex_add_point(buffpath,px, py,zd,uv_left,uv_down-0.25,color,alpha);
	 scr_vertex_add_point(buffpath,xx3,yy3,zd,uv_right,uv_up,color,alpha);
	 scr_vertex_add_point(buffpath, xx1,yy1,zd,uv_left,uv_up,color,alpha);
 

 
	 scr_vertex_add_point(buffpath,px2, py2,zd,uv_right,uv_down-0.25,color,alpha);
	 scr_vertex_add_point(buffpath,xx3,yy3,zd,uv_right,uv_up,color,alpha);
	  scr_vertex_add_point(buffpath,px, py,zd,uv_left,uv_down-0.25,color,alpha);
 
 
 
	 scr_vertex_add_point(buffpath,xx2,yy2,zd,uv_left,uv_down,color,alpha);
	 scr_vertex_add_point(buffpath,px2, py2,zd,uv_right,uv_down-0.25,color,alpha);
	 scr_vertex_add_point(buffpath,px, py,zd,uv_left,uv_down-0.25,color,alpha);
 
 
 
	 scr_vertex_add_point(buffpath,xx4,yy4,zd,uv_right,uv_down,color,alpha);
	 scr_vertex_add_point(buffpath,px2, py2,zd,uv_right,uv_down-0.25,color,alpha);
	 scr_vertex_add_point(buffpath,xx2,yy2,zd,uv_left,uv_down,color,alpha);
	 uv_up = 0;
	 uv_down = 0.5*vsplit;
	 uv_right =0;
	 uv_left =0;
	} 
	///////////////////////////////////////////////////////////////////////////////////////// 
 
	var size = ds_list_size(pl) div 2;
	for (var i = 0; i <size-1; i++)
	{
  
	  sx = i*2;
	  sy = i*2+1;
	  sx2 = i*2+2;
	  sy2 = i*2+3;
 
 
	  x1 = pl[| sx];
	  y1 = pl[| sy];
	  x2 = pl[| sx2];
	  y2 = pl[| sy2];
  
 
	  dist = point_distance(x1,y1,x2,y2);
  

  
	   segments = 3;
  
   
  
 

  
  
 
  
 

	   px  = x1;
	   py  = y1;
	   px2 = x2;
	   py2 = y2;
   
	   dir = point_direction(px, py, px2, py2);
	   dist = point_distance(px,py,px2,py2);
	   if(i = size-2)
	   {
	    px3 = x2;
	    py3 = y2;
	    dir2 = dir;
	    uv_right +=dist/sw;
	    uv_right = scr_round_up_to_nearest(uv_right,uv_split/argument6);
	   }
	   else
	   {
	   px3 = pl[| i*2+4];
	   py3 = pl[| i*2+5];
	   dir2 = point_direction(px2,py2,px3,py3);
	   uv_right +=dist/sw;
	   }
   
  
   
   
   
	   lx = lengthdir_x(width, dir + 90);
	   ly = lengthdir_y(width, dir + 90);
	   lx2 = lengthdir_x(width, dir2 + 90);
	   ly2 = lengthdir_y(width, dir2 + 90);
	    xx1 = px + lx;
	    yy1 = py + ly;
	    xx2 = px - lx;
	    yy2 = py - ly;
	    xx3 = px2 + lx2;
	    yy3 = py2 + ly2;
	    xx4 = px2 - lx2;
	    yy4 = py2 - ly2;
    
	      var uvs = 0.25 * vsplit;
      
      
      
	      scr_vertex_add_point(buffpath,px, py,zd,uv_left,uv_down-uvs,color,alpha);
		  scr_vertex_add_point(buffpath,xx3,yy3,zd,uv_right,uv_up,color,alpha);
		  scr_vertex_add_point(buffpath,xx1, yy1,zd, uv_left, uv_up,color,alpha);
	  
      
      
	      scr_vertex_add_point(buffpath,px2, py2,zd,uv_right,uv_down-uvs,color,alpha);
		  scr_vertex_add_point(buffpath,xx3,yy3,zd,uv_right,uv_up,color,alpha);
		  scr_vertex_add_point(buffpath,px, py,zd,uv_left,uv_down-uvs,color,alpha);
	  
      
      
	      scr_vertex_add_point(buffpath,xx2,yy2,zd,uv_left,uv_down,color,alpha);
		  scr_vertex_add_point(buffpath,px2, py2,zd,uv_right,uv_down-uvs,color,alpha);
		  scr_vertex_add_point(buffpath,px, py,zd,uv_left,uv_down-uvs,color,alpha);
	  
      
      
	      scr_vertex_add_point(buffpath,xx4,yy4,zd,uv_right,uv_down,color,alpha);
		  scr_vertex_add_point(buffpath,px2, py2,zd,uv_right,uv_down-uvs,color,alpha);
		  scr_vertex_add_point(buffpath,xx2,yy2,zd,uv_left,uv_down,color,alpha);
      
      
	      uv_left = uv_right;
	      last_dir = dir2;
      
	}      
 
  
   

	//////////////////////////////////////////////////////////////////////////////
	if(r_corner >0)
	{
	uv_left = uv_split*r_corner;
	uv_right = uv_left + uv_split;
	uv_up = 0.5;
	uv_down = 1;
	size = ds_list_size(pl);
	x1 = pl[| size-4];
	y1 = pl[| size-3];
	x2 = pl[| size-2];
	y2 = pl[| size-1];
	dir = point_direction(x1,y1,x2,y2);
	px = x2;  
	py = y2;
	px2 = x2 + lengthdir_x(texture_split,dir);
	py2 = y2 + lengthdir_y(texture_split,dir);
	lx = lengthdir_x(width, dir + 90);
	ly = lengthdir_y(width, dir + 90);
	xx1 = px + lx;
	yy1 = py + ly;
	xx2 = px - lx;
	yy2 = py - ly;
	xx3 = px2 + lx;
	yy3 = py2 + ly;
	xx4 = px2 - lx;
	yy4 = py2 - ly;


 
 
 
	 scr_vertex_add_point(buffpath,px, py,zd,uv_left,uv_down-0.25,color,alpha);
	 scr_vertex_add_point(buffpath,xx3,yy3,zd,uv_right,uv_up,color,alpha);
	 scr_vertex_add_point(buffpath,xx1,yy1,zd,uv_left,uv_up,color,alpha);
 
 
 
	 scr_vertex_add_point(buffpath,px2, py2,zd,uv_right,uv_down-0.25,color,alpha);
	 scr_vertex_add_point(buffpath,xx3,yy3,zd,uv_right,uv_up,color,alpha);
	 scr_vertex_add_point(buffpath,px, py,zd,uv_left,uv_down-0.25,color,alpha);
 
 
 
	 scr_vertex_add_point(buffpath,xx2,yy2,zd,uv_left,uv_down,color,alpha);
	 scr_vertex_add_point(buffpath,px2, py2,zd,uv_right,uv_down-0.25,color,alpha);
	 scr_vertex_add_point(buffpath,px, py,zd,uv_left,uv_down-0.25,color,alpha);
 
 
 
	 scr_vertex_add_point(buffpath,xx4,yy4,zd,uv_right,uv_down,color,alpha);
	 scr_vertex_add_point(buffpath,px2, py2,zd,uv_right,uv_down-0.25,color,alpha);
	 scr_vertex_add_point(buffpath,xx2,yy2,zd,uv_left,uv_down,color,alpha);
 
	} 
	//////////////////////////////////////////////////////////////////////////////////////// 
	vertex_end(buffpath);
	vertex_submit(buffpath, pr_trianglelist, p_texture);
}