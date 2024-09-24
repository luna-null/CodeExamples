#[derive(Debug)] // so we can inspect the state
pub enum UsState 
{
    Alabama,
    Alaska,
    Arizona,
    Arkansas,
    California,
    Colorado,
    Connecticut,
    Delaware,
    Florida,
    Georgia,
    Hawaii,
    Idaho,
    Illinois,
    Indiana,
    Iowa,
    Kansas,
    Kentucky,
    Louisiana,
    Maine,
    Maryland,
    Massachusetts,
    Michigan,
    Minnesota,
    Mississippi,
    Missouri,
    Montana,
    Nebraska,
    Nevada,
    NewHampshire,
    NewJersey,
    NewMexico,
    NewYork,
    NorthCarolina,
    NorthDakota,
    Ohio,
    Oklahoma,
    Oregon,
    Pennsylvania,
    RhodeIsland,
    SouthCarolina,
    SouthDakota,
    Tennessee,
    Texas,
    Utah,
    Vermont,
    Virginia,
    Washington,
    WestVirginia,
    Wisconsin,
    Wyoming,
}

pub enum Coin 
{
    Penny,
    Nickel,
    Dime,
    Quarter(UsState),
}

pub fn value_in_cents(coin: Coin) -> u8
{
    match coin {
        Coin::Penny             => {
            println!("Lucky penny!");
            01
        }
        Coin::Nickel            => 05,
        Coin::Dime              => 10,
        Coin::Quarter(state)    => {
            println!("State quarter from {state:?}");
            25
        }
    }
}
pub fn plus_one(x: Option<i32>) -> Option<i32> 
{
    match x {
        None    => None,
        Some(i) => Some(i + 1),
    }
}

pub fn print_opt(x: Option<i32>)
{
    match x {
        None    => {
            println!("There's nothing there...");
        }
        Some(a) => {
            println!("There's a {} here!", a);
        }
    };
}

