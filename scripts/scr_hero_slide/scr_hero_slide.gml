function scr_hero_slide() 
{
	dks_sprite_switch(spr_hero_slide,0.3*img_speed);
	if(phy_speed_y < falling)
	{ 
	 current_state = State.slide_end;
	}
 part_particles_create(hero_part,x,y,part_ground[2],2);
	part_particles_create(hero_part,x,y,spawn_part,2);
}