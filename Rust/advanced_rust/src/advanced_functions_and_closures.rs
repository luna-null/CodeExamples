use std::ops::Deref;



fn add_one(x:i32) -> i32 
{
    x + 1
}

fn do_twice(f: fn(i32) -> i32, arg: i32) -> i32
{
    f(arg) + f(arg)
}

#[derive(Debug)]
enum Status {
    Value(u32),
    Stop,
}

impl Status {
    /// Returns `true` if the status is [`Value`].
    ///
    /// [`Value`]: Status::Value
    #[must_use]
    fn _is_value(&self) -> bool {
        matches!(self, Self::Value(..))
    }

}

impl Default for Status {
    fn default() -> Self {
        Self::Stop
    }
}

fn returns_closure() -> Box<dyn Fn(i32) -> i32>
{
    Box::new(|x| x + 1)
}

pub fn advanced_functions_and_closures()
{
    let answer = do_twice(add_one, 5);

    println!("The answer is: {answer}");

    let list_of_numbers = vec![1,2,3];
    let list_of_strings: Vec<String> =
        list_of_numbers.iter().map(|i| i.to_string()).collect();
    let list_of_strings2: Vec<String> =
        list_of_numbers.iter().map(ToString::to_string).collect();

    let list_of_statuses: Vec<Status> = (0u32..20).map(Status::Value).collect();

    let f = returns_closure();
    let y = f(1);

    println!("list_of_strings: {list_of_strings:?}\nlist_of_strings2: {list_of_strings2:?}list_of_numbers: {list_of_numbers:?}\nlist_of_statuses: {list_of_statuses:?}\ny: {y}");
}
