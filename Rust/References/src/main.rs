fn main()
{
    let mut s1 = String::from("hello");
    {
        let r1 = &mut s1;
    } // r1 goes out of scope here, so we can make a new reference with no problems.
    let r2 = &mut s1;

    let mut s2 = String::from("hamburger!");

    let r3 = &s2;
    let r4 = &s2;
    println!("{r3} and {r4}");

    let r5 = &mut s2;
    println!("{r5}");

    println!("{} lol", r2);

    change(&mut s1);
    let len = calculate_length(&mut s1);

    println!("The length of {s1} is {len}.");

    let reference_to_nothing = dangle();
}
fn dangle() -> String
{
    let s = String::from("hello");

    s
}


fn change(some_string: &mut String)
{
    some_string.push_str(", world!");
}


fn calculate_length(s: &String) -> usize // s is a reference to a String
{
    s.len()
} // Here, s goes out of scope; but because it doesn't have ownership of what it refers to, it is
  // not dropped.
