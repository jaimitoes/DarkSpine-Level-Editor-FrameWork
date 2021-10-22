function dks_menu_room_init() 
{
	// Menu Room settings
	button_room_setter_info = dks_button_reel_create("down",11,128,64,128,32,64,16,4,dark_gray,orange_pastel,orange_pastel,dark_gray,spr_button);
	dks_button_add_text(button_room_setter_info,0,"Room width");
	dks_button_add_text(button_room_setter_info,1,"Room height");
	dks_button_add_text(button_room_setter_info,2,"Room speed");
	dks_button_add_text(button_room_setter_info,3,"Physics pause");
	dks_button_add_text(button_room_setter_info,4,"Phy gravity X");
	dks_button_add_text(button_room_setter_info,5,"Phy gravity Y");
	dks_button_add_text(button_room_setter_info,6,"Pixel to metters");
	dks_button_add_text(button_room_setter_info,7,"Iteration speed");
	dks_button_add_text(button_room_setter_info,8,"Update speed");
	dks_button_add_text(button_room_setter_info,9,"Tex flushing");
	dks_button_add_text(button_room_setter_info,10,"Tex interpolat");
	button_room_setter_int = dks_button_reel_create("down",11,256,64,64,32,8,0,4,dark_gray,dark_gray,orange_pastel,dark_gray,spr_button);
}