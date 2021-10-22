/// @description dks_parent_update_child(parent)
/// @param parent
function dks_parent_update_child(argument0) 
{
 with(argument0)
	{
	 var size = array_length(child);
	 var l = ds_list_create();
	 for (var i =0;i<size;i++)
	 {
	  if (child[i] !=noone)
	  {
	   ds_list_add(l,child[i]);
	  }
	 }
	 child =0;
	 if ds_list_empty(l)
	 {
	  parent = false;
	 }
	 else
	 {
	  child = dks_array_create_from_list(l);
	 }
	 ds_list_destroy(l);
	}
}