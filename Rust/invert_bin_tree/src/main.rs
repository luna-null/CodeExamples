// Definition for a binary tree node.
#[derive(Debug, PartialEq, Eq)]
pub struct TreeNode {
  pub val: i32,
  pub left: Option<Rc<RefCell<TreeNode>>>,
  pub right: Option<Rc<RefCell<TreeNode>>>,
}

impl TreeNode {
  #[inline]
  pub fn new(val: i32) -> Self {
    TreeNode {
      val,
      left: None,
      right: None
    }
  }
}
use std::rc::Rc;
use std::cell::RefCell;

pub fn invert_tree(root: Option<Rc<RefCell<TreeNode>>>) -> Option<Rc<RefCell<TreeNode>>> 
{
    if let Some(node_rc) = root {
        // Borrow the node mutably
        let mut node = node_rc.borrow_mut();

        // Swap the left and right children
        let temp = node.left.take();  // Take left out (Option becomes None)
        node.left = invert_tree(node.right.take()); // Recursively invert right subtree
        node.right = invert_tree(temp); // Recursively invert left subtree (stored in temp)

        Some(Rc::clone(&node_rc))  // Return the modified node wrapped in Some
    } else {
        None // If root is None, return None
    }
}

fn main() {
    println!("{:?}",Some(Rc::new(RefCell::new(TreeNode { val: 1, left: None, right: None }))));
}
