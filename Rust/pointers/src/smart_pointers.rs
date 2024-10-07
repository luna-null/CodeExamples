use std::ops::Deref;
use crate::r#box;

struct MyBox<T>(T);
impl<T> MyBox<T>
{
    pub fn new(x: T) -> MyBox<T>
    {
        MyBox(x)
    }
}
impl<T> Deref for MyBox<T> 
{
    type Target = T;
    fn deref(&self) -> &Self::Target
    {
        &self.0
    }
}

fn hello(name: &str) {
    println!("Hello, {name}!");
}

pub fn smart_pointers()
{
    r#box::cons();
    let x = 5;
    let y = MyBox::new(x);
    assert_eq!(5, x);
    // assert_eq!(5, y);    // Not allowed
    assert_eq!(5, *y);

    let m = MyBox::new(String::from("Rust"));
    hello(&m);
    // or
    hello(&(*m)[..]);
}
