pub fn iterators()
{
    let v1 = vec![1, 2, 3];
    let v1_iter = v1.iter();

    for val in v1_iter {
        println!("Got: {val}");
    }
    let v1: Vec<i32> = vec![1,2,3];
    let arr = v1.iter().map(|x| x+1);

    for x in arr {
      println!("{x}");
    }
}

pub trait Iterator {
    type Item;

    fn next(&mut self) -> Option<Self::Item>;

}
