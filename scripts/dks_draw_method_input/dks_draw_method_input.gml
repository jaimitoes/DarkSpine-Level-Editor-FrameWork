function dks_draw_method_input() 
{
	var st_wid = string_width(text_question[question.DrawMethod][0]);
	dks_question_input(390,64,st_wid+128,256,dark_gray,orange_pastel,orange_pastel,dark_gray,text_question[question.DrawMethod][0], " name");
}