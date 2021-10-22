/// @description scr_round_up_to_nearest(passed_number, nearest decimals)
/// @param passed_number
/// @param  nearest decimals
function scr_round_up_to_nearest(argument0, argument1) 
{
	if(argument1 == 0)
	{
	 return argument0;
	}
	else
	{
	 return ceil(argument0/argument1)*argument1;
	}
}