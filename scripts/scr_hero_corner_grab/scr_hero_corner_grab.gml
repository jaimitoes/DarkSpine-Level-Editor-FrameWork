function scr_hero_corner_grab() 
{
 if (key_left) or (key_right)
	{
	 dks_sprite_switch(spr_hero_corner_climb, 0.2*img_speed);
	}
	else
	{
	 dks_sprite_switch(spr_hero_corner_grab, 0.2*img_speed);
	}
}