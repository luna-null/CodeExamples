use std::{{self, collections::*}, io::{self, Write }};
use crate::garden::vegetables::Asparagus;

pub mod front_of_house;
pub mod garden;


fn main()
{
    let plant = Asparagus {};
    println!("i'm growing {plant:?} and {:?}!", front_of_house::hosting::seat_at_table());

    front_of_house::hosting::seat_at_table();


}
