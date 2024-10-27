use std::env;

fn main()
{
    println!("{:?}", env::var("OUT_DIR"));
}
