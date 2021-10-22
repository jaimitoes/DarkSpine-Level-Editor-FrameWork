/// @description dks_target_set(object)
/// @param object
function dks_target_set(argument0) 
{
	if (argument0!=noone)
	{
	 dks_destroy_tools();
	 target = argument0;
	 depth = target.depth;
	 with(target)
	 {
	  if (have_polygon = false)
	  {
	   if (ds_exists(poly_list, ds_type_list))
	   {
	    ds_list_destroy(poly_list);
	    obj_deco_creator.node =0;
	   }
	  }                                  
	 }
	 step_undo =-1;
	 blend_color[@ 0] = colour_get_hue(target.image_blend);
	 blend_color[@ 1] = colour_get_saturation(target.image_blend);
	 blend_color[@ 2] = colour_get_value (target.image_blend);
     
	 if(interface[4])//camera center
	 {
	  with(obj_cam_editor)
	  {
	   target_view = 1;
	  }
	 } 
  return argument0.id; 
	}
	else
	{
	 return noone;
	}
}