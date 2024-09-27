use std::fs::File;
use std::io::ErrorKind;

pub fn file_error()
{
    // //  This will panic due to buffer overread (reading a place in a vector that isn't defined in
    // //  the program)
    // // let v = vec![1, 2, 3];
    // // v[99];
    let greeting_file_result = File::open("hello.txt");
    let greeting_file = match greeting_file_result {
        Ok(file) => file,
        Err(error) => match error.kind() {
            ErrorKind::NotFound => match File::create("hello.txt") {
                Ok(fc) => fc,
                Err(e) => panic!("Problem creating the file: {e:?}"),
            },
            other_error => {
                panic!("Problem opening the file: {error:?}");
            }
        },
    };
    // Another way to do the same thing
    let greeting_file = File::open("hello.txt").unwrap_or_else(|error| {
        if error.kind() == ErrorKind::NotFound {
            File::create("hello.txt").unwrap_or_else(|error| {
                panic!("Problem creating the file: {error:?}");
            })
        } else {
            panic!("Problem opening the file: {error:?}");
        }
    });
    // yet another way with the '.expect' method
    let greeting_file = File::open("hello.txt")
        .expect("hello.txt should be included in this project");
}
