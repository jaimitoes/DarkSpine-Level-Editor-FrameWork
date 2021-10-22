function dks_spine_node_destroy() {
	if (instance_exists(obj_ffd))
	         {
	            with(obj_ffd)
	             {
	              instance_destroy();
	             }
	         }
         
	obj_deco_creator.ob_ffd = noone;
	obj_deco_creator.ffd_created =0;
        



}
