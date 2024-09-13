#include <stdio.h>
#include <stdlib.h>

int main()
{
	int* x = malloc(3 * sizeof(int));
	x[0] = 1;
	x[1] = 2;
	x[2] = 3;

	printf("%d, %d, %d, GO!", x[0], x[1], x[2]);
	free(x);
	return 0;
}
