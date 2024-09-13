class GuessingGame
{
	public static int maxTries = 10;
	public enum comparison
	{
		LESS,
		EQUAL,
		GREATER
	};

	public static void main(String[] args)
	{
		Scanner reader = new Scanner(System.in);
		
		System.out.println("Choose a maximum possible value: ");
		int max = reader.nextInt();

		Random rand = new Random();
		int value = rand.nextInt(1,max);

		for (int i = 0; i < maxTries; i++) 
		{
			String str = String.format("Pick a number between 1 and %d", max);
			System.out.println(str);
			int guess = reader.nextInt();
			try {
				comparison test = testGuess(guess, value);
				switch (test) 
				{
					case LESS:
						System.out.println("Too low!");
						break;

					case GREATER:
						System.out.println("Too high!");
						break;

					case EQUAL:
						System.out.println("You win!");
						return;
					default:
						throw new Exception("ERROR 2");
				}
			}
			catch (Exception e) {
				System.err.println("ERROR 1" + e.getMessage());
			}
		}

		reader.close();

		System.out.println("You lose! Exceeded number of tries!");
		return;
	}
	public static comparison testGuess(int guess, int value) throws Exception
	{
		if (guess < value) {
			return comparison.LESS;
		}
		else if (guess > value) {
			return comparison.GREATER;
		}
		else if (guess == value) {
			return comparison.EQUAL;
		}
		throw new Exception("Unknown comparison obtained");
	}
}
