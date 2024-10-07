// Use `cargo doc --open` documentation
//! # My Crate
//!
//! `my_crate` is a collection of utilities to make performing
//! certain calculations more convenient.

pub mod art;

pub fn add(left: u64, right: u64) -> u64
{
    left + right
}

/// Adds one to the number given.
///
/// # Examples
///
/// ```
/// let arg = 5;
/// let answer = my_crate::add_one(arg);
///
/// assert_eq!(6, answer);
/// ```
///
/// # Panics
///
/// `x` isn't an i32.
///
/// # Errors
///
/// `x` isn't an i32.
///
/// # Safety
///
/// This code is pretty safe.
pub fn add_one(x: i32) -> i32 {
    x + 1
}

#[cfg(test)]
mod tests
{
    use super::*;

    #[test]
    fn it_works()
    {
        let result = add(2, 2);
        assert_eq!(result, 4);
    }
}
