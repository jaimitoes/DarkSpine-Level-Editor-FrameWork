function dks_editor_scale_destroy() 
{
	if instance_exists(obj_scale)
	{
	 with (obj_scale)
	 {
	  instance_destroy();
	 }
	 with (obj_deco_creator)
	 {
	  scale_slider = noone;
	  obj_scale_created =0;
	 }
	}
}