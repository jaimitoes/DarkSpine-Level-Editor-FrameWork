/// @description dks_array_update(Array to update, Source)
/// @param Array to update
/// @param  Source
function dks_array_update(argument0, argument1) 
{
	var a = argument0;
	var v = argument1;
	var s = array_length(v);
	for (var i =0; i<s; i++)
	{
	 a[@ i] = v[i];
	}
}