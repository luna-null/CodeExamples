use std::fmt::Display;

pub fn lifetimes() {
    
    {                           //
        let r;                  // ---------+-- 'a
        // {                    //          |
            let x = 5;          // -+-- 'b  |
            r = &x;             //  |       |
        // }                    // -+       |
        println!("r: {r}");     //          |
    }                           // ---------+
    let string1 = String::from("abcd");
    let string2 = "xyz";

    let result = longest(string1.as_str(), string2);
    println!("The longest string is {result}");

    let string1 = String::from("long string is long");
    let result;
    {
        let string2 = String::from("xyz");
        result = longest(string1.as_str(), string2.as_str());
        println!("The longest string is {result}");
    }
    
    let novel = String::from(
        "Call me Ishmael. Some years ago..."
    );
    let first_sentence = novel.split('.').next().unwrap();
    let i = ImportantExcerpt
    {
        part: first_sentence,
    };

    // this generic always stores something for the entire
    // duration of the program
    let s: &'static str = "I have a static lifetime.";
}

pub fn longest<'a>(x: &'a str, y: &'a str) -> &'a str {
    if x.len() > y.len() {
        x
    } else {
        y
    }
}

pub fn first_word(s: &str) -> &str
{
    let bytes = s.as_bytes();

    for (i, &item) in  bytes.iter().enumerate()
    {
        if item == b' ' {
            return &s[0..i];
        }
    }

    &s
}

// This means that the struct can't exist longer than its
// reference exists in the reference's respective scope
struct ImportantExcerpt<'a> 
{
    part: &'a str,
}

impl<'a> ImportantExcerpt<'a> 
{
    fn level(&self) -> i32
    {
        3
    }
    fn announce_and_return_part(&self, announcement: &str) ->&str
    {
        println!("Attention please: {announcement}");
        self.part
    }
}

fn longest_with_an_announcement<'a,T>(
    x: &'a str,
    y: &'a str,
    ann: T,
) -> &'a str
where
    T: Display,
{
    println!("Announcement! {ann}");
    if x.len() > y.len() {
        x
    } else {
        y
    }
}



/* 
The compiler uses three rules to figure out the lifetimes of the references when there aren’t explicit annotations. The first rule applies to input lifetimes, and the second and third rules apply to output lifetimes. If the compiler gets to the end of the three rules and there are still references for which it can’t figure out lifetimes, the compiler will stop with an error. These rules apply to fn definitions as well as impl blocks.

The first rule is that the compiler assigns a lifetime parameter to each parameter that’s a reference. In other words, a function with one parameter gets one lifetime parameter: fn foo<'a>(x: &'a i32); a function with two parameters gets two separate lifetime parameters: fn foo<'a, 'b>(x: &'a i32, y: &'b i32); and so on.

The second rule is that, if there is exactly one input lifetime parameter, that lifetime is assigned to all output lifetime parameters: fn foo<'a>(x: &'a i32) -> &'a i32.

The third rule is that, if there are multiple input lifetime parameters, but one of them is &self or &mut self because this is a method, the lifetime of self is assigned to all output lifetime parameters. This third rule makes methods much nicer to read and write because fewer symbols are necessary.
*/
