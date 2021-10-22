/// @description dks_input_list_get_array_real(input list);
/// @param input list
function dks_input_list_get_array_real(argument0) 
{
	var t;
	var s = ds_list_size(argument0);
	var dat,txt;
	for(var i = 0;i<s;i++)
	{
	 txt = dks_input_get_text(argument0[| i]);
	 dat = string_digits(txt);
	 if (dat != "") 
	 {
	  if(string_length(dat) == 1)
	  {
	   if(string_length(txt) == 2)
	   {
		   t[i] = real(txt);   
	   }
	   else
	   {
	    t[i] = real(dat);
	   }	
	  }
	  else
	  {
	   t[i] = real(txt);
	  } 
	 }
	 else
	 {
	  t[i] = 0;
	 }
	}
	return t;
}