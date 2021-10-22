///Update title status
//Exit application
if keyboard_check_pressed(vk_escape) or keyboard_check_pressed(vk_backspace)
{
 game_end();
}
//This object is a parent from the DarkSpine editor...
//..we have made a very simple check based on its sprite resource to execute different actions
var s = array_length(child);
for (var i =0; i<s; i++)
{
 with(child[i])
 {
  if position_meeting(global.mouse_xd, global.mouse_yd, id)
  {
   switch(sprite_index)
   {//Change the color of the particle titles
    case spr_darkspine:
    part_type_colour3(ps_part[0],c_yellow,c_aqua,c_lime);
    
    break;
    case spr_leveleditor:
    part_type_colour3(ps_part[0],c_yellow,c_aqua,c_lime);
    break;
    case spr_framework:
    part_type_colour3(ps_part[0],c_yellow,c_aqua,c_lime);
    break;
    case spr_play_game:
    
    part_type_colour3(ps_part[0],c_yellow,c_orange,c_red);
	//Mouse click check, here is the first level loaded by the title menu if we want to play our game...
	//...in the final version of this.
	
    if mouse_check_button_pressed(mb_left)
    {
	 // Dks level load (ingame fast load) script: the first argument search the level folder located on the path:
	 // YourProject/DarkSpine/Levels/... of our Working directory (Users/UserName/AppData/YourProjectName on Windows)
     dks_level_load( "Default", "Particle Node System");
     exit;
    }
    break;
    // Load the editor tool and all its components
    case spr_editor_tool:
	// Generate a highlighted color in our particle
    part_type_colour3(ps_part[0],c_yellow,c_orange,c_red);
	///////
    if mouse_check_button_released(mb_left)
    {
	 // Destroy all current objects
     instance_destroy(obj_deco); 
	 // Load the DarkSpine´s editor tool 
	 instance_create_depth(0,0,0,obj_editor_control);
	 exit;
    }
	break;
   }
  }
  else
  { 
   //Generate the default particle colour
   part_type_colour3(ps_part[0],dk_part[7],dk_part[8],dk_part[9]);
  } 
 } 
} 



