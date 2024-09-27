use std::fmt::Display;

pub struct NewsArticle
{
    pub headline: String,
    pub location: String,
    pub author: String,
    pub content: String,
}

impl Summary for NewsArticle
{
    // fn summarize(&self) -> String
    // {
    //     format!("{}, by {} ({})", self.headline, self.author, self.location)
    // }
}

pub struct Tweet
{
    pub username: String,
    pub content: String,
    pub reply: bool,
    pub retweet: bool,
}

impl Summary for Tweet
{
    fn summarize(&self) -> String
    {
        format!("{}: {}", self.username, self.content)
    }
}

pub trait Summary
{
    fn summarize(&self) -> String
    {
        String::from("(Read more...)")
    }
}

// Generic <T> forces only one type for both
pub fn notify<T: Summary + Display>(item1: &T, item2: &T)
{
    println!(
        "Breaking news!\n{}\n{}",
        item1.summarize(),
        item2.summarize(),
    );
}

// // where clause
// fn some_function<T, U>(t: &T, u: &U) -> i32
// where
//     T: Display + Clone,
//     U: Clone + Debug,
// {}

// // returns a type that implements Summary
// fn returns_summarizable(switch: bool) -> impl Summary {
//     if switch {
//         NewsArticle {
//             headline: String::from(
//                           "Penguins win the Stanley Cup Championship!"
//             ),
//             location: String::from("Pittsburgh, PA, USA"),
//             author: Sting::from("Iceburgh"),
//             content: String::from(
//                 "The Pittsburgh Penguins once again are the \
//                 best hockey team in the NHL.",
//             ),
//         }
//     } else {
//         Tweet {
//             username: String::from("horse_ebooks"),
//             content: String::from(
//                 "of course, as you probably already know, people",
//             ),
//             reply: false,
//             retweet: false,
//         }
//     }
// }

struct Pair<T>
{
    x: T,
    y: T,
}

impl<T> Pair<T>
{
    fn new(x: T, y: T) -> Self
    {
        Self { x, y }
    }
}

impl<T: Display + PartialOrd> Pair<T>
{
    fn cmp_display(&self)
    {
        if self.x >= self.y {
            println!("The largest number is x = {}", self.x);
        } else {
            println!("The largest member is y = {}", self.y);
        }
    }
}

// // Snippet of ToString trait for Display
// impl<T: Display> ToString for T {}
