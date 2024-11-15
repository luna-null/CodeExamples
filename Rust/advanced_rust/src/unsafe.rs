use core::slice;


unsafe fn enter_the_danger_zone() 
{
    let mut v = vec![1,2,3,4,5,6];

    let r = &mut v[..];

    let (a,b) = r.split_at_mut(3);

    assert_eq!(a, &mut [1,2,3]);
    assert_eq!(b, &mut [4,5,6]);
}

fn split_at_mut(values: &mut [i32], mid: usize)
    -> (&mut [i32], &mut [i32])
{
    let len = values.len();
    let ptr = values.as_mut_ptr();

    assert!(mid <= len);

    unsafe {
        (
            slice::from_raw_parts_mut(ptr, mid),
            slice::from_raw_parts_mut(ptr.add(mid), len - mid),
        )
    }
}
extern "C" {
    fn abs(input: i32) -> i32;
}

// Needed so that the Rust compiler doesn't change
// the name (mangle) of the function
#[no_mangle]
pub extern "C" fn call_from_c() {
    println!("Just called a Rust function from C!");
}

static HELLO_WORLD: &str = "Hello, world!";

static mut COUNTER: u32 = 0;

fn add_to_count(inc: u32) {
    unsafe {
        COUNTER += inc;
    }
}

unsafe trait Foo {
    // methods go here
}
unsafe impl Foo for i32 {
    // method implementations go here
}

pub fn r#unsafe()
{
    let mut num = 5;
    // raw pointers; the `*` doesn't mean it's
    // dereferencing anything. That's just a part
    // of the name of the type
    let r1 = &num as *const i32;
    let r2 = &mut num as *mut i32;

    let address = 0x012345usize;
    // let r = address as *const i32;

    unsafe {
        println!("r1 is: {:?}", *r1);
        println!("r2 is: {:?}", *r2);

        enter_the_danger_zone();
        println!(
            "Absolute value of -3 according to C: {}",
            abs(-3)
        );
    }

    println!("name is: {HELLO_WORLD}");

    add_to_count(3);

    unsafe {
        println!("COUNTER: {COUNTER}");
        add_to_count(4);
        println!("COUNTER: {COUNTER}");
    }

}
