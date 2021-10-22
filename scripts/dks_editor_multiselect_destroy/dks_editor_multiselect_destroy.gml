function dks_editor_multiselect_destroy() 
{
	if(obj_deco_creator.modo!= mode.multiple)
	{
  if instance_exists(obj_multiple_select)
	 {
	  with(obj_multiple_select)
	  {
	   if instance_exists(obj_deco)
	   {
	    with(obj_deco)
	    {
	     if (selected)
	     {
	      selected =false;
	     }
	    }
	    if(parent)
	    {
	     dks_parent_unchild();
	    }
	   creator.target = noone;
	   }
	   instance_destroy();
	  }
	 }
	}
}