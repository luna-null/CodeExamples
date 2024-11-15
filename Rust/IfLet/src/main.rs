mod coin;

fn main()
{
    let config_max = Some(3u8);
    if let Some(max) = config_max {
        println!(
            "The maximum is configured to be {max}"
        );
    }

    let mut count = 0;
    let coin = coin::Coin::Quarter(coin::UsState::Wyoming);
    if let coin::Coin::Quarter(state) = coin {
        println!(
            "State quarter from {state:?}!"
        );
    } else {
        count += 1;
    }
}
