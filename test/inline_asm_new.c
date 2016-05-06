int sum(int x, int y) {
	int ret;
	__asm__ ( "addl %%ebx, %%eax;"
	        : "=a" (ret)
	        : "a" (x), "b" (y) );
	return ret;
}

int main() {
  	int arg1, arg2, add ;
  	// arg1 = 6;
  	// arg2 = 1;
	add = sum(arg1, arg2);
	// printf("%d\n", add);
	return 0;
} 
