mod node;

use node::Node;

fn main()
{
    let mut parent = Node::new(0);
    let left_child = Node::new(1);
    parent.add_child_node(left_child);
    println!("{:?}", parent.children[0].as_ref());

}
