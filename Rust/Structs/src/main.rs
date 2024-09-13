struct User
{
    active: bool,
    username: String,
    email: String,
    sign_in_count: u64,
}

struct Color(i32, i32, i32,);
struct Point(i32, i32, i32,);

struct AlwaysEqual;

fn main()
{
    let subject = AlwaysEqual;

    let black = Color(0,0,0);
    let origin = Point(0,0,0);

    let mut user1 = User {
        active: true,
        username: String::from("someusername123"),
        email: String::from("someone@example.com"),
        sign_in_count: 1,
    };

    user1.email = String::from("anotheremail@example.com");

    let user2 = User {
        email: String::from("another@example.com"),
        username: user1.username.clone(),
        ..user1
    };

    println!("user1: {}\nuser2: {}", user1.username, user2.username);
}

fn build_user(email: String, username: String) -> User
{
    User {
        active: true,
        username,
        email,
        sign_in_count: 1,
    }
}
