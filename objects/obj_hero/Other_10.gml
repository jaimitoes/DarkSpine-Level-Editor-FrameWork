/// @description Editor variables...
// Custom components, Gets the data from the editor while a simulation is executed, the variable "perform event", located in the editor with a default value of -1, can be setted from 0 to 15...
// to run a custom CREATE END EVENT that you can manage to create your own systems...

// Set the initial depth of our custom particle system
part_system_depth(hero_part,depth+1);
// While we create variables from the editor, we must to link our custom variables with the array "val", 
//assigning our defined variables in the same order in which we have created them in this event (See the script "dks_editor_scripting_init" to see how to store the editor info...
//from the editor controller (obj_editor_control). This object is only executed 1 time in the compilation.
if is_array(variables)
{
 // Pass the editor variables data from the array "variables" to the array "val"
 dks_array_update(val,variables);
 // Use the "val" array to assign the initial data of our custom variables
 phy_left = real(val[0]);
 phy_right = real(val[1]);
 max_jump = real(val[2]);
 phy_max_left = real(val[3]);
 phy_max_right = real(val[4]);
 dash_max_left = real(val[5]);
 dash_max_right = real(val[6]);
 falling = real(val[7]);
 img_speed = real(val[8]);
 current_state = real(val[9]);
}


