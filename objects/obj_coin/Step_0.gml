if(visible)
{
 var a = depth, b = obj_hero.depth, ab = abs(a-b);
 if(ab<30)
 {
  if place_meeting(x,y,obj_hero)
  {
   part_particles_create(obj_hero.hero_part,x,y,obj_hero.part_coin,1);
   instance_destroy();
  } 
 }
}


