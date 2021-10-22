/// @description dks_image_switch_next
function dks_image_switch_next() 
{
	if(is_spine)
	{
	 if(image_speed = 0)
	 {
	  var current_frame = skeleton_animation_get_frame(0);
	  skeleton_animation_set_frame(0,current_frame +2);
	 }
	 else
	 {
	  var l = ds_list_create();
	  skeleton_animation_list(sprite_index,l);
	  var a = skeleton_animation_get();
	  var s = ds_list_size(l);
	  for(var i =0; i<s;i++)
	  {
	   if(a = l[| i])
	   {
	    if (i != s-1)
	    {
	     image_index =0;
	     skeleton_animation_set(l[| i+1]);
	     break;
     
	    }
	    else
	    {
	     image_index =0;
	     skeleton_animation_set(l[| 0]);
	     break;
	    }
	   }
	  }
	  ds_list_destroy(l);
	 }
	}
	else
	{
	 for(var i =0;i<image_number;i++)
	 {
	  if (i = image_index)
	  {
	   if (i!= image_number-1)
	   {
	    image_index+=1;
					if(have_texture)
					{
						fill_image = image_index;
					}
					if(have_path_texture)
					{
						path_image = image_index;
					}
	    dks_vertex_check(id);
	    exit;
	   }
	   else
	   {
	    image_index = 0;
					if(have_texture)
					{
						fill_image = image_index;
					}
					if(have_path_texture)
					{
						path_image = image_index;
					}
	    dks_vertex_check(id);
	    exit;
	   }
	  }
	 }
	}
}