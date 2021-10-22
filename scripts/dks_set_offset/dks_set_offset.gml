/// @description dks_set_offset(id, xoff, yoff)
/// @param id
/// @param  xoff
/// @param  yoff
function dks_set_offset(argument0, argument1, argument2) 
{
	with(argument0)
	{
	 xstart = x;
	 ystart = y;
	 mouse_startx = global.mouse_xd;               
	 mouse_starty = global.mouse_yd;
	 xoffset = argument1-x;
	 yoffset = argument2-y;
	 xsoffset = image_xscale;
	 ysoffset = image_yscale;

	 anoff = image_angle;
	 anoffx = x_rotation;
	 anoffy = y_rotation;
	 zoff = depth;
	 aloff = image_alpha;
	 vxsoff = vertex_xscale;
	 vysoff = vertex_yscale;
	 vanoff = vertex_angle;

	 bl_h = colour_get_hue(image_blend);
	 bl_s = colour_get_saturation(image_blend);
	 bl_v = colour_get_value(image_blend);  
	 if (bind_target !=noone)
	 {
	  var xf = x -bind_target.x;
	  var yf = y -bind_target.y;
	  bind_xoffset = scr_bind_set_xoffset(bind_target,xf,yf);
	  bind_yoffset = scr_bind_set_yoffset(bind_target,xf,yf);
	 }
 
	 if(parent)
	 {
	  if !keyboard_check(vk_shift)
	  {
	   var s = array_length(child);
	   for(var i =0; i<s; i++)
	   {
	    dks_set_offset(child[i],argument1,argument2);
	   }
	  }
	 }
	} 
}