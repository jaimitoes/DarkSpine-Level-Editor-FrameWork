function dks_gui_vertex_set() 
{
	if (target.have_polygon)
	{
	 var w = window_get_width()/2;
	 var h = window_get_height()/2;
	 var st_wid = string_width(text_question[question.DeleteVertex][0] + "?");
	 dks_question(w-256,h-128,st_wid,256,dark_gray,yellow_pastel,yellow_pastel,dark_gray,text_question[question.DeleteVertex][0], "?");
	}
	else
	{
	 menu_setters = setter.vector;
	}
}