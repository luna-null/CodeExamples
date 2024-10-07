use hello_macro::HelloMacro;
use hello_macro_derive::HelloMacro;

#[derive(HelloMacro)]
struct Pancakes;

pub fn pancakes() {
    Pancakes::hello_macro();
}
