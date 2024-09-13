#[derive(Debug)]
struct Rectangle
{
    name: String,
    length: u32,
    width: u32,
}

impl Rectangle
{
    fn area(&self) -> u32
    {
        self.width * self.length
    }

    fn width(&self) -> bool
    {
        self.width > 0
    }

    fn can_hold(&self, other_rect: &Rectangle) -> bool
    {
        self.width > other_rect.width && self.length > other_rect.length
    }

    fn square(name: String, size: u32) -> Self
    {
        Self {
            name,
            width: size,
            length: size,
        }
    }
}

fn main()
{
    let scale = 2;
    let rect = Rectangle {
        name: String::from("rect1"),
        length: dbg!(45 * scale),
        width: 10,
    };

    let rect1 = Rectangle {
        name: String::from("rect1"),
        length: 30,
        width: 50,
    };
    let rect2 = Rectangle {
        name: String::from("rect2"),
        length: 10,
        width: 40,
    };
    let rect3 = Rectangle {
        name: String::from("rect3"),
        length: 60,
        width: 45,
    };
    let rect4 = Rectangle::square(String::from("rect4"), 5);

    println!("Can rect1 hold rect2? {}", rect1.can_hold(&rect2));
    println!("Can rect1 hold rect3? {}", rect1.can_hold(&rect3));

    if rect.width() {
        println!("The rectangle has a nonzero width!");
    }
    dbg!(&rect);
    dbg!(&rect4);
    println!("The area of {} is {}", rect.name, rect.area());
}
