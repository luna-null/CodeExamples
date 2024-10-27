use std::any::type_name;
use std::collections::HashMap;

fn main()
{
    let mut hash = HashMap::new();
    hash.insert("s", "a");
    println!("{:?}", hash["s"]);
    
}
