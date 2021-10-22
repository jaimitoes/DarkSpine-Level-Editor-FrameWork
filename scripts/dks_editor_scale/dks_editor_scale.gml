function dks_editor_scale() 
{
	switch(obj_deco_creator.scale_edit)
	{
	 case "x" : dks_editor_scale_x();break;
	 case "y" : dks_editor_scale_y();break;
	 case "xy": dks_editor_scale_xy();break;
	}     
}