function dks_gui_object_paste() 
{
	with(last_copy)
	{
	 dks_object_paste(global.mouse_xd,global.mouse_yd,object_index);
	} 
}