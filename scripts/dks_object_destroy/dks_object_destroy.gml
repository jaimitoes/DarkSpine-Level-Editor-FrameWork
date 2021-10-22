/// @description dks_object_destroy(object)
/// @param object
function dks_object_destroy(argument0) 
{
 obj_cam_editor.target_view =0;
	obj_cam_editor.target = noone;
 dks_destroy_tools();
	with(argument0)
	{
	 if(obj_deco_creator.modo = mode.multiple)
	 {
	  with(obj_multiple_select)
	  {
	   if instance_exists(obj_deco)
	   {
	    with(obj_deco)
	    {
	     if (selected)
	     {
	      with(obj_deco_creator)
	      {
	       dks_undo_write(undo_map,other.id,2);
	      } 
	      if keyboard_check(vk_control)
	      {
	       if(parent)
	       {
	        dks_child_destroy();
	       }
	      }
	      instance_destroy();
      }
	    }
    
	   }
	   instance_destroy();
	  }
	 }
	 else
	 {
	 with(obj_deco_creator)
	 {
	  dks_undo_write(obj_deco_creator.undo_map,other.id,2); 
	 } 
	 if(keyboard_check(vk_control))
	 {
	  if (parent)
	  {
	   dks_child_destroy();
	  }
  
	 }
	 if(bind_target !=noone)
	 {
	  dks_child_unparent();
	 }
	 instance_destroy();
	 }
	}
	target = noone;
	near = noone;
}