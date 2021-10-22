function scr_hero_walk() 
{
	dks_sprite_switch(spr_hero_walk, abs(phy_speed_x*img_speed*0.2));
	if (key_left and key_right) or (!key_left and !key_right) 
	{
	 if (weapon != -1)
	 {
	  current_state= State.idle2;
  }
	 else
	 {
	  current_state= State.idle;
  } 
	}      
	else if (key_left)
	{
	 xscale = abs(image_xscale)*-1;
	 physics_apply_force(x+10,y,phy_left,0);
 } 
	else if (key_right)
	{
	 xscale = abs(image_xscale);
	 physics_apply_force(x-10,y,phy_right,0);
 }
 
	if (key_jump)
	{
  current_state = State.jump1;
 }
    
	if(phy_speed_y > falling)
	{
	 current_state = State.fall;
 }
    
	if (key_dash)
	{
	 current_state = State.run;
 }
 
	if(key_attack)
	{
  scr_attack(60); 
	}
 
	if (phy_speed_x > phy_max_right)
	{
	 phy_speed_x = phy_max_right;
	 part_type_direction( spawn_part,45,90,-1,1);
	 part_particles_create(hero_part,x-2,y+4,spawn_part,1);
	}
	else if (phy_speed_x < phy_max_left)
	{
	 phy_speed_x = phy_max_left;
	 part_type_direction( spawn_part,45,90,1,1);
	 part_particles_create(hero_part,x+2,y+4,spawn_part,1);
	}    
}