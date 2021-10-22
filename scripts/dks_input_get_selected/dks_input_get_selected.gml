/// @description dks_input_get_selected(id)
/// @param id
function dks_input_get_selected(argument0) 
{
 if (argument0.cursor_pos != argument0.cursor_pos2)
	{
	 var minpos, maxpos;
	 minpos = min(cursor_pos, cursor_pos2);
	 maxpos = max(cursor_pos, cursor_pos2);
	 return string_copy(text, minpos+1, maxpos-minpos);
	}
	else return "";
}