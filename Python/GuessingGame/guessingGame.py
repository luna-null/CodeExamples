import random


def testGuess(guess: int, actual: int) -> int:

    if (actual > guess):
        return -1
    elif (actual < guess):
        return 1
    else:
        return 0


def main() -> int:
    max = int(input("Choose max from 1: "))
    actual = random.randint(1, max)

    maxTries = 10
    tries = 0
    while (tries <= maxTries):
        guess = int(input("Pick a number "))
        status = testGuess(guess, actual)
        match status:
            case 1:
                print("You guessed High!")
                tries += 1
            case -1:
                print("You guessed Low!")
                tries += 1
            case 0:
                print("You win!")
                return 0
    print("You Lost! Max number of tries exceeded!")
    return 1

if __name__ == "__main__":
    main()
