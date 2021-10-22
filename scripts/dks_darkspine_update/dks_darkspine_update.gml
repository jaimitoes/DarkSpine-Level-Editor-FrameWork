function dks_darkspine_update() 
{
	var dir;
	var count = 0;
	var directory = file_find_first(working_directory + "DarkSpine\\Levels\\*",fa_directory);
	while(directory !="")
	{
	 dir[count] = directory;
	 count+=1;
	 directory = file_find_next();
	}
	for(var i =0; i<count; i++)
	{
	 dks_darkspine_updater(dir[i]);
	} 
}