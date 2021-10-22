function dks_child_destroy() 
{
	var size = array_length(child);
	for (var i =0; i<size;i++)
	{
	 with(obj_deco_creator)
	 {
	  dks_undo_write(undo_map,other.child[i],2);
	 }
	 with(child[i])
	 {
   if(parent)
	  {
	   dks_child_destroy();
	  }
	   instance_destroy();
  }
	}
}