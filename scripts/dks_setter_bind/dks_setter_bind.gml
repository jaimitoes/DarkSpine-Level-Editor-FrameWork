function dks_setter_bind() 
{
	if (mouse_check_button_pressed(mb_left))
	{
	 with(target)
	 {
	  if(bind_target !=noone)
	  {
	   if (bind_target = other.near)
	   {
	    dks_message("Denied! You are child of this target.");exit;
	   }
	  }
	 }
	 dks_set_child(target, near);
	}
}