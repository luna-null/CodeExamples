use std::{error::Error, fs::File, net::IpAddr};

mod file_error;
mod username_error;

fn main() -> Result<(), Box<dyn Error>>
{
    // file_error::file_error();
    
    let home: IpAddr = "127.0.01"
        .parse()
        .expect("Hardcoded IP address should be valid");

    let greeting_file = File::open("hello.txt")?;

    Ok(())


}

fn last_char_of_first_line(text: &str) -> Option<char> {
    text.lines().next()?.chars().last()
}
