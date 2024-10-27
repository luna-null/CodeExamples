use std::env;

fn get_project_root() -> String {
    // This only works when the code is run in a Cargo build context
    env::var("CARGO_MANIFEST_DIR").unwrap()
}

fn main() {
    let root = get_project_root();
    println!("Project root: {}", root);
}
