/// @description dks_upgrade_1_838(map)
/// @param map
function dks_upgrade_1_838(argument0) {
	//Update tween data sequences adding CallStop scripts
	var m = argument0;
	var total_inst = m[? "objects"];
	if(total_inst >0)
	{
	 for (var i = 0;i<total_inst;i++)
	 {
	   var seq = "ob"+string(i)+"sequence"; 
	   if ds_map_exists(m, seq)
	   {
	    for (var j = 0; j<m[? seq]; j++)
		{
	     var val = m[? "ob"+string(i)+"tweenD"+string(j)];
		 val[| 5] = "null";
		} 
	   }
	 }
	}
}
