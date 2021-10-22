/// @description dks_input_object_get_active(object);
/// @param object
function dks_input_object_get_active(argument0) 
{
	if instance_exists(argument0)
	{
	 var o = argument0;
	 var s = instance_number(o);
	 var inst;
	 for (var i = 0; i<s; i++)
	 {
	  inst = instance_find(o,i);
	  if (inst.active)
	  {
	   return true;	 
	  }
	 }
	}
	return false;
}