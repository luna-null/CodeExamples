pub use my_crate::art::{kinds::PrimaryColor, utils::mix};

fn main() {
    let red = PrimaryColor::Red;
    let yellow = PrimaryColor::Yellow;
    mix(red, yellow);
}
