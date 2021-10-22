function dks_draw_method_set() 
{
	with(target)
	{
	 var name = script_get_name(draw_method);
	 switch(name)
	 {
	  case "dks_draw_2D" : draw_method = dks_draw_3D;
	  dks_input_set_text(other.input_list[| 13],"Draw 3D");
	  break;
	  case "dks_draw_3D" : draw_method = dks_draw_vertex;
	  dks_input_set_text(other.input_list[| 13],"Draw Vertex");
	  break;
	  case "dks_draw_vertex" : draw_method = dks_null;
	  dks_input_set_text(other.input_list[| 13],"No draw");
	  break;
	  case "dks_null" : draw_method = dks_draw_2D;
	  dks_input_set_text(other.input_list[| 13],"Draw 2D");
	  break;
	  default: 
	  draw_method = dks_draw_2D;
  
	 }
	 name = script_get_name(draw_method);
	 dks_input_set_text(other.input_list[| 13],name);
	}
}