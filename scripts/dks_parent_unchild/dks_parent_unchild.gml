function dks_parent_unchild() 
{
	if is_array(child)
	{
	 var size = array_length(child);
	 for (var i =0;i<size;i++)
	 {
	  if(instance_exists(child[i]))
	  {
	   if(child[i].bind_target = id)
	   {
	    with (child[i])
	    {
	     bind_target = noone;
	    }
	   }
	  }
	 }
	}
	parent = 0;
	child = 0;
}