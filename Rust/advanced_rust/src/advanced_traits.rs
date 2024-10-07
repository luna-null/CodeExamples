use std::{ops::{Add, Deref}, fmt};

pub trait Iterator
{
    type Item;

    fn next(&mut self) -> Option<Self::Item>;
}

impl Iterator for Counter
{
    type Item = u32;

    fn next(&mut self) -> Option<Self::Item>
    {
        // --snip--
        Some(self.number)
    }
}

pub struct Counter
{
    number: u32,
}

#[derive(Debug, Copy, Clone, PartialEq)]
struct Point
{
    x: i32,
    y: i32,
}

// definition of Add trait
// trait Add<Rhs=Self> { // Rhs = "right hand side"
//     type Output;
//
//     fn add(self, rhs: Rhs) -> Self::Output;
// }

impl Add for Point
{
    type Output = Point;

    fn add(self, other: Point) -> Point
    {
        Point {
            x: self.x + other.x,
            y: self.y + other.y,
        }
    }
}

struct Millimeters(u32);
struct Meters(u32);

impl Add<Meters> for Millimeters
{
    type Output = Millimeters;

    fn add(self, other: Meters) -> Millimeters
    {
        Millimeters(self.0 + (other.0 * 10000))
    }
}

trait Pilot
{
    fn fly(&self);
}
trait Wizard
{
    fn fly(&self);
}

struct Human;

impl Pilot for Human
{
    fn fly(&self)
    {
        println!("This is your captain speaking.");
    }
}

impl Wizard for Human
{
    fn fly(&self)
    {
        println!("Levitate and glide, oh winds, be my guide!");
    }
}

impl Human
{
    fn fly(&self)
    {
        println!("*waving arms furiously*");
    }
}

trait Animal
{
    fn baby_name() -> String;
}

struct Dog;

impl Dog
{
    fn baby_name() -> String
    {
        String::from("Spot")
    }
}

impl Animal for Dog
{
    fn baby_name() -> String
    {
        String::from("puppy")
    }
}

trait OutlinePrint: fmt::Display {
    fn outline_print(&self) {
        let output = self.to_string();
        let len = output.len();
        println!("{}", "*".repeat(len + 4));
        println!("*{}*", " ".repeat(len + 2));
        println!("* {output} *");
        println!("*{}*", " ".repeat(len + 2));
        println!("{}", "*".repeat(len + 4));
    }
}

impl fmt::Display for Point {
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
        write!(f, "({}, {})", self.x, self.y)
    }
}

impl OutlinePrint for Point {}

struct Wrapper<T>(T);
impl fmt::Display for Wrapper<Vec<String>>
{
fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
    write!(f, "[{}]", self.0.join(", "))
}
}

impl<T> Deref for Wrapper<T> {
    type Target = T;
    fn deref(&self) -> &Self::Target {
        &self.0
    }
}


pub fn advanced_traits()
{
    assert_eq!(
        Point { x: 1, y: 0 } + Point { x: 2, y: 3 },
        Point { x: 3, y: 3 }
    );

    let person = Human;
    Pilot::fly(&person);
    Wizard::fly(&person);
    person.fly();

    println!("A baby dog is called a {}", <Dog as Animal>::baby_name());

    let w = Wrapper(vec![String::from("hello"), String::from("world")]);
    println!("w = {:?}", *w);
}
