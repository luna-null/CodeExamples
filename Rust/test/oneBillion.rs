use std::time::Instant;

fn main() {
    let x: u64;
    let target: u64 = 1_000_000_000;

    let start = Instant::now(); // Start timing
    {
        x = (0..target).fold(0, |sum, _| sum+1);
    }
    let duration = start.elapsed(); // Calculate elapsed time

    println!("{}", x); // Print the final value of x
    println!("Time taken: {:?}", duration); // Print the duration
}

