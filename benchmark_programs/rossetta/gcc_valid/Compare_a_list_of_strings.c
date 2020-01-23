#include <stdio.h>
#include <string.h>

int strings_are_equal(char * * strings, int nstrings)
{
  int result = 1;
  
  while (result && (--nstrings > 0))
  {
    result = !strcmp(*strings, *(strings+nstrings));
  }

  return result;
}

int strings_are_in_ascending_order(char * * strings, int nstrings)
{
  int result = 1;
  int k = 0;
  
  while (result && (++k < nstrings))
  {
    result = (0 >= strcmp(*(strings+k-1), *(strings+k)));
  }

  return result;
}