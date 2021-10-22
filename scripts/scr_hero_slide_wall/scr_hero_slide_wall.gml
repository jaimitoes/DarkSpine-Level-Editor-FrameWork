function scr_hero_slide_wall() 
{
	dks_sprite_switch(spr_hero_slide_wall,0.5*img_speed);
	if(last_colx = 1)
	{
	 if(key_jump)
	 {
	  physics_apply_impulse(x,y,-50,max_jump*1.5);
	  can_jump --;
	  xscale = -1;
	  current_state = State.jump1;exit;
	 }
	 else
	 {
	  physics_apply_force(x,y,phy_right,-10);
	  part_type_direction( part_ground[2],90,135,1,1);
	  part_particles_create(hero_part,x, y-4,part_ground[2],1);
	  if(phy_speed_x !=0.)
	  {
	   current_state = State.fall;
	  }
	 }
	}
	else if (last_colx = -1)
	{
	 if(key_jump)
	 {
	  physics_apply_impulse(x,y,50,max_jump*1.5);
	  can_jump --;
	  xscale = 1;
	  current_state = State.jump1;exit;
	 }
	 else
	 {
	  physics_apply_force(x,y,phy_left,-10);
	  part_type_direction( part_ground[2],90,45,-1,1);
	  part_particles_create(hero_part,x, y-4,part_ground[2],1);
	  if(phy_speed_x !=0.)
	  {
	   current_state = State.fall;
	  }
	 }
	} 

	if (phy_speed_y > 4)
	{
	 phy_speed_y = 4;
 }
}