event_inherited();
var ob = -4, s,i;
if is_array(variables)
{
 s = array_length(variables);
 for(i = 0; i<s; i++)
 {
  ob = asset_get_index(variables[i]);
  instance_activate_object(ob);
  instance_destroy(ob);
 }
}

