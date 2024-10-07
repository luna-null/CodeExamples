// // Example use of a procedural macro:
// use proc_macro;
//
// #[some_attribute]
// pub fn some_name(input: TokenStream) -> TokenStream {}
//
// // Example use of an attribute-like macro:
// #[route(GET, "/")]
// fn index() { // --snip-- }
// // which looks like this to the compiler:
// #[proc_macro_attribute]
// pub fn route(attr: TokenStream, item: TokenStream) -> TokenStream {

use crate::pancakes;


#[macro_export]
macro_rules! vec_ {
    ( $( $x:expr ),* ) => {
        {
            let mut temp_vec = Vec::new();
            $(
                temp_vec.push($x);
            )*
            temp_vec
        }
    };
}

pub fn macros()
{
    pancakes::pancakes();

    // // use of function-like macro:
    // let sql = sql!(SELECT * FROM posts WHERE id=1);
    // // with definition:
    // #[proc_macro]
    // pub fn sql(input: TokenStream) -> TokenStream 
    // { // --snip-- }
}
