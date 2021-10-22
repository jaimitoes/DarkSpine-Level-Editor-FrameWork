/// @description dks_string_find_char_x(string, x, px)
/// @param string
/// @param  x
/// @param  px
function dks_string_find_char_x(argument0, argument1, argument2) 
{
	var a, b, a1, b1,str, xx, px;
	str = argument0;
	xx = argument1;
	px = argument2;
	for (i = 0; i <= string_length(str); i += 1)
	{
	 if ((string_width(string_copy(str, 0, i)) > (px-xx)) || (i = string_length(str)))
	 {
	  a = i;
	  b = max(i-1, 0);
	  break;
	 }
	}

	if (a = b) return string_copy(str, a, 1);
	a1 = xx+string_width(string_copy(str, 0, a));
	b1 = xx+string_width(string_copy(str, 0, b));
	if (abs(px-a1) < abs(b1-px)) 
	{
	 return string_copy(str, a, 1); 
	}
	else 
	{
	 return string_copy(str, b, 1);
	} 
}