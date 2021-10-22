/// @description dks_string_find_x(string, x, px, round)
/// @param string
/// @param  x
/// @param  px
/// @param  round
function dks_string_find_x(argument0, argument1, argument2, argument3) 
{
	var a, b, a1, b1,str,xx,px,r;
	str = argument0;
	xx = argument1;
	px = argument2;
	r = argument3;

	for (i = 0; i <= string_length(str); i += 1)
	{
	 if (string_width(string_copy(str, 0, i)) > (px-xx)) || (i = string_length(str))
	 {
	  a = i;
	  b = max(i-1, 0);
	  break;
	 }
	}
	if (a = b) return a;
	a1 = xx+string_width(string_copy(str, 0, a));
	b1 = xx+string_width(string_copy(str, 0, b));
	r = sign(r);
	switch (r)
	{
	 case 0:if (abs(px-a1) < abs(b1-px)) return a; else return b;break;
	 case 1:return a;break;
	 case -1:return b;break;
	}
}