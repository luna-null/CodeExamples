pub fn strings()
{
    println!("\nStrings!!!\n");
    let mut s = String::new();

    let data = "initial contents";

    let s = data.to_string();

    // the method also works on a literal directly:
    let s = "initial contents".to_string();

    let hello: Vec<String> = vec![
        String::from("السلام عليكم"),
        String::from ("Dobrý den"),
        String::from("Hello"),
        String::from("שלום"),
        String::from("नमस्ते"),
        String::from("こんにちは"),
        String::from("안녕하세요"),
        String::from("你好"),
        String::from("Olá"),
        String::from("Здравствуйте"),
        String::from("Hola"),
    ];
    for h in hello
    {
        println!("{h}");
    }
    println!();


    let mut s1 = String::from("foo");
    let s2 = "bar";
    s1.push_str(s2);
    println!("s2 is {s2} and s1 is {s1}");

    let mut s = String::from("lo");
    s.push('l');
    println!("{s}");

    let s1 = String::from("Hello, ");
    let s2 = String::from("world!");
    let s3 = s1 + &s2; // note s1 has been moved here and can no longer be used
    println!("{s3}");


    // format
    let s1 = String::from("tic");
    let s2 = String::from("tac");
    let s3 = String::from("toe");

    let s = format!("{s1}-{s2}-{s3}");
    println!("{s}");

    let hello_ru = "здравствуйте";
    let answer = &hello_ru[0..4];
    for c in answer.chars(){ println!("{c}");}
    for b in answer.bytes(){ println!("{b}");}

}
