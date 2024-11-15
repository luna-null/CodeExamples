struct Ipv4Addr {
    num1: u8,
    num2: u8,
    num3: u8,
    num4: u8,
}
struct Ipv6Addr {
    addr: String,
}
enum IpAddr {
    V4(Ipv4Addr),
    V6(Ipv6Addr),
}

enum Message {
    Quit,
    Move {x: i32, y: i32},
    Write(String),
    ChangeColor(i32, i32, i32),
}
struct QuitMessage; // unit struct
struct MoveMessage {
    x: i32,
    y: i32,
}
struct WriteMessage(String); // tuple struct
struct ChangeColorMessage(i32,i32,i32); // tuple struct

fn route(_ip_kind: IpAddr) {}

impl Message {
    fn call(&self) {
        // method body would be defined here
    }
}

// The Option enum... reminds me of a Haskellism....
// enum Option<T> {
//     None,
//     Some(T),
// }

fn main()
{
    let home = IpAddr::V4(Ipv4Addr {  
            num1: 1,
            num2: 2,
            num3: 3,
            num4: 4,
        }
    );
    let loopback = IpAddr::V6(Ipv6Addr {
            addr: String::from("fafa"),
        }
    );
    let m = Message:: Write(String::from("hello"));
    m.call();

    let some_number = Some(5);
    let some_char = Some('e');
    let absentee_number: Option<i32> = None;

    let x: i8 = 5;
    let y: Option<i8> = Some(5);

    let sum = x + y.as_slice()[0];
    println!("{sum}");
}
