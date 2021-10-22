/// Colliding with the hero player
if(target = noone)
{
 // Target collision checking	
 target = other.id;
 
 with(target)
 {
   // Set the player offset, looking the step event, this variables are updated	to calculate the matrix transformation.  
   var xf = phy_collision_x - other.x;
   var yf = phy_collision_y - other.y;
   xoffset = scr_bind_set_xoffset(other.id,xf,yf);
   yoffset = scr_bind_set_yoffset(other.id,xf,yf);
 }
} 

