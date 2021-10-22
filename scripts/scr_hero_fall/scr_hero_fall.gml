function scr_hero_fall() 
{
	dks_sprite_switch(spr_hero_fall, 0.3*img_speed);
	if (key_jump) and  (can_jump !=0)
	{
	 switch(can_jump)
	 {
	  case 2: current_state = State.jump1;break;
	  case 1: current_state = State.jump2;break;
	 }
 }

	if (key_left and key_right) or (!key_left and !key_right) 
	{
	 //if(! mouse_left)
	 //{
	  phy_speed_x = lerp(phy_speed_x,0,0.1);
	 //}
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
	if (key_dash) 
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
 if(key_attack)
	{
	 if(weapon!=-1)
	 {
	  physics_apply_impulse(x,y,0,max_jump);
	  scr_attack(60); 
	 } 
	} 
}