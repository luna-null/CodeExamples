use std::mem::drop;

pub struct CustomSmartPointer 
{
    data: String,
}

impl Drop for CustomSmartPointer
{
    fn drop(&mut self) 
    {
        println!(
            "Dropping CustomSmartPointer with data `{}`!",
            self.data
        );
    }
}

pub fn run_drop()
{
    let c = CustomSmartPointer {
        data: String::from("my stuff"),
    };
    println!("CustomSmartPointers created.");
    drop(c);
    println!(
        "CustomSmartPointer dropped before the end of function."
    );
}


