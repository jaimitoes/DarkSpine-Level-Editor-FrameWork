function dks_child_transform() 
{
	// Binding childs like bones 

	/* In Darkspine, you have the abbility to bind objects with a custom parent/child system.
	 That means you can profit this methodology to make any kind of systems...*/
	// Get the lenght of the hierarchy
	var size = array_length(child)
	// Update the father matrix
	dks_matrix_update();
	// Bind all child objects like bones relative to the father
	for (var i =0; i<size;i++)
	{
	 with(child[i])
	 {
	  dks_bind_to(bind_target,bind_xoffset,bind_yoffset);
  
	  if (parent)
	  {
		  //Chain the operation to bind the full hierarchy
	   dks_child_transform();
	  }  
	 }
	}               
}