/// @description AutoSave
// If the autosave mode are activated (This option can be setted in our editor, located on the interface panel.
// you can change this value, in this case, the editor saves every 600 seconds a temporal copy from the current state of our current workspace called "temp".

if(interface[Interface.autosave])
{
 time_save_level -=1;
 if(time_save_level <=0)
 {
  switch(modo)
  {
   //For the moment, not available in Tween mode.	  
   case mode.animator:
   time_save_level = room_speed*30;
   break
   case mode.polygon:
   // To prevent bugs, the auto save mode does not work with the setter vector mode.
   if(menu_setters != setter.vector)
   {
	   dks_work_save(level_folder,"temp");
    dks_message("Level [temp] auto-saved.");
    time_save_level = room_speed*600;   
   }
   else
   {
	//If the counter are less than 0 and the setter vector mode are active, the counter are reseted with a value lower than the defaut one... 
    //...with the intention of trying once it is not in that mode.  
	 time_save_level = room_speed*30;  
   }
   break;
   default:
   /// In all other.id modes and setters we are able to save.
   dks_work_save(level_folder,"temp");
   dks_message("Level [temp] auto-saved.");
   time_save_level = room_speed*600;
  }
 } 
}

