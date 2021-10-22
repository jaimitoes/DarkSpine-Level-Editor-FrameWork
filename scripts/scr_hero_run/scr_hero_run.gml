function scr_hero_run() 
{
 if key_jump
	{
	 current_state = State.jump1;exit;
	}
 
	if(key_attack)
	{
  scr_attack(60); 
	}

	if (key_left)
	{
	 xscale = abs(image_xscale)*-1;
	 physics_apply_force(x+10,y,dash_max_left,0);
	 part_type_direction( part_ground[0],45,90,-1,1);
	 part_particles_create(hero_part,x+2,y+4,spawn_part,1);
	} 
	else if (key_right)
	{
	 xscale = abs(image_xscale);
	 physics_apply_force(x-10,y,dash_max_right,0);
	 part_type_direction( part_ground[0],45,90,1,1);
	 part_particles_create(hero_part,x-2,y+4,spawn_part,1);
	}
	else
	{
	 current_state = State.fall;
	}

 if(grounded)
	{
	 dks_sprite_switch(spr_hero_walk, abs(phy_speed_x*img_speed*0.2));
	}

	if (key_dash_released)
	{
	 current_state = State.fall;
	}
	if(phy_speed_y > falling)
	{
	 if(grounded)
	 {
	  current_state = State.slide_begin;
	 }
	 else
	 {
	  current_state = State.fall;
	 }
 }

	if (phy_speed_x > phy_max_right*2)
	{
	 phy_speed_x = phy_max_right*2;
	}
	else if (phy_speed_x < phy_max_left*2)
	{
	 phy_speed_x = phy_max_left*2;
	}
}