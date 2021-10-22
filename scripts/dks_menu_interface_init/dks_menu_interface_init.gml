/// @description  interface
function dks_menu_interface_init() 
{
	// Set the sensivity of the scrachPad settings in its different transformation modes an camera...(This section can be extended)
	enum Interface
	{
	 z_speed,
	 icon,
	 scratch_scale,
	 scratch_rot,
	 autofocus,
	 autosave,
	 foview
	}
	interface[Interface.z_speed] = 256;
	interface[Interface.icon] = 1;
	interface[Interface.scratch_scale] = 0.01;
	interface[Interface.scratch_rot] = 0.2;
	interface[Interface.autofocus] = 1;
	interface[Interface.autosave] = 1;
	interface[Interface.foview] = 32;
	icon_scale = 1;
	// Creates a button reel that stores the interface data
	button_setter_interface_info = dks_button_reel_create("down",7,128,64,128,32,64,16,4,dark_gray,orange_pastel,orange_pastel,dark_gray,spr_button);
	// Creates a secondary set of buttons for the input boxes creation
	button_setter_interface_int = dks_button_reel_create("down",7,256,64,128,32,8,2,4,dark_gray,dark_gray,orange_pastel,dark_gray,spr_button);
	dks_button_add_text(button_setter_interface_info,0,"Camera Z-wheel");
	dks_button_add_text(button_setter_interface_info,1,"Icon scaling");
	dks_button_add_text(button_setter_interface_info,2,"ScratchPad Scale");
	dks_button_add_text(button_setter_interface_info,3,"ScratchPad Rot");
	dks_button_add_text(button_setter_interface_info,4,"Auto-Focus Cam");
	dks_button_add_text(button_setter_interface_info,5,"Auto-Save");
	dks_button_add_text(button_setter_interface_info,6,"Field of View");
}