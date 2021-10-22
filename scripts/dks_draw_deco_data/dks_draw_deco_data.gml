/// @description dks_draw_deco_data(object)
/// @param object
function dks_draw_deco_data(argument0) 
{
	var xf = 32, 
	yf = 32, 
	creator = obj_deco_creator, 
	scale = icon_scale, 
	DW = Dw,
	DH = Dh,
	view = vcam,
	proj = pcam; 
	vertex_begin(buffer_col,format_col);
	with(argument0)
	{
	 if(lay_depth = creator.lay_depth)
	 {
	  var vec = dks_cord_vertex_to_screen(x,y,depth,view,proj,DW,DH);
	  if (vec[0] != -1)
	  {
	   //draw_text(vec[0],vec[1],object_get_name(object_index));
    if (bind_target !=noone) and instance_exists(bind_target)
    {
					draw_circle_colour(vec[0],vec[1],16, c_aqua, c_aqua,1);
					var vec2 = dks_cord_vertex_to_screen(bind_target.x,bind_target.y, bind_target.depth, view, proj, DW, DH);
				 if(vec2[0] !=-1)
				 {
			      //draw_line_colour(vec[0], vec[1], vec2[0],vec2[1], c_aqua, c_orange);
				  scr_vertex_add_point_col(other.buffer_col,vec[0],vec[1],depth,c_aqua,1);
				  scr_vertex_add_point_col(other.buffer_col,vec2[0],vec2[1],depth,c_orange,1);
				 } 
	   }
	   else
	   {
	    draw_circle_colour(vec[0],vec[1],16,c_lime,c_lime,1);
	   }
    
				if(parent)
	   {
	    draw_circle_colour(vec[0],vec[1],18,c_orange,c_orange,1);
	   }
   
    switch (creator.menu_setters)
	   {
	    case setter.closed:
	    if (parent)
	    {
	     draw_sprite_ext(spr_icon_chain,3, vec[0]-xf,vec[1], scale, scale,0,c_orange,1);
	    }
	
	    if (bind_target!=noone)
	    {
	     draw_sprite_ext(spr_icon_chain,8,vec[0]+xf,vec[1], scale, scale, 0, c_aqua, 1);
	    }
    
		   if is_array(tween)
	    {
	     draw_sprite_ext(spr_icon_anim,2,vec[0],vec[1]+yf, scale, scale,0,c_aqua,1);
	    }
	
	    if (have_polygon)
	    {
	     draw_sprite_ext(spr_icon_poly,0,vec[0],vec[1]-yf, scale, scale,0,c_orange,1);
	    }
       
	    if (is_physics)
	    {
	     draw_sprite_ext(spr_icon_physics,0,vec[0]+xf,vec[1]+yf, scale, scale,0,c_aqua,1);
	    }
    
		   if (is_spine)
	    {
	     draw_sprite_ext(spr_icon_skeleton,0,vec[0]-xf,vec[1]-yf, scale, scale,0,c_orange,1);
	    }
	
	    if(object_transform !=noone)
	    {
	     draw_sprite_ext(spr_icon_logic,0,vec[0]-xf,vec[1]+yf,scale,scale,0,c_aqua,1);
	    }
	    break;
	    case setter.layer:
	    var str = string(depth);
	    var sw = string_width(str);
	    var sh = string_height(str);
	    //draw_sprite_stretched(spr_icon_layer,0,xx,yy, st,r);
	    draw_set_halign(fa_left);
	    draw_set_valign(fa_top);
	    draw_rectangle(vec[0],vec[1],vec[0]+sw,vec[1]+sh,0)
	    draw_rectangle_colour(vec[0],vec[1],vec[0]+sw,vec[1]+sh,c_black,c_black,c_black,c_black,1)
	    /*
	    d3d_primitive_begin(pr_linestrip);
	    d3d_vertex(vec[0],vec[1],depth);
	    d3d_vertex(vec[0],vec[1]+sh,depth);
	    d3d_vertex(vec[0]+sw,vec[1],depth);
	    d3d_vertex(vec[0]+sw,vec[1]+sh,depth);
	    d3d_primitive_end();*/
	    draw_text_colour(vec[0],vec[1],depth,c_black,c_black,c_black,c_black,1);
	
	    break;
	    case setter.bind:
	    if (parent)
	    {
	     draw_sprite_ext(spr_icon_chain,3,vec[0],vec[1],1,1,0,c_orange,1);
	    }
	
	    if (bind_target!=noone)
	    {
	     draw_sprite_ext(spr_icon_chain,8,vec[0],vec[1],1,1,0,c_aqua,1);
	    }
	    break;
	   } 
   } 
	 }
	}
	vertex_end(buffer_col);
	vertex_submit(buffer_col, pr_linelist,-1);
}