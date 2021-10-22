/// Executing a create end event
if is_array(variables)// While you set variables from the editor
{
 // Get the variables data from the editor
 dks_array_update(val,variables);
 // set the new values to your custom variables
 blend1 = real(val[0]);
 blend2 = real(val[1]);
 // The number of times we draw our object
 rep = real(val[2]);
}


