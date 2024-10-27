use std::time::Instant;

fn counter(a: &mut i32, b: &i32) -> Option<i32>
{
    while *a != *b {
        if *a < *b {
            *a += 1;
        } else {
            *a -= 1;
        }
    }
    Some(*a)
}

fn main()
{
    // let duration = time::Duration::new(, nanos);
    let mut x = 1;
    let target = 1_000_000_000;
    let start = Instant::now();
    println!("{:?}",counter(&mut x, &target).unwrap());
    let duration = start.elapsed();
    println!("Time Elapsed: {:?}", duration);
}
