function dks_object_multi_copy_paste() 
{
	with(target)
	{
	 dks_object_copy(id);
	 var inst = dks_object_paste(x,y,obj_multiple_select);
	 if(parent)
	 {
	  dks_parent_unchild();
	  var s = array_length(child);
	  for(var i =0; i<s; i++)
	  {
	   child[i].selected = 0;
	   inst.child[i].selected = 1;
	  }
	 }
 
	 instance_destroy(id);
	}   
	target = obj_multiple_select;
}