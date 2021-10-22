/// @description Destroy all nodes and inputs
// Puede escribir su código en este editor
instance_destroy(tween_node[0]);
instance_destroy(tween_node[1]);
if(input_node_created)
{
 dks_input_list_destroy(node_input);
 dks_input_list_destroy(callstart_input);
 dks_input_list_destroy(callend_input);
 dks_input_list_destroy(callstop_input);
 input_node_created = 0;
 }	  
instance_destroy(obj_tween_node);
tween_sequence = 0;
creator.target = target;