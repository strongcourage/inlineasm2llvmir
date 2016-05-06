int main() {
  	long int arg1 = 1;
  	long int arg2 = 2;
  	long int ret = 0;
	__asm__ ( "addl %%ebx, %%eax;"
	        : "=a" (ret)
	        : "a" (arg1), "b" (arg2) );
	return 0;
} 
