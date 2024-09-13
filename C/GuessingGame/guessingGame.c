#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int testGuess(int guess, int actual)
{
	if ( guess < actual) return -1;

	else if (guess > actual) return 1;

	else return 0;
}

int main(int argc, char** argv)
{
	int max;
	printf("Choose a max from 1: ");
	scanf("%d", &max);

	srand(time(NULL));
	int actual = rand() % (max);
	
	int maxTries  = 10;
	int tries = 0;
	while (tries <= maxTries)
	{
		printf("Pick a number between 1 and %d: ", max);
		int guess;
		scanf("%d", &guess);
		
		int status = testGuess(guess, actual);
		switch (status)
		{
			case -1:
				printf("Too Low!\n");
				tries++;
				break;
			case 1:
				printf("Too High!\n");
				tries++;
				break;
			case 0:
				printf("You guessed correct!\n");
				return 0;
		}
	}
	printf("You Lost! Exceeded number of tries!");
	return 0;
}
