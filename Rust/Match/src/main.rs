#[derive(Debug)] // so we can inspect the state
enum UsState 
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

enum Coin 
{
    Penny,
    Nickel,
    Dime,
    Quarter(UsState),
}

fn value_in_cents(coin: Coin) -> u8
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
fn plus_one(x: Option<i32>) -> Option<i32> 
{
    match x {
        None    => None,
        Some(i) => Some(i + 1),
    }
}

fn print_opt(x: Option<i32>)
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

fn main()
{
    let x = Coin::Quarter(UsState::NewYork);

    println!("I have {} cents in my pocket.", value_in_cents(x));

    let five = Some(5);
    let six  = plus_one(five);
    let none = plus_one(None);

    println!("I *might* have {}", six.as_slice()[0]);

    print_opt(none);
    print_opt(six);

    let dice_roll = 9;
    match dice_roll {
        3 => add_fancy_hat(),
        7 => remove_fancy_hat(),
        _ => reroll(),
    }
    fn add_fancy_hat() {}
    fn remove_fancy_hat() {}
    fn reroll() {}



}

