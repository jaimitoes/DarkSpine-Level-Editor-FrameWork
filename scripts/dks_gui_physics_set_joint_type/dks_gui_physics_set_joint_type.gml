function dks_gui_physics_set_joint_type() 
{
	var s = array_length(text_joint_type);
	for(var i =0;i<s;i++)
	{
	  if (target.phyprops[| physics.joint_type] = text_joint_type[ i])
	  {
	   if (i!=s-1)
	   {
	    target.phyprops[| physics.joint_type] = text_joint_type[ i+1];
	    target.joint = false;
	    target.joint_target = noone;
	    break;
	   }
	   else
	   {
	    if ds_exists(target.joint_list, ds_type_list)
	    {
	    ds_list_destroy(target.joint_list);
	    ds_list_destroy(target.joint_offset);
	    }
	    target.phyprops[| physics.joint_type] = text_joint_type[ 0];
	    target.joint = false;
	    target.joint_target = noone;
    
	    break;
	   }
	  }
	}
	dks_input_set_text(input_list[| physics.joint_type],target.phyprops[| physics.joint_type]); 
}