/// @description dks_input_delete_selected(id)
/// @param id
function dks_input_delete_selected(argument0) 
{
	with (argument0)
	{
	 if (cursor_pos != cursor_pos2)
	 {
	  var minpos, maxpos;
	  minpos = min(cursor_pos, cursor_pos2);
	  maxpos = max(cursor_pos, cursor_pos2);
	  text = string_delete(text, minpos+1, maxpos-minpos);
	  cursor_pos = minpos;
	  cursor_pos2 = minpos;
	 }
	}
}