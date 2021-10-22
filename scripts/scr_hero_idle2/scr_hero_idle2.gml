function scr_hero_idle2()
{
	dks_sprite_switch(spr_hero_idle_sword, 0.5*img_speed);
	if (key_left and key_right) or (!key_left and !key_right) //or (mouse_left_released)
	{
	 phy_speed_x = lerp(phy_speed_x,0,0.1);
	}   
	else if (key_left) or (key_right) 
	{
	 current_state = State.walk;
	}

	if (key_jump)
	{
	 current_state = State.jump1;
	} 
	
 if(key_attack)
	{
	 scr_attack(60); 
	}

	if(key_weapon)
	{
  current_state = State.save_sword;
	 weapon = -1;
	}

 if(phy_speed_y > falling)
	{
	 current_state = State.fall;
	}

	else if (phy_speed_y <-phy_max_right)
	{
	 current_state = State.jump1;
	}
}