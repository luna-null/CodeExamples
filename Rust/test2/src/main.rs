use std::thread;
use std::time::Duration;

fn main() {
    // Spawn a thread that prints to stdout
    let handle = thread::spawn(|| {
        for i in 1..=5 {
            println!("Thread 1: {}", i);
            thread::sleep(Duration::from_millis(500));
        }
    });

    // In the main thread, print to stdout
    for i in 1..=5 {
        println!("Main Thread: {}", i);
        thread::sleep(Duration::from_millis(300));
    }

    // Wait for the spawned thread to finish
    handle.join().unwrap();
}
