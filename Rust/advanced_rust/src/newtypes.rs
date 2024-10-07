use std::{fmt, io::Error, rc::Rc};

type Kilometers = i32;
type Thunk<'a> = Box<dyn Fn() + Send + 'a>;
type _Result<T> = std::result::Result<T, std::io::Error>;

fn _takes_long_type(f: Thunk) -> Thunk {f}

fn _returns_long_type(string: &str) -> Thunk {

    return Box::new(move || println!("{}",string));
}

pub trait _Write {
    fn write(&mut self, buf: &[u8]) -> _Result<usize>;
    fn flush(&mut self) -> _Result<()>;

    fn write_all(&mut self, buf: &[u8]) -> _Result<()>;
    fn write_fmt(&mut self, fmt: fmt::Arguments) -> _Result<()>;
}

fn _bar<T>(x: Option<T>) -> () {

    print!("hi");
    match x {
        Some(_a) => (),
        None =>   print!("hi"),

    }
    for _ in 1..10 {
        print!("hi");
        continue
    }
}

fn _generic1<T>(t: T) {
    let _ = t;
} /* == */ fn _generic2<T:Sized>(t: T) {
    let _ = t;
}
fn _generic3<T:?Sized>(t: &T) -> &T {t}


pub fn newtypes()
{
    let x: i32 = 5;
    let y: Kilometers = 5;

    println!("x + y = {}", x + y);

    let _f:Thunk = Box::new(|| println!("hi"));

    let s1: Box<str> = Box::from("Hello there");
    let s2: Rc<str> = Rc::from("Ah, General Kenobi!");
    let s3: &str = "You are a bold one";
    let _boxed: Box<dyn fmt::Display> = Box::new(
        s1.to_string() + &s2 + s3
    );

}

