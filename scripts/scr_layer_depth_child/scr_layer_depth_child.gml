function scr_layer_depth_child() 
{
	var size = array_length(child)
	for (var i =0; i<size;i++)
	{
	 with(child[i])
	 {
	  //dks_set_offset(id,Mxd,Myd);
	  lay_depth = bind_target.lay_depth;
	  if(parent)
	  {
	   scr_layer_depth_child();
	  }
	 }
	}               
}