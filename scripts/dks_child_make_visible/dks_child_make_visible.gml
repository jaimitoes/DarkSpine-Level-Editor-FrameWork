/// @description Make visible a hierarchy of objects
function dks_child_make_visible() {
	// The parent object has the ability to make visible a hierarchy...
	for (var i =0; i<size; i++)
	{
	 with(child[i])
	 {
	  visible = 1;
	  if(parent)
	  {
	   dks_child_make_visible();
	  }
	 }
	}



}
