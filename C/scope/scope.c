#include <stdio.h>
#include <stdlib.h>
int main()
{
    char* y;
    {
        char x[] = "this is x";
        y = &x;

    }
    printf("%s", y);
    return 0;
}
