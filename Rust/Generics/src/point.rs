
pub struct Point<T, U>
{
    pub x: T,
    pub y: U,
}

pub enum Option<T>
{
    Some(T),
    None,
}

pub enum Result<T, E>
{
    Ok(T),
    Err(E),
}

impl<T, U> Point<T, U>
{
    pub fn x(&self) -> &T
    {
        &self.x
    }
}

impl Point<f32, f32>
{
    pub fn distance_from_origin(&self) -> f32
    {
        (self.x.powi(2) + self.y.powi(2)).sqrt()
    }
}
impl<X1, Y1> Point<X1, Y1>
{
    pub fn mixup<X2, Y2>(self, other: Point<X2, Y2>) -> Point<X1, Y2>
    {
        Point {
            x: self.x,
            y: other.y,
        }
    }
}

pub fn largest<T: Ord>(list: &[T]) -> &T
{
    let mut largest = &list[0];

    for item in list {
        if item > largest {
            largest = item;
        }
    }
    largest
}


