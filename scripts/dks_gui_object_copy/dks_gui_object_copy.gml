function dks_gui_object_copy() 
{
	last_copy = target;
	dks_object_copy(target);
	dks_message("Copied object...");
}