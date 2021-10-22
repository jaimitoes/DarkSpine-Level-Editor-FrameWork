/// @description dks_sprite_set(sprite,image index)
/// @param sprite
/// @param image index
function dks_sprite_set(argument0, argument1) 
{
 sprite_index = argument0;
	image_index = argument1;
	is_spine = dks_spine_check();
	switch(modo)
	{
	 case mode.edit: 
	 with(target)
	 {
	  sprite_index = argument0;
	  image_index = argument1;
	  is_spine = other.is_spine;
	  dks_set_offset(id, global.mouse_xd, global.mouse_yd);
	 }
  var name = object_get_name(target)
	 if (name = "obj_particle_system")
	 {
	  dks_particle_setter_update(target);
	 }
	 break;
	 case mode.polygon:
		if (!is_spine)
	 {
	  switch(menu_setters)
	  {
	   case setter.sprite: 
	   with(target)
	   {
					sprite_index = argument0;
					image_index = argument1;
	    if (sprite_index = spr_icon_object)
	    {
	     vertex_texture = -1;
	    }
	    else
	    {
	     vertex_texture = sprite_index;
	    } 
					fill_image = image_index;
     if(draw_method = dks_draw_2D)
					{
						draw_method = dks_draw_vertex;
					}
	    dks_vertex_shape_create();
	   } 
	   break;
	   case setter.sprite_path: 
	   with(target)
	   {
					sprite_index = argument0;
					image_index = argument1;
	    if (sprite_index = spr_icon_object)
	    {
	     path_texture = spr_cam;
						path_image = 0;
					}
					else
					{
						path_texture = sprite_index;
						path_image = image_index;
					}
     
					
					if(draw_method = dks_draw_2D)
					{
						draw_method = dks_draw_vertex;
					}
	     dks_vertex_terrain_create();
	    }
	   break;
	  }
	 }   
	 else
	 {
	  dks_message(" Warning! : Spine detected. It´s not a valid texture! choose a 3d texture");
	 }
	 break;
	}
	menu_setters = setter.closed;
}