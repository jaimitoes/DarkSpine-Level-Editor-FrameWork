function dks_blend_mode_set() 
{
	with(target)
	{
	 switch(blend_mode)
	 {
	  case bm_normal : blend_mode = bm_add;
	  dks_input_set_text(other.input_list[| 12],"Bm add");
	  break;
	  case bm_add : blend_mode = bm_subtract;
	  dks_input_set_text(other.input_list[| 12],"Bm subtract");
	  break;
	  case bm_subtract: blend_mode = bm_max;
	  dks_input_set_text(other.input_list[| 12],"Bm max");
	  break;
	  case bm_max: blend_mode = bm_normal;
	  dks_input_set_text(other.input_list[| 12],"Bm normal");
	  break;
	 }
	}
}