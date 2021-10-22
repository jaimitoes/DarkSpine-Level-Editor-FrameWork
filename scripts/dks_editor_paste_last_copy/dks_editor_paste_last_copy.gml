// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function dks_editor_paste_last_copy()
{
	if(last_copy != noone)
	{
	 last_copy = instance_create_depth( Mxd, Myd, depth, obj_deco);
	 with(last_copy)
	 {
			if (obj_editor_control.save_object_execute) and (obj_editor_control.save_object_transform != noone)
			{
	   other.last_copy = dks_editor_object_paste( other.Mxd, other.Myd, asset_get_index(obj_editor_control.save_object_transform));
				other.target = other.last_copy;
			}	
			else
			{
				other.last_copy = dks_editor_object_paste( other.Mxd, other.Myd, obj_deco);
				other.target = other.last_copy;
			}
							
	  instance_destroy();
	 }
	}
}