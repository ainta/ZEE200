#include <stdarg.h>
#include <stdio.h>
 
int va_sum(int* a,...);
 
int main()
{
        int number = 1;
 
        int foo = 0;
 
        foo = va_sum(&number,2,3,4,5,0);
 
        return foo;
}
 
 
int va_sum(int* a,...)
{
        int counter = 0;
        int element = 0;
 
        va_list arg;
 
        va_start(arg,a);
 
        while((element = va_arg(arg,int)) != 0)
        {
			counter += element;
        }  
        va_end(arg);
 
        return counter;
}
