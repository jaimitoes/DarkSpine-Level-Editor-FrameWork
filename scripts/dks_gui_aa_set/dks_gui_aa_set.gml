function dks_gui_aa_set() 
{
 if(a_a != 8)
	{
	 a_a += 2;
	 display_reset(a_a,vsync);
	 dks_message("Anti-aliasing set to X-"+string(a_a));
	}
	else
	{
	 a_a = 0;
	 display_reset(0,vsync);
	 dks_message("Anti-aliasing disabled");
	}
}