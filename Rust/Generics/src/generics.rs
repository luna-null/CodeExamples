use crate::point::{ Point, largest };

pub fn generics()
{
    let number_list = vec![34, 50, 25, 100, 65];

    println!("The largest number is {}", largest(&number_list));

    let number_list = vec![102, 34, 6000, 89, 54, 2, 43, 8];

    println!("the largest number is {}", largest(&number_list));

    let char_list = vec!['y', 'm', 'a', 'q'];
    println!("the largest char is {}", largest(&char_list));

    let _integer = Point { x: 5, y: 10 };
    let _float = Point { x: 1.0, y: 4.0 };
    let _int_float = Point { x: 5, y: 4.0 };
    
    let p1 = Point { x: 5, y: 10.4 };
    let p2 = Point { x: "Hello", y: 'c' };
    let p3 = p1.mixup(p2);

    println!{"p3.x = {}, p3.y = {}", p3.x, p3.y};


}

