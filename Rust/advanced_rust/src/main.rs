mod advanced_traits;
mod r#unsafe;
mod newtypes;
mod advanced_functions_and_closures;
mod macros;
mod pancakes;

fn main()
{
    println!("\n--------------------\n");

    println!("\n1. Unsafe:\n");
    r#unsafe::r#unsafe();

    println!("\n2. Advanced_Traits:\n");
    advanced_traits::advanced_traits();

    println!("\n3. Newtypes:\n");
    newtypes::newtypes();

    println!("\n4. Advanced_Functions_And_Closures:\n");
    advanced_functions_and_closures::advanced_functions_and_closures();

    println!("\n5. Macros:\n");
    macros::macros();
}
