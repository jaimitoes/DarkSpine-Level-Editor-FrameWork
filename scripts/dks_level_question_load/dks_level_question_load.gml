function dks_level_question_load() 
{
	var level = text_response2;
	level_name = level;
	dks_work_load(level_folder, level);
	target = noone;
	x = room_width/2;
	y = room_height/2;
	with (obj_cam_editor)
	{
	 view_xoffset = other.x;
	 view_yoffset = other.y;
	 TweenFire(id,EaseInOutSine ,TWEEN_MODE_ONCE, 0,0, 60,"x",x, other.x);
	 TweenFire(id,EaseInOutSine ,TWEEN_MODE_ONCE, 0,0, 60,"y",y, other.y);
	}

	dks_message("The level "+level+" has been loaded");
}