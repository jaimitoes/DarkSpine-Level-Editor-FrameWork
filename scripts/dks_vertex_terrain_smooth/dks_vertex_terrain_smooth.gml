/// @description dks_vertex_terrain_smooth(sprite_index,image_index,color,alpha,terrain texture split,segments mult);
/// @param sprite_index
/// @param image_index
/// @param color
/// @param alpha
/// @param terrain texture split
/// @param segments mult
function dks_vertex_terrain_smooth(argument0, argument1, argument2, argument3, argument4, argument5) 
{
 var sw = sprite_get_width(argument0),
 split = argument4,
 color = argument2,
 alpha = argument3,
 width = sprite_get_height(argument0)/8;
 // Get the texture ID of the sprite assigned into the "path_texture" variable.
 //Local variable
 p_texture = sprite_get_texture(argument0, argument1);
 #region CREATES THE VERTEX BUFFER AND THE TEMPORAL VARIABLES
 var uv_split = 1/split,
 last_dir= noone,
 last_px =0,
 last_py =0,
 uv_left= 0,
 uv_right=0,
 uv_up=0,
 uv_down=0,
 zd = 0,
 // Set the uv according to the texture patterns to bet the correct triangle images
 // Multiples of 0.125 is seted as default and calculates automatically the correct sequence...
 //...is dependent of the variables uv_split, texture_split and segment split
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
 // Create a temporary list to store the bezier curve between 2 points
 bezier = ds_list_create(),
 // Set the size in pixels for each horizontal blocks
 texture_split = sw/split,
 // Set the half width of a block
 corner_split = texture_split*0.5; 
 // Creates a set of temporary variables to do some maths...
 var segments,sx,sy,sx2,sy2,x1,y1,x2,y2,dist,dir,dir2,pp,p1,p2,p3,p4,bs,val,fin,ps1,ps2,lx,ly,pl,bx1,by1,bx2,by2,sm,
 px,py,px2,py2,px3,py3,xx1,yy1,xx2,yy2,xx3,yy3,xx4,yy4,cxx1,cyy1,cxx2,cyy2,cxx3,cyy3,cxx4,cyy4,clx,cly;
 // Creates a Path/Edges vertex buffer
 vertex_format_begin();
 vertex_format_add_position_3d();
 vertex_format_add_texcoord();
 vertex_format_add_colour();
 format_path = vertex_format_end();
 buffer_path  = vertex_create_buffer();
 vertex_begin(buffer_path, format_path);
 // Set a 2D temporary array to manage the corners texture ids on a vertex terrain.
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
 // Get the id of the first cubic bezier list of points
 bz1 = bezier_n1;
 // Get the id of the second cubic bezier list of points
 bz2 = bezier_n2;
 // Get the id of the regular polygon list
 pl = poly_list;
 // The "ed" list store all points of all triangles generated using cubic bezier calculations.
 if (!ds_exists(ed, ds_type_list))
 {
  // Creating a list that stores all the triangles data around the edges of our terrains
  ed = ds_list_create();
 }
 else
 {
  // Clear any previous list stored in this variable	
  ds_list_clear(ed);
 }
 // Creating or clearing a smooth polygon list that stores the final form of our shape whithing the generated bezier curve on the active smooth nodes
 if (!ds_exists(poly_s, ds_type_list))
 {
  // Creating the smooth polygon list	
  poly_s = ds_list_create()
 }
 else
 {
  // Clearing the smooth polygon list	
  ds_list_clear(poly_s);
 }
 // Create a variable to store the previous up UV value to use as a terrain orientation check
 var uv_prev_up =noone;
 // Create a variable to store the previous up UV value to use as a terrain orientation check
 var uv_prev_down = noone;
 #endregion
 // Make a loop troughth every vector and set the curve and triangle data
 //Every 2 values are a point in our polygon list, so we divide by 2 this list
 var size = ds_list_size(pl) div 2;
 for (var i = 0; i <size; i++)
 {
  // Get the first point ID of the folowing vector
  sx = i*2;
  sy = i*2+1;
  // If the followed point are the last point in the list...
  if (i = size-1)
  {
   // Get the id of the first point of the polygon list	 
   sx2 = 0;
   sy2 = 1;
  }
  else
  {
   // Get the id of the next point of the polygon list	 
   sx2 = i*2+2;
   sy2 = i*2+3;
  }
  // Set the coordinates values of the 2 current points using its IDs.
  x1 = pl[| sx];
  y1 = pl[| sy];
  x2 = pl[| sx2];
  y2 = pl[| sy2];
  // Get the direction in degrees from the first point to the next one.
  dir = point_direction(x1,y1,x2,y2);
  // Set the distance value from the first point and the half size of a Uv block relative to the direction from both vectors...
  lx = lengthdir_x(corner_split,dir);
  ly = lengthdir_y(corner_split,dir);
  // Setting up the Up and bottom vector to setup the uv textures on the generated triangles
  p1 = x1 + lx;
  p2 = y1 + ly;
  p3 = x2 - lx;
  p4 = y2 - ly;
  // Getting the first point of the followed bezier vector point
  bx1 = bz1[sx];
  by1 = bz1[sy];
  // Getting the second point of the followed bezier vector point
  bx2 = bz2[sx2];
  by2 = bz2[sy2];
  // Get the distance from the up and bottom vector
  dist = point_distance(p1,p2,p3,p4);
  #region COMPUTING THE BEZIER CURVE
  // If the bezier nodes coordinates aren´t equal to the polygon point coordinates...
  if ((bx1 != x1) || (by1 !=y1) || (bx2 !=x2) || (by2 !=y2)) 
  {
   sm = 1;
   // Calculate the segment multiplication to se into the cubic bezier formula
   segments = ceil(dist/texture_split)*argument5;
   // The minimum segments that must be to set is 2
   if(segments<2)
   {
	segments = 2;
   }
  }
  else
  {
   sm = 0;
   segments = 2;
  }
  
  pp[0][0] = p1; //The bezier range for the first point
  pp[0][1] = p2;
  /////////////////////////////  
  pp[1][0] = bx1;//Bezier controller, the first tensor node of the vector...
  pp[1][1] = by1;
  /////////////////////////////
  pp[2][0] = bx2;//Bezier controller, the seconde tensor node of the vector...
  pp[2][1] = by2;
  ///////////////////////////// 
  pp[3][0] = p3;// The bezier range for the second point
  pp[3][1] = p4;
  // Compute the cubic bezier for the current vector and tensor nodes
  // the bezier data is stored in the temporal list called "bezier", this temporal list is cleared
  // in every loop getting the bezier computation of the next vector.
  ComputeBezier(bezier,pp,segments);
  // Reset the data to compute the next vector
  pp = 0;
  // Set the UV relative to the orientation of our edges
  #endregion
  #region SETTING UP THE UV PATTERN
  if (dir >= 0) and (dir <=45)
  {
   // Set the UV up vector in the ground data	 
   uv_up = uv_ground_top;
   // Set the UV bottom vector in the ground data
   uv_down = uv_ground_bot;
  }
  else if (dir >= 45) and (dir<=90)
  {
   // Set the UV up vector in the second wall data	 	 
   uv_up = uv_wall2_top;
   // Set the UV bottom vector in the second wall data
   uv_down = uv_wall2_bot;
  }
  else if (dir >=90) and (dir<=135)
  {
   // Set the UV up vector in the second wall data	 
   uv_up = uv_wall2_top;
   // Set the UV bottom vector from the second wall bottom data
   uv_down = uv_wall2_bot;
  }
  else if (dir>=135) and (dir<=180)
  {
   // Set the UV up vector in the floor data	 
   uv_up = uv_floor_top;
   // Set the UV bottom vector in the floor data
   uv_down = uv_floor_bot;
  }  
  else if (dir>=180) and (dir<=225)
  {
   // Set the UV up vector in the floor data	 
   uv_up = uv_floor_top;
   // Set the UV bottom vector in the floor data
   uv_down = uv_floor_bot;
  }
  else if (dir>=225) and (dir<=270)
  {
   // Set the UV up vector in the wall data 
   uv_up = uv_wall1_top;
   // Set the UV bottom vector in the wall data 
   uv_down = uv_wall1_bot;
  }
  else if (dir>=270) and (dir<=315)
  {
   // Set the UV up vector in the wall data
   uv_up = uv_wall1_top;
   // Set the UV bottom vector in the wall data
   uv_down = uv_wall1_bot;
  }
  else if (dir>=315) and (dir<=360)
  {
   // Set the UV up vector in the ground data	 
   uv_up = uv_ground_top;
   // Set the UV bottom vector in the ground data
   uv_down = uv_ground_bot;
  }
  #endregion
  #region TRIANGULATING AND ADDING THE VERTEX DATA
  // Get the lenght of the bezier list and divide by 2 to represent every point in the formula
  bs = ds_list_size(bezier) div 2;
  // Set a variable that represents the last point
  fin = bs-1;
  //Loop thoughth the list tracing the bezier path
  for ( j =0; j<bs;j++)
  {
   #region ASSIGNING THE CURRENT POINT CALCULATIONS LOOPING THROUGH THE CUBIC BEZIER VERTICES LIST 
   //Switch this conditionals to know in what vector position we are and store the coordinates in the variables px,py,px2,py2 	 
   switch(j)
   {
	//The beggining of the cubic bezier curve////////////////////////////////////////////////
	case 0 :
	// Get the 2 first point vector	
	px  = bezier[| j*2];
	py  = bezier[| j*2+1];
	px2 = bezier[| j*2+2];
	py2 = bezier[| j*2+3];
	// Get the direction from left to right 
	dir = point_direction(px,py,px2,py2);
	// If our vector has less than 3 segments
	if (segments<3) 
	{
     //If the vector has less than 3 segments, as the third reference point we will store the coordinates...
	 //...of the second one again.
	 px3 = px2;
	 py3 = py2;
	 //Since we cannot obtain the reference of the address between the second point and...
	 //...the third, we assign the same value to the first address obtained.
	 dir2 = dir;
	 }
	 else
	 {
	  // Get the third reference point in the vector	
	  px3 = bezier[| j*2+4];
	  py3 = bezier[| j*2+5];
	  // Get the direction from the second and third point
	  dir2 = point_direction(px2,py2,px3,py3);
	 }
     break;
	 ///////////////////////////////////////////////////////////////////////////////////////////
	 // The end of the cubic bezier curve///////////////////////////////////////////////////// 
	 case fin :
	 // If we are not at the last point of our polygon
	 if (i != size-1)
	 {
	  // Get the last referenced point of the bezier curve	
	  px  = last_px;
	  py  = last_py;
	  // Get the last bezier point of the "bezier" curve
	  px2 = bezier[| j*2];
	  py2 = bezier[| j*2+1];
	  // Set into the third referenced point the same values as the last bezier point.
	  px3 = px2;
	  py3 = px2;
	  // Set the last referenced direction for both variables
	  dir =last_dir;
	  dir2 = dir;
	 }
	 else //If we are at the last point of our polygon
	 {
	  // Get the last referenced point
	  px  = last_px;
	  py  = last_py;
      // Get the first point of our smooth polygon list
	  px2 = poly_s[| 0];
	  py2 = poly_s[| 1];
      // Get the last referenced direction
	  dir = last_dir;
	  // If our vector has less than 3 segments
	  if (segments<3) 
	  {
	   // Set into the third referenced point the same data as the second one. 	 
	   px3 = px2;
	   py3 = py2;
	   // Set into the the second direction reference the same data as the second one.
	   dir2 = last_dir;
	  }
	  else // If our vector has 3 segments or more segments
	  {
		// Get the next point of our smooth polygon list
	   px3 = poly_s[| 2];
	   py3 = poly_s[| 3];
		// Get the direction from the second to the third vector point
	   dir2 = point_direction(px2,py2,px3,py3);
	   }
	  }
	  break;
	  /////////////////////////////////////////////////////////////////////////////////////////
	  // When we are not referencing the first or last point of the curve.
	  default :
	  // Get the last referenced point of the cubic curve
	  px  = last_px;
	  py  = last_py;
	  // Get the last referenced direction of the cubic bezier curve
	  dir = last_dir;
	  // Get the next point from the bezier list
	  px2 = bezier[| j*2];
	  py2 = bezier[| j*2+1];
	  // If our vector has less than 3 segments
	  if (segments<3) 
	  {
	    // Set into the third referenced point the same data as the second one. 
	   px3 = px2;
	   py3 = py2;
	    // Set into the the second direction reference the same data as the second one.
	   dir2 = dir;
	  }
	  else // If our vector has 3 segments or more segments
	  {
		// Get the next point of our smooth polygon list	 
	   px3 = bezier[| j*2+2];
	   py3 = bezier[| j*2+3];
		// Get the direction from the second to the third vector point
	   dir2 = point_direction(px2,py2,px3,py3);
	  }
	 }
	 //If the up vector UV value are the same as the previous one and we are in the first point...
	 //...of the bezier curve and we are not referencing the first polygon point:
	 if (uv_prev_up = uv_up) and (j = 0) and (i !=0)
	 {
	  // Set into the second reference point the same as the first one.	  
	  px2 = px;
	  py2 = py;
	  // Set into the first reference the last point referenced in the previous loop
	  px = last_px;
	  py = last_py;
	  // Set in the second direction reference the same as the first one.
	  dir2 = dir;
	  // Set in the first direction reference the last direction referenced in the previous loop
	  dir = last_dir;
	 }
     #endregion
     #region BLOCK TEXTURE
	 ///////////////////////SETTING UP A TEXTURE BLOCK WITH 2 TRIANGLES///////////////////////////
	 // Set the half width of the current texture
	 var ww = width /2;
	 // Set the half texture distance in pixels from the bezier point based on the first direction. 
	 lx = lengthdir_x(ww, dir + 90);
	 ly = lengthdir_y(ww, dir + 90);
	 // Set the relative points from a bezier point to set up the vertices of our first triangle. 
	 xx1 = px + lx;
	 yy1 = py + ly;
	 xx2 = px - lx;
	 yy2 = py - ly;
	 // Set the half texture distance in pixels from the bezier point based on the second direction. 
	 lx = lengthdir_x(ww, dir2 + 90);
	 ly = lengthdir_y(ww, dir2 + 90);
	 // Set the relative points from a bezier point to set up the vertices of our second triangle. 
	 xx3 = px2 + lx ;
	 yy3 = py2 + ly ;
	 xx4 = px2 - lx ;
	 yy4 = py2 - ly ;
	 ///////////////////////////SETTING UP A CORNER INTO THE TERRAIN/////////////////////////////////////
	 // If we are on the first point of our bezier curve and we are not on the first point of our polygon point.
	 if (j = 0) and (i != 0)
	 {
	  // If the last texture UV value are not the same as the current one  
	  if ( uv_prev_up != uv_up)
	  {
	   //Set a default direction variable.   
	   var vdir = 0,
	   // Get the last referenced bezier point
	   cx = last_px,
	   cy = last_py,
		  // Creates and reference the second point calculating the width of the current block texture size.
	   cx2 = last_px + lengthdir_x(texture_split,last_dir),
	   cy2 = last_py + lengthdir_y(texture_split,last_dir);
	   clx = lengthdir_x(ww, last_dir + 90);
	   cly = lengthdir_y(ww, last_dir + 90);
	   cxx1 = cx + clx;
	   cyy1 = cy + cly;
    cxx2 = cx - clx;
	   cyy2 = cy - cly;
	   cxx3 = cx2 + clx;
	   cyy3 = cy2 + cly;
	   cxx4 = cx2 - clx;
	   cyy4 = cy2 - cly;
	   uv_left =0;
	   uv_right =0;
	   ps1 = last_px + lengthdir_x(texture_split*0.5,last_dir);
	   ps2 = last_py + lengthdir_y(texture_split*0.5,last_dir);
	   ds_list_add(poly_s,ps1,ps2);
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
	     var vdir = point_direction(cxx4,cyy4,cxx3,cyy3);
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
	     vdir = point_direction(cxx3,cyy3,cxx4,cyy4);
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
					 vdir = point_direction(cxx4,cyy4,cxx3,cyy3);
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
	      vdir = point_direction(cxx3,cyy3,cxx4,cyy4);
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
	      vdir = point_direction(cxx3,cyy3,cxx4,cyy4);
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
	      vdir = point_direction(cxx4,cyy4,cxx3,cyy3);
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
	      vdir = point_direction(cxx4,cyy4,cxx3,cyy3);
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
	      vdir = point_direction(cxx3,cyy3,cxx4,cyy4);
	     }
	    } 
	    p1 = ps1 + lengthdir_x(corner_split,vdir);
	    p2 = ps2 + lengthdir_y(corner_split,vdir);
	    ds_list_add(poly_s,p1,p2);
	   } 
	  }
	  else
	  {
	   ds_list_add(poly_s,bezier[| j*2],bezier[| j*2+1]);
	  }
  #endregion
  #region UV BLOCK COORDINATES SWITCHER
	  dist= point_distance(px,py,px2,py2);
	  if(sm)
	  { 
	   if(j = fin)
	   {
	    uv_right += dist/sw;
	    uv_right = scr_round_up_to_nearest(uv_right,uv_split);
	   }
	   else
	   {
	    uv_right += dist/sw;
	   }
	  }   
	  else
	  {
	   dist= point_distance(px,py,px2,py2);
	   var d = dist/sw;
	   while(d>uv_split)
	   {
	    uv_right += uv_split;
	    d-=uv_split;
	   }
   
	   if (d > uv_split*0.25)
	   {
	    uv_right += uv_split;
	   }
	  }
  #endregion   
  
	  scr_vertex_add_point(buffer_path,xx2,yy2,zd,uv_left,uv_down,color,alpha);
	  scr_vertex_add_point(buffer_path,xx3,yy3,zd,uv_right,uv_up,color,alpha);
	  scr_vertex_add_point(buffer_path,xx1,yy1,zd,uv_left,uv_up,color,alpha);
	  scr_vertex_add_point(buffer_path,xx2,yy2,zd,uv_left,uv_down,color,alpha);
	  scr_vertex_add_point(buffer_path,xx4,yy4,zd,uv_right,uv_down,color,alpha);
	  scr_vertex_add_point(buffer_path,xx3,yy3,zd,uv_right,uv_up,color,alpha);
  
	  ds_list_add(ed,xx2,yy2,xx3,yy3,xx1,yy1,xx2,yy2,xx4,yy4,xx3,yy3);
	  if ( uv_prev_up != uv_up) and (j =0) and (i != 0)
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
	  last_dir = dir2;
	  last_px = px2;
	  last_py = py2;
	  uv_prev_up = uv_up;
	  uv_prev_down = uv_down;
	 }
 #endregion
	 ds_list_clear(bezier);
	}
	val=0;
	ds_list_destroy(bezier);
	vertex_end(buffer_path);
	vertex_freeze(buffer_path);
}