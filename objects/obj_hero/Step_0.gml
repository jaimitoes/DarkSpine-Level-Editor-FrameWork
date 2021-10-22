///Updates, states, status, timers, etc...
if instance_exists(cam_target) and (cam_target.target = id) // If a custom cam is created in our level (in this case, the deco object "cam_target")
{
 cam_target.target_xf = abs(cam_target.target_xf)*xscale;// Set the offset of the custom camera in real time...
 //...this will be positioned behind our player depending on where he looks at this.
}
//You exit simulation mode and return to the DarkSpine Menu
if keyboard_check_pressed(vk_backspace)
{
 dks_level_load("Launcher", "DarkSpine_launcher");///Load a Json file in simulation mode (You have 2 scripts to load Json files, "dks_level_load"...
 //...and "dks_work_load", dks_level_load must to be used in your final game to load Json Files (levels), dks_work_load is used to load Json files on the editor mode.
}

// update, combo timer status
if(combo_time !=0)
{
 combo_time -=1;
 if (combo_time<=0)
 {
  combo_time = 0;
 }
} 

//GamePad update checking
script_execute(gamepad_script);
//Finite State machine update
script_execute(array_state[current_state]);
//Update the depth of the custom hero Particle System
part_system_depth(hero_part,depth+1);








