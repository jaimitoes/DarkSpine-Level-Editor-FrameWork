function scr_color_child() 
{
	var size = array_length(child)
	for (var i =0; i<size;i++)
	{
	 with(child[i])
	 {
	  image_blend = other.image_blend;
	  dks_vertex_check(id);
	  if (parent)
	  {
	   scr_color_child();
	  }
	 }
	}               
}