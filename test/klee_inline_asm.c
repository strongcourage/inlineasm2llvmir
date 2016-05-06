int main() {
  	int arg1, arg2, add ;
	__asm__ ( "addl %%ebx, %%eax;"
	        : "=a" (add)
	        : "a" (arg1), "b" (arg2) );

	return 0;
} 
