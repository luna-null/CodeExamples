//! # Box Type
//! The Box<T> type has a known size and points to data 
//! allocated on the heap. 

#[derive(Debug)]
enum List
{
    Cons(i32, Box<List>),
    Nil,
}

pub fn cons()
{
    let list = List::Cons(
        1, Box::new(
            List::Cons(
                2, Box::new(
                    List::Cons(
                        3, Box::new(
                            List::Nil
                        )
                    )
                )
            )
        )
    );
    let b = Box::new(5);
    println!("b = {b}");
    println!("list = {:?}", list)
}
