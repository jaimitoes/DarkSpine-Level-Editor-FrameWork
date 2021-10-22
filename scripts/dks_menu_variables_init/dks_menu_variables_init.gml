function dks_menu_variables_init() 
{
	button_variables_create = dks_button_reel_create("right",3,128,0,128,32,64,16,4, dark_gray,orange_pastel,orange_pastel,dark_gray,spr_button);
	dks_button_add_text(button_variables_create,0,"Add Variable");
	dks_button_add_text(button_variables_create,1,"Delete All");
	dks_button_add_text(button_variables_create,2,"Execute object");
	button_variables_info = 0;
	button_variables_int  = 0;
}