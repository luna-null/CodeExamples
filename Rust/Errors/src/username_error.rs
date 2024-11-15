use std::fs::{self, File};
use std::io::{self, Read};

pub fn read_username_from_file() -> Result<String, io::Error> {
    // let username_file_result = File::open("hello.txt");
    //
    // let mut username_file = match username_file_result {
    //     Ok(file) => file,
    //     Err(e)   => return Err(e),
    // };
    // let mut username = String::new();
    //
    // match username_file.read_to_string(&mut username) {
    //     Ok(_) => Ok(username),
    //     Err(e) => Err(e)
    // }

    // // Same functionality, but with ? operator for error 
    // propagating
    // let mut username_file = File::open("hello.txt")?;
    // let mut username = String::new();
    // username_file.read_to_string(&mut username)?;
    // Ok(username)
    
    // // Same functionality, but even shorter
    // let mut username = String::new();
    // File::open("hello.txt")?.read_to_string(&mut username)?;
    //
    // Ok(username)

    // // EVEN shorter
    fs::read_to_string("hello.txt")

}
