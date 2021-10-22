///dks_matrix_transpose(Matrix)
function dks_matrix_transpose(argument0) 
{
 var src = argument0, dst;
	/*
	//original
	src = [src[0], src[1], src[2],  src[3],
	       src[4], src[5], src[6],  src[7],
		   src[8], src[9], src[10], src[11],
		   src[12],src[13],src[14], src[15]];
	*/

	dst = [src[0], src[4], src[8],  src[12],
	       src[1], src[5], src[9],  src[13],
		      src[2], src[6], src[10], src[14],
		      src[3], src[7], src[11], src[15]];
		      return dst;
}