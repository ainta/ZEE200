#include <stdlib.h>

int main () {
   int *str;

   /* Initial memory allocation */
   str = (int *) malloc(15);
   str[0] = 0;
   str[1] = 1;
   str[2] = 2;
   free(str);
   
   return(str[2]);
}
