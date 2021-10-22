function scr_hero_state_active() 
{
	if instance_exists(obj_hero)
	{
	 with(obj_hero)
	 {
	  current_state = State.fall;
	 }
	}
}