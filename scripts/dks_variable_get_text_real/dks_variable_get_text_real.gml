/// @description dks_variable_get_text_real(variable);
/// @param variable
function dks_variable_get_text_real(argument0) 
{
	var t, dat, txt;
 txt = argument0;
	dat = string_digits(txt);
	if (dat != "") 
	{
	 t = real(dat);
	}
	else
	{
	 t = 0;
	}
 return t;
}