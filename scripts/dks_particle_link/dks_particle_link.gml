/// @description dks_particle_link(particle_system, part)
/// @param particle_system
/// @param  part
function dks_particle_link(argument0, argument1) 
{
	var ptn = array_length(argument1);
	if(object_index = obj_particle_system)
	{
 
	 for (var i = 0; i<ptn; i++)
	 {
	  part_type_destroy(argument1[i]);
	 }
	 argument1 = 0;
	 argument1[0] = part_type_create();
	 dks_particle_set(argument0, argument1[0], sprite_index, image_xscale, image_yscale, dk_part);
	 dks_emitter_set (argument0, ps_emitter, argument1[0], dk_part);
	 ptn = 1;

	if(parent)
	{
	 var s = array_length(child);
	 for (var i =0; i<s; i++)
	 {
	  if is_array(child[i].dk_part)
	  {
	   argument1[ptn] = part_type_create();
	   dks_particle_set(argument0,argument1[ptn],child[i].sprite_index,child[i].image_xscale,child[i].image_yscale,child[i].dk_part);
	   if(child[i].dk_part[32])
	   {
	    part_type_step(argument1[0], child[i].dk_part[31], argument1[ptn]);
	   } 
	   if(child[i].dk_part[33])
	   {
	    part_type_death(argument1[0],child[i].dk_part[31], argument1[ptn]);
	   }
	   ptn+=1;
	   with(child[i])
	   {
	    if (parent)
	    {
	     dks_particle_link(argument0,argument1);
	    }
	   }
	  }
	 } 
	}
	}
	else
	{
	 var s = array_length(child);
	 for (var i =0; i<s; i++)
	 {
	  if is_array(child[i].dk_part)
	  {
	   argument1[ptn] = part_type_create();
	   dks_particle_set(argument0,argument1[ptn],child[i].sprite_index,child[i].image_xscale,child[i].image_yscale,child[i].dk_part);
	   if(child[i].dk_part[32])
	   {
	    part_type_step(argument1[ptn-1], child[i].dk_part[31], argument1[ptn]);
	   } 
	   if(child[i].dk_part[33])
	   {
	    part_type_death(argument1[ptn-1],child[i].dk_part[31], argument1[ptn]);
	   }
	   ptn+=1;
	   with(child[i])
	   {
	    if (parent)
	    {
	     dks_particle_link(argument0,argument1);
	    }
	   }
	  }
	 } 
	}
}