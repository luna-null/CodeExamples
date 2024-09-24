mod front_of_house
{
    pub mod hosting
    {
        pub fn add_to_waitlist() {}

        pub fn seat_at_table() {}
    }

    pub mod serving
    {
        pub fn take_order() {}

        pub fn serve_order() {}

        pub fn take_payment() {}

        pub fn deliver_order() {}
    }
}

pub mod back_of_house
{
    pub enum Appetizer
    {
        Soup,
        Salad,
    }
    pub struct Breakfast
    {
        pub toast: String,
        seasonal_fruit: String,
    }
    impl Breakfast
    {
        pub fn summer(toast: &str) -> Breakfast
        {
            Breakfast {
                toast: String::from(toast),
                seasonal_fruit: String::from("peaches"),
            }
        }
    }
    fn fix_incorrect_order()
    {
        cook_order();
        super::front_of_house::serving::deliver_order();
    }

    fn cook_order() {}
}


mod customer
{
    // 'use' must be declared in the same namespace/module
    use crate::back_of_house;

    pub fn eat_at_restaurant()
    {
        pub use crate::front_of_house::hosting;
        hosting::add_to_waitlist();

        // Order a breakfast in the summer with Rye toast
        // 'super' is like '..' in path directories
        let mut meal = super::back_of_house::Breakfast::summer("Rye");
        // Change our mind about what bread we'd like
        meal.toast = String::from("Wheat");
        println!("I'd like {} toast please", meal.toast);

        // The next line won't compile if we uncomment it; we're not allowed
        // to see or modify the seasonal fruit that comes with the meal
        // meal.seasonal_fruit = String::from("blueberries");

        let order1 = back_of_house::Appetizer::Soup;
        let order2 = back_of_house::Appetizer::Salad;
    }
}
