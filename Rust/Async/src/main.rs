use tokio::time::{sleep, Duration};

async fn async_task(task_number: usize, delay_secs: u64) {
    println!("Task {} is starting...", task_number);
    // Simulate an async task by waiting for `delay_secs` seconds
    sleep(Duration::from_secs(delay_secs)).await;
    println!("Task {} is done after {} seconds.", task_number, delay_secs);
}

#[tokio::main]
async fn main() {
    println!("Starting tasks...");

    // Launching async tasks concurrently
    let task1 = async_task(1, 3);
    let task2 = async_task(2, 2);
    let task3 = async_task(3, 1);

    // Await them all concurrently
    tokio::join!(task1, task2, task3);

    println!("All tasks completed.");
}

