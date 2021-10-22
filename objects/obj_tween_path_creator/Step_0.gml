event_inherited();
if(tween_exists)
{
	
 part_system.burst_script = dks_null;
 for(i = 0; i<s; i++)
 { 
  if place_meeting(x, y, ob_id[i])
  {
   ob_id[i].visible = 1;
   part_system.burst_script = dks_particle_burst;
  }
 }
}