/// @description dks_state_switch(object, state or [array_string]);
/// @param object
/// @param  state; or [array_string]
function dks_state_switch(argument0, argument1) 
{
	//This script are defined to be used as a callback script 
	//or an independent script to change the state of an object like a player.
	//[0] = object,[1]= state. For TweenCallback use(transitions etc)
	if is_array(argument0)
	{
	 with(asset_get_index(argument0[0]))
	 {
	  current_state = real(argument0[1]);
	  show_debug_message("state"+string(current_state));
	  phy_active = 1;
	 }
	}
	else
	{
	 with(argument0)
	 {
	  current_state = argument1;
	  phy_active = 1;
	 }
	}
}