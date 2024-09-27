use std::{collections::HashMap, hash::Hash, io::{self, Read}};


pub fn print_database(H: &HashMap<String, String>) -> ()
{
    println!("{H:?}");
}

pub fn insert_entry(H: &mut HashMap<String, String>, name: &String, department: &String)
-> HashMap<String, String>
{
    H.entry(name.clone()).or_insert(department.clone());
    return H.clone();
}



pub fn exercise3()
{
    let mut database: HashMap<String, String> = HashMap::new();

    println!("Enter a name: ");

    let mut name = String::new();
    io::stdin()
        .read_line(&mut name)
        .expect("Failed to read line");
    let input1 = String::from(name.trim());

    println!("Enter a department: ");
    let mut department = String::new();
    io::stdin()
        .read_line(&mut department)
        .expect("Failed to read line");
    let input2 = String::from(department.trim());

    insert_entry(&mut database, &input1, &input2);
    print_database(&database);
}
