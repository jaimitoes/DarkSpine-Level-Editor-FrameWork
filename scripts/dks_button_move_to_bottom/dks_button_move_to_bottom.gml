function dks_button_move_to_bottom(argument0) 
{
	var a = argument0;
	var s = array_length(a);
	var h = window_get_height();
	var yf = 720-h;
	for(var i =0; i<s;i++)
	{
	 a[i][@1] = a[i][@1]+ yf;
	 a[i][@3] = a[i][@3]+ yf;
	}
}