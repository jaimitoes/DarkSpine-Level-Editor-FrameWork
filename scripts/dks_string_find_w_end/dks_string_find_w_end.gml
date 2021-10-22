/// @description dks_string_find_w_end(string, pos)
/// @param string
/// @param  pos
function dks_string_find_w_end(argument0, argument1) 
{
	var str= argument0, pos = argument1;
	if (string_copy(str, pos, 1) = " ")
	{
	 var apos, bpos;
	 apos = clamp(pos, 0, string_length(str));
	 bpos = apos;
	 while (string_copy(str, apos, 1) = " ") 
	 {
	  apos -= 1;
	  if (apos <= 0) break;
	 }
	 while (string_copy(str, bpos+1, 1) = " ") 
	 {
	  bpos += 1;
	  if (bpos >= string_length(str)) break;
	 }
 
	 var ary;
	 ary[0] = apos;
	 ary[1] = bpos;
	 return ary;
	}
	else
	{
	 if (string_copy(str, pos, 1) != string_lettersdigits(string_copy(str, pos, 1)))
	 {
	  var apos, bpos;
	  apos = clamp(pos, 0, string_length(str));
	  bpos = apos;
 
	  while (string_copy(str, apos, 1) != string_lettersdigits(string_copy(str, apos, 1))) 
	  {
	   apos -= 1;
	   if (apos <= 0) break;
	  }
	  while (string_copy(str, bpos+1, 1) != string_lettersdigits(string_copy(str, bpos+1, 1))) 
	  {
	   bpos += 1;
	   if (bpos >= string_length(str)) break;
	  }
	 var ary;
	  ary[0] = apos;
	  ary[1] = bpos;
	  return ary;
	 }
	 else
	 {
	  var apos, bpos;
	  apos = clamp(pos, 0, string_length(str));
	  bpos = apos;
 
	  while (string_copy(str, apos, 1) = string_lettersdigits(string_copy(str, apos, 1))) 
	  {
	   apos -= 1;
	   if (apos <= 0) break;
	  }
	  while (string_copy(str, bpos+1, 1) = string_lettersdigits(string_copy(str, bpos+1, 1))) 
	  {
	   bpos += 1;
	   if (bpos >= string_length(str)) break;
	  }

	  var ary;
	  ary[0] = apos;
	  ary[1] = bpos;
	  return ary;
	 }
	}
}