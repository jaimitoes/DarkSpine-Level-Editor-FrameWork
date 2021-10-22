function dks_editor_scale_an() 
{
	var scaler = (Mxd -mouse_startx)*0.2;
	image_angle = anoff +scaler;
       
	if (image_angle<0)
	{
	 image_angle+=360;
	}
	else if(image_angle >360)
	{
	 image_angle -=360;
	}
}