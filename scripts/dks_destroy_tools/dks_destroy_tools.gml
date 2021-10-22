function dks_destroy_tools() 
{
	dks_vertex_nodes_destroy();
	dks_spine_node_destroy();     
	dks_editor_scale_destroy(); 
	dks_editor_multiselect_destroy();
	if(input_created)
	{
	 dks_input_list_destroy(input_list);
	 input_created = 0;
	} 
	dks_tweener_destroy();
	button_variables_info = 0;
	button_variables_int = 0;
	obj_deco_creator.multitarget = 0;
	if instance_exists(obj_question)
	{
	 instance_destroy(obj_question);
	}
}