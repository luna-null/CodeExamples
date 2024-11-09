use std::{collections::HashSet, hash::Hash, rc::Rc, str::Bytes};
pub struct ListNode
{
    pub val: i32,
    pub next: Option<Box<ListNode>>,
}

impl ListNode
{
    #[inline]
    fn new(val: i32) -> Self
    {
        ListNode { next: None, val }
    }
}

fn main() {
    let mut s: String = "III".to_string();

    s.push_str("1");

    let char_l: char = 'a';

    s.push_str(&char_l);
}

pub fn roman_to_int(s: String) -> i32 {
    
    let mut sum = 0;
    let mut acc: String = "".to_string();
    let mut prev: String = "".to_string();
    for char in s.chars().take(2) {
        
    }

    sum
}
