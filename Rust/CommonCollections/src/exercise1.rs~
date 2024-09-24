use std::{cmp::max_by_key, collections::HashMap};

/* Exercise 1 in Common Collections:
 * Given a list of integers, use a vector and 
 * return the median (when sorted, the value 
 * in the middle position) and mode (the value 
 * that occurs most often; a hash map will be 
 * helpful here) of the list.
 */
fn max_hash(H: &HashMap<i32,i32>) -> (i32,i32)
{
    let (mut max_key, mut max_val) = (0,0);
    let mut comparator: Vec<i32> = Vec::new();
    for (&key, &val) in H.iter() {
        if val > max_val {
            (max_key, max_val) = (key, val);
        }
    }
    for (key, val) in H.iter()
    {
        if *val == max_val {
            comparator.push(*key);
        }
    }
    max_key = mean(&comparator).as_slice()[0];
    (max_key, max_val)
}

fn mean(V: &Vec<i32>) -> Option<i32> 
{
    if V.len() == 0 {
        return None;
    }
    let mut sum = 0;
    for num in V {
        sum += num;
    }
    Some(sum / (V.len() as i32))
}

fn median(V: &Vec<i32>) -> Option<i32> 
{
    let mut result = 0;
    if V.len() == 0 {
        return None;
    }
    let mut V_sorted = V.clone();
    V_sorted.sort();

    if V.len() % 2 == 1 {
        result = V_sorted[V.len() / 2];
    }
    else {
        result = V_sorted[V.len() / 2];
    }

    Some(result)
}

fn mode(V: &Vec<i32>) -> Option<i32>
{
    let mut freq = HashMap::new();
    for num in V {
        freq.entry(*num)
            .and_modify(|num| {*num += 1})
            .or_insert(1);
    }
    Some(max_hash(&freq).0)
}



pub fn exercise1()
{
    let V = &vec![1, 2, 3, 4, 2, 1, 1];
    let U: Vec<i32> = Vec::new();

    println!("The mode of the set {V:?} is {:?}", mode(V).unwrap_or(0));
    println!("The median of the set {V:?} is {:?}", median(V).unwrap_or(0));

    println!("The mean of the set {U:?} is {:?}", mean(&U).unwrap_or(0));
}
