/// # Here is a recap of the reasons to choose
/// # Box<T>, Rc<T>, or RefCell<T>:
///
///     -   Rc<T> enables multiple owners of the same data;
///         Box<T> and RefCell<T> have single owners.
///
///     -   Box<T> allows immutable or mutable borrows
///         checked at compile time; Rc<T> allows only
///         immutable borrows checked at compile time;
///         RefCell<T> allows immutable or mutable borrows
///         checked at runtime.
///
///     -   Because RefCell<T> allows mutable borrows
///         checked at runtime, you can mutate the value
///         inside the RefCell<T> even when the RefCell<T>
///         is immutable.
mod smart_pointers;
mod drop;
mod r#box;
mod rc;
mod ref_cycles;
mod node;

fn main() {
    println!("\n---------------------\n");

    println!("1. From smart_pointers:\n");
    smart_pointers::smart_pointers();

    println!("\n\n2. From drop:\n");
    drop::run_drop();

    println!("\n\n3. From rc:\n");
    rc::rc();

    println!("\n\n4. From ref_cycles:\n");
    ref_cycles::ref_cycles();

    println!("\n\n5. From node:\n");
    node::node();

    println!("\n---------------------\n");

}
