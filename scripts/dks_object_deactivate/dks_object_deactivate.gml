/// @description dks_object_deactivate(object)
/// @param object
function dks_object_deactivate(argument0) 
{
	with(argument0)
	{
	 if (parent = true)
	 {
	  var s = array_length(child)
	  for (var i = 0; i<s;i++)
	  {
	   dks_object_deactivate(child[i]);
	  }
	 }
	 instance_deactivate_object(id);
	}
}