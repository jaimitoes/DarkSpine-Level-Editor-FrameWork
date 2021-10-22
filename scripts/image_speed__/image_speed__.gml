/// @description  image_speed__(value,instance)
/// @param value
/// @param instance
function image_speed__() {

	if (argument_count == 1)
	{
	    return argument[0].image_speed;
	}

	argument[1].image_speed = argument[0];





}
