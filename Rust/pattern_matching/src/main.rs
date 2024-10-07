fn main()
{
    println!("{:?}", matching(&Option::Some(2)));

    let favorite_color: Option<&str> = None;
    let is_tuesday = false;
    let age: Result<u8, _> = "34".parse();

    if let Some(color) = favorite_color {
        println!("Using your favorite color, {color}, as the background");
    } else if is_tuesday {
        println!("Tuesday is green day!");
    } else if let Ok(age) = age {
        if age > 30 {
            println!("Using purple as the background color");
        } else {
            println!("Using orange as the background color");
        }
    } else {
        println!("Using blue as the background color");
    }

    let mut stack = Vec::new();

    stack.push(1);
    stack.push(2);
    stack.push(3);

    while let Some(top) = stack.pop() {
        println!("{top}");
    }

    let v = vec!['a', 'b', 'c'];

    for (index, value) in v.iter().enumerate() {
        println!("{value} is at index {index}");
    }

    let (x, y, ..) = (1, 2, 3);
    println!("x: {x}; y: {y}");

    let point = (3,2);
    print_coordinates(&point);

    if let Some(x) = Option::Some(2) {
        println!("{x}");
    }

    let x = 1;

    match x {
        1 => println!("one"),
        2 => println!("two"),
        3 => println!("three"),
        _ => println!("anything"),

    }
       let x = Some(5);
    let y = 10;

    match x {
        Some(50) => println!("Got 50"),
        Some(y) => println!("Matched, y = {y}"),
        _ => println!("Default case, x = {x:?}"),
    } // matches second pattern, due to `match` 
      // creating a new scope
    println!("at the end: x = {x:?}, y = {y}");

    let x = 1;
    match x {
        1 | 2   => println!("one or two"),
        3       => println!("three"),
        _       => println!("anything"),
    } // matches first pattern
    let x = 5;
    match x {
        1..=5   => println!("one or two"),
        _       => println!("something else"),
    } // matches first pattern
    let x = 'c';
    match x {
        'a'..='j'   => println!("early ASCII letter"),
        'k'..='z'   => println!("late ASCII letter"),
        _           => println!("something else"),
    } // matches first pattern

    let p = Point { x: 0, y: 7, z: 2 };

    let Point { x, y, z } = p;
    assert_eq!(0, x);
    assert_eq!(7, y);

    match p {
        Point { x, y: 0, z: 0 } => println!("On the x axis at {x}"),
        Point { x: 0, y, z: 0 } => {
            println!("On the y axis at {y}")
        }
        Point { x, y, z: 0 } => {
            println!("On the xy plane at ({x}, {y})");
        }
        Point { x, y, z, .. } => {
            println!("Out in the middle of nowhere: ({x}, {y}, {z})");
        }
    } // matches second pattern

    let msg = Message::ChangeColor(Color::Hsv(0, 160, 255));

    match msg {
        Message::Quit                               => {
            println!("The Quit variant has no data to destructure.");
        }
        Message::Move { x, y }                      => {
            println!("Move in the x direction {x} and in the y direction {y}");
        }
        Message::Write(text)                        => {
            println!("Text message: {text}");
        }
        Message::ChangeColor(Color::Rgb(r, g, b))   => {
            println!("Change the color to red {r}, green {g}, and blue {b}");
        }
        Message::ChangeColor(Color::Hsv(h, s, v))   => {
            println!("Change the color to hue {h}, saturation {s}, vale {v}")
        }
        _                                           => (),
    } // matches the second-to-last case

    let ((feet, inches), Point { x, y, .. }) = ((3, 10), Point { x: 3, y: -10, z: 3 });

    foo(3, 4);

    let mut setting_value = Some(5);
    let mut new_setting_value = Some(10);

    match (setting_value, new_setting_value) {
        (Some(_), Some(_))  => {
            println!("Can't overwrite an existing customized value");
        }
        _                   => {
            setting_value = new_setting_value;
        }
    }

    println!("setting is {setting_value:?}");

    let numbers = (2, 4, 8, 16, 32);
    match numbers {
        (first, _, third, _, fifth)  => {
            println!("Some numbers: {first}, {third}, {fifth}");
        }
    }

    let _x = 5;
    let y = 10;

    let s = Some(String::from("Hello!"));

    if let Some(_) = s {
        println!("found a string");
    }
    println!("{s:?}");

    let num = Some(4);

    match num {
        Some(x) if x % 2 == 0   => println!("the number {x} is even"),
        Some(x)                 => println!("The number {x} is odd"),
        None                    => (),
    } // matches first pattern


    let x = Some(5);
    let y = 10;

    match x {
        Some(50)            => println!("Got 50"),
        Some(n) if n == y   => println!("Matched, n = {n}"),
        _                   => println!("Default case, x = {x:?}"),
    }
    println!("at the end: x = {x:?}, y = {y:?}");

    let x = 4;
    let y = false;

    match x {
        4 | 5 | 6 if y  => println!("yes"),
        _               => println!("no"),
    }

    let msg = Message_Hello:: Hello { id : 5 };

    match msg {
        Message_Hello::Hello {
            id: id_variable @ 3..=7,
        } => println!("Found an id in range: {id_variable}"),
        Message_Hello::Hello { id: 10..=12 } => {
             println!("Found an id in another range")
        }
        Message_Hello::Hello { id } => println!("Found some other id: {id}"),
    } // matches the first pattern

}

struct Point 
{
    x: i32,
    y: i32,
    z: i32,
}

enum Message {
    Quit,
    Move { x: i32, y: i32 },
    Write(String),
    ChangeColor(Color),
}

enum Message_Hello {
    Hello { id: i32},
}


enum Color {
    Rgb(i32, i32, i32),
    Hsv(i32, i32, i32),
    
}

fn matching(x: &Option<i32>) -> Option<i32>
{
    match x {
        None    => None,
        Some(i) => Some(i + 1),
    }
}

fn print_coordinates(&(x,y): &(i32, i32)) {
    println!("Current location: ({x}, {y})");
}


fn foo (_: i32, y: i32)
{
    println!("This code only uses the y parameter: {y}");
}
