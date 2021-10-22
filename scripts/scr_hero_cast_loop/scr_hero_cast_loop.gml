function scr_hero_cast_loop() 
{
	dks_sprite_switch(spr_hero_cast_loop, 0.3*img_speed);
	if (key_left)
	{
	 if xscale = 1 
	 {
	  current_state = State.walk;
	 } 
 }
	else if (key_right)
	{
	 if xscale = -1 
	 {
	  current_state = State.walk;
	 } 
	}
}