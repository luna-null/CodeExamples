use std::any::type_name;
use std::collections::HashMap;
use std::collections::HashSet;

fn main()
{
    let mut x: HashSet<i32> = HashSet::new();
    x.insert(1);
    x.insert(1);
    x.contains(&1);
    let ind: usize = 1 as usize;
    let box_map: HashMap<(usize, usize), usize> = HashMap::from([
        ((0,0), 0), ((0,1), 1), ((0,2), 2),
        ((1,0), 3), ((1,1), 4), ((1,2), 5),
        ((2,0), 6), ((2,1), 7), ((2,2), 8),
    ]);

    println!("{:?}", box_map[&(ind,ind)]);
    let mut v: Vec<i32> = Vec::with_capacity(9);
}
