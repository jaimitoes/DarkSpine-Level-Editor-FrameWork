event_inherited();
if (tween_exists)
{
 if(part_system != noone)
 {
   with(part_system)
   {
    x = other.x;
    y = other.y;
    depth = other.depth;
    burst_script = dks_particle_burst;
   }
 }
}

