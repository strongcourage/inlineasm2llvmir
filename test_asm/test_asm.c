// #include <stdio.h>
long int func7(long int p1, long int p2)
{
	long int out;
	long int sum = p1 + p2;
	long int minus = p1 - p2;
	asm ("add %%rsi, %%rdi\n\t"
		 "mov %%rdi, %%rax\n\t"
		: "=r" (out) : "r" (sum), "r" (minus) : "cc");
	return out;
}

// int main() {
// 	return 0;
// }