use exercise2::exercise2;
use exercise3::exercise3;

mod hash_maps;
mod vectors;
mod strings;
mod exercise1;
mod exercise2;
pub mod exercise3;

fn main()
{
    vectors::vectors();
    strings::strings();
    hash_maps::hash_map();

    println!("\nExercise 1!\n");

    exercise1::exercise1();

    println!("\nExercise 2!\n");
    exercise2::exercise2();
    exercise3();

}
