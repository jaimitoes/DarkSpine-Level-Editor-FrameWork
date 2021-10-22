function scr_hero_attack2() 
{
	dks_sprite_switch(spr_hero_attack2, 1*img_speed);
	if key_jump
	{
	 current_state = State.jump1;exit;
	}
}