function dks_editor_image_reset(argument0) 
{
	if(argument0 !=noone)
	{
	 with (argument0)
	 {
	  dks_image_reset();
  
	 }
	 dks_undo_write(undo_map,argument0.id,0);
	}   
	else
	{
	 dks_message("Not object selected")
	}
}