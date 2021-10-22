/// @description scr_attack(combo timelimit)
/// @param combo timelimit
function scr_attack(argument0) 
{
	var a,s;
	if (weapon != -1)
	{
	 switch(weapon)
	 {
	  case "sword": 
	  if(grounded)
	  {
	   a[0] = State.attack1;
	   a[1] = State.attack2;
	   a[2] = State.attack3;
	  }
	  else
	  {
	   a[0] = State.air_attack1;
	   a[1] = State.air_attack2;
	   a[2] = State.air_attack3;
	   a[3] = State.air_attack4;
   }
	  s = array_length(a)
   if (combo_time = 0)
	  {
	   current_attack = 0;
	  }
	  else
	  {
	   current_attack +=1;
	  }
	  if (current_attack >=s)
	  {
	   current_attack = 0;
	   combo_time = 0;
	  }
	  else
	  {
	   combo_time = argument0;
	  }
   current_state = a[current_attack];
   break;
	 }
	}
	else
	{
  weapon = "sword";
	 current_attack = 0;
	 combo_time = 0;
	 current_state = State.get_sword;
 }
}