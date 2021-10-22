/// @description dks_upgrade_0_837(map)
/// @param map
function dks_upgrade_0_837(argument0) {
	var m = argument0;
	var total_inst = m[? "objects"];
	if(total_inst >0)
	{
	 for (var i = 0;i<total_inst;i++)
	 {
	   var val = m[? "ob"+string(i)+"value"];
	   if (val[| 37] = "obj_vertex_light") or (val[| 37] = "obj_vertex_light_ext")
	   {
	    var pl = m[? "ob"+string(i)+"poly_list"];
	    var b1 = m[? "ob"+string(i)+"bezier1"];
	    var b2 = m[? "ob"+string(i)+"bezier2"];
	    var s = ds_list_size(pl);
	    for(var j = 0; j<s; j++)
	    {
	     b1[| j] = pl[| j];
	     b2[| j] = pl[| j];
	    }
	   }
	 }
	}




}
