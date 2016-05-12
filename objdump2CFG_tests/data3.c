#include <stdio.h>

static char s[] = "This is a test.";
char *p;

int main()
{
    char dest[10];
    int k = 0;
    int i;

    p = dest;

    for (i = 0; i < 9; i++) {
        *p++ = s[k];

        k = (k + 17) % ((sizeof s) - 1);
    }
    dest[9] = 0;

    printf("%s\n", dest);

    return 0;
}
