/// @description Mix Spine animation
function dks_spine_animation_mix() {
	var l = ds_list_create();
	skeleton_animation_list(sprite_index, l);
	var s = ds_list_size(l);
	var j,i;
	for ( i =0; i<s;i++)
	{
	 for ( j =0;j<s;j++)
	 {
	  skeleton_animation_mix(l[| i], l[| j], 0.2);
	 }
	}
	ds_list_destroy(l);


 
 



}
