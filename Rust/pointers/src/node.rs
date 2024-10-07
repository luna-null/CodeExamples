use std::cell::RefCell;
use std::rc::{Rc, Weak};

#[derive(Debug)]
pub struct Node 
{
    value: i32,
    parent: RefCell<Weak<Node>>,
    children: RefCell<Vec<Rc<Node>>>,
}

pub fn node()
{
    let leaf = Rc::new(Node {
        value: 3,
        parent: RefCell::new(Weak::new()),
        children: RefCell::new(vec![]),
    });

    println!("leaf strong = {}, weak = {}", 
        Rc::strong_count(&leaf),
        Rc::weak_count(&leaf),
    );
    {
        let branch = Rc::new(Node {
            value : 5,
            parent: RefCell::new(Weak::new()),
            children: RefCell::new(vec![Rc::clone(&leaf)]),
        });

        *leaf.parent.borrow_mut() = Rc::downgrade(&branch);

        println!("branch strong = {}, weak = {}", 
            Rc::strong_count(&branch),
            Rc::weak_count(&branch),
        );
        println!("leaf strong = {}, weak = {}", 
            Rc::strong_count(&leaf),
            Rc::weak_count(&leaf),
        );
    }
    println!("leaf strong = {}, weak = {}", 
        Rc::strong_count(&leaf),
        Rc::weak_count(&leaf),
    );
}

