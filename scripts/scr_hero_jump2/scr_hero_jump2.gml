function scr_hero_jump2()
{
	dks_sprite_switch(spr_hero_jump2,1*img_speed);
	if (can_jump=1)
	{
	 grounded = false;
	 physics_apply_impulse(x,y,0,max_jump*1.5);
	 can_jump --;
	}  
	if(key_attack)
	{
	 if(weapon!=-1)
	 { 
	  if(phy_speed_y >=0)
	  {
	   physics_apply_impulse(x,y,0,max_jump*0.5);
	  } 
	  scr_attack(60); 
	 } 
	} 

	if (key_left and key_right) or (!key_left and !key_right)
	{
  phy_speed_x = lerp(phy_speed_x,0,0.1);
	}      
	else if (key_left)
	{
  physics_apply_force(x+10,y,phy_left,0);
	}
	else if (key_right)
	{
  physics_apply_force(x,y,phy_right,0);
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
 
	if (phy_speed_y > 0)
	{
	 current_state =State.fall;
	}
}