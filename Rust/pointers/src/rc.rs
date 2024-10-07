//! # RC<T> 
//! The Rc<T> type keeps track of the number of references 
//! to data on the heap so that data can have multiple owners.
/// # Example Data Structure:
///     c       b
///     |       |
///     |       |
///     V       V
///    |4|  a  |3|
///    |-|  |  |-|
///    |_|  |  |_|
///     |   |   |
///     |   |   |
///     ---------
///         |
///         V
///        |5|
///        |-|
///        |_|
///         |
///         |
///         V
///        |10|
///        |--|
///        |__|
///         |
///         |
///         V
///        -----
///        |Nil|
///        -----

use crate::rc::List::{Cons, Nil};
use std::{ rc::Rc, cell::RefCell };

#[derive(Debug)]
enum List {
    Cons(Rc<RefCell<i32>>, Rc<List>),
    Nil,
}

pub fn rc() {
    let value = Rc::new(RefCell::new(5));
    let a = Rc::new(Cons(
            Rc::clone(&value), 
            Rc::new(Nil)
    ));
    let b = Cons(
        Rc::new(RefCell::new(3)), 
        Rc::clone(&a)
    );
    let c = Cons(
        Rc::new(RefCell::new(4)), 
        Rc::clone(&a)
    );

    *value.borrow_mut() += 10;

    println!("a after = {a:?}");
    println!("b after = {b:?}");
    println!("c after = {c:?}");

}
