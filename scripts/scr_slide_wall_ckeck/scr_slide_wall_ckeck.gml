function scr_slide_wall_ckeck() 
{
	//Calculate if the collision are detected from the left side of the player and the outside feet range of this.
	if(phy_collision_x <= x-5) and (phy_collision_y <y-10)
	{
  xscale = -1;
	 can_jump = 2;
	 last_colx = -1;
	 current_state = State.slide_wall; 
 } 
	//Calculate if the collision are detected from the right side of the player and the outside feet range of this.
	else if(phy_collision_x >= x+5) and (phy_collision_y <y-10)
	{
	 xscale = 1;
	 can_jump = 2;
	 last_colx = 1;
	 current_state = State.slide_wall; 
	}
	else
	{
	 //If the two previous conditions have not been met, we assign null...
	 //...to the variable that store the last collision orientation.
	 last_colx = 0;
	}
}