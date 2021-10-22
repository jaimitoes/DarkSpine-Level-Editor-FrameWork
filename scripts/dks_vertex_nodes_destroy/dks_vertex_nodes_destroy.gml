function dks_vertex_nodes_destroy() 
{
	if instance_exists(obj_node)
	{
	 instance_destroy(obj_node);
	}

	with (obj_deco_creator)
	{
	  node =0;
	  bezier_n1 =0;
	  bezier_n2 =0;
	  highlight_vertex = 0;
	}
}