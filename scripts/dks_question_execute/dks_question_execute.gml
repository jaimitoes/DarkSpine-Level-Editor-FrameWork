function dks_question_execute() 
{
	//dks_question_execute
	text_response1 = obj_question.string1;
	text_response2 = obj_question.string2;

	if (obj_question.input!=noone)
	{
	 text_input = dks_input_get_text(obj_question.input);
	}
	with(obj_question)
	{
	 instance_destroy();
	}

	var s = array_length(text_question);

	for (var i =0; i<s; i++)
	{
	 if (text_response1 = text_question[i][0])
	 {
	  script_execute(text_question[i][1]);break;
	 }
	}
}