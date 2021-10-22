function dks_check_deco_prop() 
{
	dks_destroy_tools();
	with(obj_deco)
	{
	 if (!have_polygon)
	 {
	  if (ds_exists(poly_list, ds_type_list))
	  {
	   ds_list_destroy(poly_list);
				poly_list = -1;
	  }
	 } 
	}      
}