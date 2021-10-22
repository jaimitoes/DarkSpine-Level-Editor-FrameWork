/// @description dks_vertex_path(texture,image_index,color,alpha,terrain texture split, v-split,segments mult,corner left, corner right);
/// @param texture
/// @param image_index
/// @param color
/// @param alpha
/// @param terrain texture split
/// @param  v-split
/// @param segments mult
/// @param corner left
/// @param  corner right
function dks_vertex_path(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8) 
{
	// Get the texture ID of the sprite assigned into the "path_texture" variable.
	//Local variable
	var sw = sprite_get_width(argument0),
	color = argument2,
	alpha = argument3,
	split = argument4,
	vsplit = argument5,
	width = ((sprite_get_height(argument0)/2)*vsplit)/2;
	p_texture = sprite_get_texture(argument0, argument1);
 #region CREATES THE VERTEX BUFFER AND THE TEMPORAL VARIABLES
	var uv_split = 1/split,
	uv_left= 0,
	uv_right=0,
	uv_up=0,
	uv_down=0.5*vsplit,
	last_dir =0,
	zd = 0,
	l_corner = argument7,
	r_corner = argument8,
	bezier = ds_list_create(),
	texture_split = sw/split;
	var segments,sx,sy,sx2,sy2,x1,y1,x2,y2,dist,dir,dir2,pp,bs,lx,ly,lx2,ly2,bz1,bz2,pl,bx1,by1,bx2,by2,
	px,py,px2,py2,px3,py3,xx1,yy1,xx2,yy2,xx3,yy3,xx4,yy4;

	vertex_format_begin();
	vertex_format_add_position_3d();
	vertex_format_add_texcoord();
	vertex_format_add_colour();

	format_path = vertex_format_end();
	buffer_path  = vertex_create_buffer();
	vertex_begin(buffer_path, format_path);
 
	bz1 = bezier_n1;
	bz2 = bezier_n2;
	pl = poly_list;

 if ds_exists(tri, ds_type_list)
	{
	 ds_list_destroy(tri);
	}

	if (!ds_exists(ed, ds_type_list))
	{
	 ed = ds_list_create();
 }
	else
	{
	 ds_list_clear(ed);
	}
	
	if (!ds_exists(poly_s, ds_type_list))
	{
	poly_s = ds_list_create()
	}
	else
	{
	 ds_list_clear(poly_s);
	}
 #endregion
	// Make a loop troughth every vector and set the curve and triangle data
	//Every 2 values are a point in our polygon list, so we divide by 2 this list
	var size = ds_list_size(pl) div 2;
	for (var i = 0; i <size-1; i++)
	{
	 sx = i*2;
	 sy = i*2+1;
	 sx2 = i*2+2;
	 sy2 = i*2+3;
 
	 x1 = round(pl[| sx]);
	 y1 = round(pl[| sy]);
	 x2 = round(pl[| sx2]);
	 y2 = round(pl[| sy2]);
  
	 bx1 = round(bz1[sx]);
	 by1 = round(bz1[sy]);
	 bx2 = round(bz2[sx2]);
	 by2 = round(bz2[sy2]);
	 dist = point_distance(x1,y1,x2,y2);
  
  #region COMPUTING THE CUBIC BEZIER CURVE
	 if ((bx1 != x1) || (by1 !=y1) || (bx2 !=x2) || (by2 !=y2)) 
	 {
	  segments = ceil(dist/texture_split)*argument6;
	  if (segments<3) 
	  {
	   segments = 3;
	  }
	 }
	 else
	 {
	  segments = 3;
	 }
   
	 pp[0][0] = x1;
	 pp[0][1] = y1;
	 /////////////////////////////Tensor nodes  
	 pp[1][0] = bx1;
	 pp[1][1] = by1;
  
	 pp[2][0] = bx2;
	 pp[2][1] = by2;
	 ////////////////////////////  
	 pp[3][0] = x2;
	 pp[3][1] = y2;
	 ComputeBezier(bezier,pp,segments);
	 pp =0;
  #endregion
  #region CHECK IF THE PATH CONTAINS AN ADITIONAL SIDE TEXTURE AT THE BEGGINING
	 if (i =0) and (l_corner > 0)
	 {
	  uv_up=0.5;
	  uv_down=1;
	  uv_left = uv_split*l_corner;
	  uv_right = uv_left+ uv_split;
	  uv_up = 0.5;
	  uv_down = 1;
	  x1 = bezier[| 0];
	  y1 = bezier[| 1]; 
	  x2 = bezier[| 2];
	  y2 = bezier[| 3];
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

	  scr_vertex_add_point(buffer_path,px, py,zd,uv_left,uv_down-0.25,color,alpha);
	  scr_vertex_add_point(buffer_path,xx3,yy3,zd,uv_right,uv_up,color,alpha);
	  scr_vertex_add_point(buffer_path,xx1,yy1,zd,uv_left,uv_up,color,alpha);
 
	  scr_vertex_add_point(buffer_path,px2, py2,zd,uv_right,uv_down-0.25,color,alpha);
	  scr_vertex_add_point(buffer_path,xx3,yy3,zd,uv_right,uv_up,color,alpha);
	  scr_vertex_add_point(buffer_path,px, py,zd,uv_left,uv_down-0.25,color,alpha);
 
	  scr_vertex_add_point(buffer_path,xx2,yy2,zd,uv_left,uv_down,color,alpha);
	  scr_vertex_add_point(buffer_path,px2, py2,zd,uv_right,uv_down-0.25,color,alpha);
	  scr_vertex_add_point(buffer_path,px, py,zd,uv_left,uv_down-0.25,color,alpha);
 
	  scr_vertex_add_point(buffer_path,xx4,yy4,zd,uv_right,uv_down,color,alpha);
	  scr_vertex_add_point(buffer_path,px2, py2,zd,uv_right,uv_down-0.25,color,alpha);
	  scr_vertex_add_point(buffer_path,xx2,yy2,zd,uv_left,uv_down,color,alpha);
 
	  ds_list_add(ed,px,py,xx3,yy3,xx1,yy1,px2,py2,xx3,yy3,px,py);
	  ds_list_add(ed,xx2,yy2,px2,py2,px,py,xx4,yy4,px2,py2,xx2,yy2);
	  ds_list_add(poly_s,px,py,px2,py2);
	  uv_up = 0;
	  uv_down = 0.5*vsplit;
	  uv_right =0;
	  uv_left =0;
	 } 
  #endregion 
  #region TRIANGULATING AND ADDING THE VERTEX DATA
	  bs = ds_list_size(bezier) div 2;
	  //fin = bs-1;
	  for( var j =0; j<bs-1; j++)
	  {
	   px  = bezier[| j*2];
	   py  = bezier[| j*2+1];
	   px2 = bezier[| j*2+2];
	   py2 = bezier[| j*2+3];
	   ds_list_add(poly_s,px,py,px2,py2);
	   dir = point_direction(px, py, px2, py2);
	   dist = point_distance(px,py,px2,py2);
	   if(j = bs-2)
	   {
	    px3 = x2;
	    py3 = y2;
	    dir2 = dir;
	    uv_right +=dist/sw;
	    uv_right = scr_round_up_to_nearest(uv_right,uv_split/argument6);
	   }
	   else
	   {
	   px3 = bezier[| j*2+4];
	   py3 = bezier[| j*2+5];
	   dir2 = point_direction(px2,py2,px3,py3);
	   uv_right +=dist/sw;
	   }
  
	   if(j =0) and (i!=0)
	   {
	    dir = last_dir;
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
   
	   scr_vertex_add_point(buffer_path,px, py,zd,uv_left,uv_down-uvs,color,alpha);
	   scr_vertex_add_point(buffer_path,xx3,yy3,zd,uv_right,uv_up,color,alpha);
	   scr_vertex_add_point(buffer_path,xx1,yy1,zd,uv_left,uv_up,color,alpha);
	  
	   scr_vertex_add_point(buffer_path,px2, py2,zd,uv_right,uv_down-uvs,color,alpha);
	   scr_vertex_add_point(buffer_path,xx3,yy3,zd,uv_right,uv_up,color,alpha);
	   scr_vertex_add_point(buffer_path,px, py,zd,uv_left,uv_down-uvs,color,alpha);
	  
	   scr_vertex_add_point(buffer_path,xx2,yy2,zd,uv_left,uv_down,color,alpha);
	   scr_vertex_add_point(buffer_path,px2, py2,zd,uv_right,uv_down-uvs,color,alpha);
	   scr_vertex_add_point(buffer_path,px, py,zd,uv_left,uv_down-uvs,color,alpha);
	  
	   scr_vertex_add_point(buffer_path,xx4,yy4,zd,uv_right,uv_down,color,alpha);
	   scr_vertex_add_point(buffer_path,px2, py2,zd,uv_right,uv_down-uvs,color,alpha);
	   scr_vertex_add_point(buffer_path,xx2,yy2,zd,uv_left,uv_down,color,alpha);
	  
	   ds_list_add(ed,px,py,xx3,yy3,xx1,yy1,px2,py2,xx3,yy3,px,py);
	   ds_list_add(ed,xx2,yy2,px2,py2,px,py,xx4,yy4,px2,py2,xx2,yy2);
	   uv_left = uv_right;
	   last_dir = dir2;
	  }
  #endregion 
	 ds_list_clear(bezier);
	}    
 #region CHECK IF THE PATH CONTAINS AN ADITIONAL SIDE TEXTURE AT THE END
	if(r_corner >0)
	{
	 uv_left = uv_split*r_corner;
	 uv_right = uv_left + uv_split;
	 uv_up = 0.5;
	 uv_down = 1;
	 size = ds_list_size(poly_s);
	 x1 = poly_s[| size-4];
	 y1 = poly_s[| size-3];
	 x2 = poly_s[| size-2];
	 y2 = poly_s[| size-1];
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
 
	 scr_vertex_add_point(buffer_path,px, py,zd,uv_left,uv_down-0.25,color,alpha);
	 scr_vertex_add_point(buffer_path,xx3,yy3,zd,uv_right,uv_up,color,alpha);
	 scr_vertex_add_point(buffer_path,xx1,yy1,zd,uv_left,uv_up,color,alpha);
 
	 scr_vertex_add_point(buffer_path,px2, py2,zd,uv_right,uv_down-0.25,color,alpha);
	 scr_vertex_add_point(buffer_path,xx3,yy3,zd,uv_right,uv_up,color,alpha);
	 scr_vertex_add_point(buffer_path,px, py,zd,uv_left,uv_down-0.25,color,alpha);
 
	 scr_vertex_add_point(buffer_path,xx2,yy2,zd,uv_left,uv_down,color,alpha);
	 scr_vertex_add_point(buffer_path,px2, py2,zd,uv_right,uv_down-0.25,color,alpha);
	 scr_vertex_add_point(buffer_path,px, py,zd,uv_left,uv_down-0.25,color,alpha);
 
	 scr_vertex_add_point(buffer_path,xx4,yy4,zd,uv_right,uv_down,color,alpha);
	 scr_vertex_add_point(buffer_path,px2, py2,zd,uv_right,uv_down-0.25,color,alpha);
	 scr_vertex_add_point(buffer_path,xx2,yy2,zd,uv_left,uv_down,color,alpha);
 
	 ds_list_add(ed,px,py,xx3,yy3,xx1,yy1,px2,py2,xx3,yy3,px,py);
	 ds_list_add(ed,xx2,yy2,px2,py2,px,py,xx4,yy4,px2,py2,xx2,yy2);
	 ds_list_add(poly_s,px,py,px2,py2);
	} 
 #endregion
	ds_list_destroy(bezier);
	vertex_end(buffer_path);
	vertex_freeze(buffer_path);
}