/// @description dks_input_get_text_real(inputbox);
/// @param inputbox
function dks_input_get_text_real(argument0) 
{
	var t, dat, txt;
 txt = dks_input_get_text(argument0);
	dat = string_digits(txt);
	if (dat != "") 
	{
	 if(string_length(dat) == 1)
	 {
	  if(string_length(txt) == 2)
	  {
		  t = real(txt);   
	  }
	  else
	  {
	   t = real(dat);
	  }	
	 }
	 else
	 {
	  t = real(txt);
	 } 
	}
	else
	{
	 t = 0;
	}
 return t;
}