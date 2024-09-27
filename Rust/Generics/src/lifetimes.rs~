
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

    let result = longest(string.as_str(), string2);
    println!("The longest string is {result}");
}

pub fn longest(x: &str, y: &str) -> &str {
    if x.len() > y.len() {
        x
    } else {
        y
    }
}
