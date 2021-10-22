event_inherited();//Is a child of the Deco object
//Custom component particle example system
dks_particle_data_init();
// Default particle burst script method, as default is null so, you can store data but...
//...the object particle system does not spawn anything until you set a custom script from the editor.
burst_script = dks_null;
//Set the variables for the custom component/variables system, in this case, we only need a customized value...
//...this is an hybrid system between the particle editor and this customized variable combined with the USER EVENT 0 as a "create end event" in this case.
val[0] = burst_script;// "val" is my universal variable to link array data from the Default variable system used in the editor, linking the Deco variable called "variables"...
//...with the variable called "val" and giving us the skill to update in real time custom Deco settings, an approach of the software Unity does...

// Creating a particle system structure
ps_system = part_system_create();
// Creating the very first default particle to start an array structure
ps_part[0] = part_type_create();
// Creating a default emitter structure
ps_emitter = part_emitter_create(ps_system);

