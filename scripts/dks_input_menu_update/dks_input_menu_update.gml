/// @description dks_input_menu_update   
function dks_input_menu_update() {
	var sel, minpos, maxpos;
	minpos = min(cursor_pos, cursor_pos2);
	maxpos = max(cursor_pos, cursor_pos2);
	sel = (cursor_pos != cursor_pos2);
	if (sel)
	{
	 if ((minpos = 0) && (maxpos = string_length(text)))
	 {
	  menu_sets[0, 4] = 0;
	  menu_sets[1, 4] = 0;
	  menu_sets[2, 4] = 1;
	  menu_sets[3, 4] = 1;
	  menu_sets[4, 4] = 1;
	  menu_first_set = 2;
	 }
	 else
	 {
	  menu_sets[0, 4] = 0;
	  menu_sets[1, 4] = 1;
	  menu_sets[2, 4] = 1;
	  menu_sets[3, 4] = 1;
	  menu_sets[4, 4] = 1;
	  menu_first_set = 1;
	 }
	}
	else
	{
	 menu_sets[0, 4] = 1;
	 menu_sets[1, 4] = 1;
	 menu_sets[2, 4] = 0;
	 menu_sets[3, 4] = 1;
	 menu_sets[4, 4] = 0;
	 menu_first_set = 0;
	}
    
    



}
