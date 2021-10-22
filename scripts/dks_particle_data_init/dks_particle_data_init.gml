// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function dks_particle_data_init()
{
	if !is_array(dk_part)
	{
 //sprite settings
	    dk_part[0] = 0;
	    dk_part[1] = 0;
	    dk_part[2] = 0;
	    /// size settings
	    dk_part[3] = 1;
	    dk_part[4] = 1;
	    dk_part[5] = 0;
	    dk_part[6] = 0;
	    ///color3
	    dk_part[7] = c_white;
	    dk_part[8] = c_white;
	    dk_part[9] = c_white;
	    ///alpha3
	    dk_part[10] = 0.5;
	    dk_part[11] = 1;
	    dk_part[12] = 0;
	    ///speed
	    dk_part[13] = 0;
	    dk_part[14] = 0;
	    dk_part[15] = 0;
	    dk_part[16] = 0;
	    ///direction
	    dk_part[17] = 0;
	    dk_part[18] = 90;
	    dk_part[19] = 0;
	    dk_part[20] = 0;
	    ///gravity
	    dk_part[21] = 0.20;
	    dk_part[22] = 90;
	    ///orientation
	    dk_part[23] =  0;
	    dk_part[24] = 0;
	    dk_part[25] = 0;
	    dk_part[26] = 0;
	    dk_part[27] = 0;
	    ///blend
	    dk_part[28] = 1;
	    ///life
	    dk_part[29] = 10;
	    dk_part[30] = 30;
	    ///num
	    dk_part[31] = 1;
	    //if is child add particles on step
	    dk_part[32] = 0;
	    //if is child add particles when is dead
	    dk_part[33] = 0;
	    //If is emitter and the emitter type
	    dk_part[34] = 0;
	    dk_part[35] = 0;
	    dk_part[36] = 0;
	    //emitter region
	    dk_part[37] = x-100;
	    dk_part[38] = y-100;
	    dk_part[39] = x+100;
	    dk_part[40] = y+100;
	}			
}