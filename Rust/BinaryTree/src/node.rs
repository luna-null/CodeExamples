use std::fmt::Display;

#[derive(Debug)]
pub struct Node<T: Display> {
    pub data: T,
    pub children: Vec<Box<Option<Node<T>>>>,
}

impl<T: Display> Node<T> {
    pub fn new(data: T) -> Self {
        Node {
            data,
            children: vec![],
        }
    }

    pub fn add_child_node(&mut self, node: Node<T>) {
        self.children.push(Box::new(Some(node)));
    }
}
