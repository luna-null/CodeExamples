mod threads;
mod channels;
mod mutex;

fn main()
{
    println!("\n----------------\n");

    println!("\n\n1. From threads:\n");
    threads::threads();

    println!("\n\n2. From threads:\n");
    channels::channels();

    println!("\n\n3. From mutex:\n");
    mutex::mutex();

}
