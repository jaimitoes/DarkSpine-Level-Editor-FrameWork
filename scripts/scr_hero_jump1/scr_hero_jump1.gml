function scr_hero_jump1() 
{
	if (can_jump=2) 
	{
	 grounded = false;
	 physics_apply_impulse(x,y,0,max_jump);
	 can_jump --;
	} 
 dks_sprite_switch(spr_hero_jump,0.3*img_speed);    
 if(key_attack)
	{
  if(weapon!=-1)
	 {
   physics_apply_impulse(x,y,0,max_jump*0.5);
	  scr_attack(60); 
  } 
	} 
	phy_rotation = lerp(phy_rotation,0,0.2);
 var air_speed;
	if key_dash 
	{
	 air_speed = phy_max_right*2;
	}
	else
	{
	 air_speed = phy_max_right;
	}    
	if (phy_speed_x > air_speed)
	{
	 phy_speed_x = air_speed;
	}
	else if (phy_speed_x < (-air_speed))
	{
	 phy_speed_x = -air_speed;
	}
 if (phy_speed_y >= 0)
	{
	 current_state =State.fall;
	}
}