fn main() {
    let input = r"\u1f60d\u1f60d\u1f60d\u1f60d\u1f346\u1f346\u1f346\u1f346";
    let output = String::from_utf8(unescape::unescape(input).unwrap().chars().map(|c| c as u8).collect()).unwrap();
    println!("{}",output);
}

