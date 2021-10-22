function dks_editor_go_to_edit_mode()
{
	if instance_exists(obj_deco)
	{
	modo = mode.edit;
	}
	else
	{
	 dks_message("No objects in space, place your first object with mouse click");
	}
}