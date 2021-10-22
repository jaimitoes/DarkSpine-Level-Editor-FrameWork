function dks_child_unparent() 
{
	if instance_exists(bind_target)
	{
	 var size = array_length(bind_target.child);
	 for (var i =0; i<size;i++)
	 {
	  if (id = bind_target.child[i])
	  {
	   bind_target.child[i] = noone;
	  }
	 }
	 dks_parent_update_child(bind_target);
	}
}