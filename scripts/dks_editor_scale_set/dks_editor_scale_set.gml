/// @description dks_editor_scale_set(target);
/// @param target
function dks_editor_scale_set(argument0) 
{
	var i;
	for ( i=0;i<2;i++)
	{
	 scale_slider[i].x = argument0.x;
	 scale_slider[i].y = argument0.y;
	}
 
	scale_slider[0].image_xscale = argument0.image_xscale*global.ratio;
	scale_slider[0].image_yscale = 1*global.ratio;
	scale_slider[1].image_xscale = 1*global.ratio;
	scale_slider[1].image_yscale =argument0.image_yscale*global.ratio;

 if mouse_check_button_pressed(mb_left)
	{ 
	 for (i=0;i<2;i++)
	 {
	  if position_meeting(Mxd,Myd,scale_slider[i])
	  {
	   switch(i)
	   {
	    case 0 : scale_edit = "x";exit;
	    case 1 : scale_edit = "y";exit;
	   }
	  }
	 }
	 scale_edit = "xy";
	} 
}