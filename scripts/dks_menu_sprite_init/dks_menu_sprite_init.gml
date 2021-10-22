/// @description SPRITE MENU
function dks_menu_sprite_init() 
{
	//adding sprites
	text_question[ question.SpriteAdd][0] = "Insert the sprite name to add...";
	text_question[ question.SpriteAdd][1] = dks_sprite_add;
	// Adding folders
	text_question[ question.FolderAdd][0] = "Insert the folder name to add...";
	text_question[ question.FolderAdd][1] = dks_sprite_folder_add;
	text_question[ question.tree_export][0] = "Insert the TREE name to export...";
	text_question[ question.tree_export][1] = dks_sprite_tree_export;
	text_question[ question.tree_import][0] = "Insert the TREE name to import...";
	text_question[ question.tree_import][1] = dks_sprite_tree_import;
	// Selecting type sprite
	menu_sprite_manager = dks_button_reel_create("right",4,160,0,128,32,64,16,4,dark_gray,node_color,node_color,dark_gray,spr_button);
	dks_button_add_text(menu_sprite_manager,0,"ADD FOLDER");
	dks_button_add_text(menu_sprite_manager,1,"ADD SPRITE");
	dks_button_add_text(menu_sprite_manager,2,"IMPORT TREE");
	dks_button_add_text(menu_sprite_manager,3,"EXPORT TREE");
	// Selecting folders
	menu_b_tab_sprite = dks_button_create(128,64,32,32,16,16,dark_gray,node_color,node_color,dark_gray,spr_button_32);
	menu_b_tab_sprite = dks_button_add_reel(menu_b_tab_sprite,"right",32,32,16,16,256,dark_gray,node_color,node_color,dark_gray,spr_button_32);
	dks_button_add_text(menu_b_tab_sprite,0,"<--");
	dks_button_add_text(menu_b_tab_sprite,1,"-->");
	// show the current type sprite
	menu_tab_sprite = dks_button_create(160,64,256,32,128,16,dark_gray,node_color,node_color,dark_gray,spr_button_256);
	menu_no_sprite = dks_button_create(160,32,128,32,64,16,dark_gray,red_pastel,red_pastel,dark_gray,spr_button);
	dks_button_add_text_script(menu_no_sprite,0,"NO SPRITE",dks_sprite_default);
}