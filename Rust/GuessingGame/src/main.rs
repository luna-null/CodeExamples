use rand::Rng;
use std::io;

fn main()
{
    println!("Pick a maximum number for the guesser: ");
    let mut max = String::new();
    io::stdin()
        .read_line(&mut max)
        .expect("Failed to read line");

    let max: i32 = match max.trim().parse()
    {
        Ok(num) => num,
        Err(_) =>
        {
            println!("Please enter a valid number!");
            return;
        }
    };
    let mut rng = rand::thread_rng();

    let actual: i32 = rng.gen_range(1..=max);
    for tries in 1..10 {
        match is_correct(actual, max)
        {
            -1 => println!("Too Low!"),
            0 =>
            {
                println!("You win!");
                return;
            }
            1 => println!("Too High!"),
            4 => println!("Error! Please guess a number!"),
            _ => println!("Error 12: What's even going on?"),
        }
    }
    println!("You lose! You used up all your tries!");
}

fn is_correct(actual: i32, max: i32) -> i32
{
    println!("Pick a number between 1 and {}: ", max);
    let mut guess = String::new();
    io::stdin()
        .read_line(&mut guess)
        .expect("Failed to read line");

    let guess: i32 = match guess.trim().parse()
    {
        Ok(num) => num,
        Err(_) =>
        {
            return 4;
        }
    };

    match guess.cmp(&actual)
    {
        std::cmp::Ordering::Less => return -1,
        std::cmp::Ordering::Equal => return 0,
        std::cmp::Ordering::Greater => return 1,
    }
}
