use std::{thread, time};
use std::io::{Write, stdout};
use crossterm::{QueueableCommand, cursor, terminal, ExecutableCommand};
use std::sync::{Arc, Mutex, mpsc};

enum Command 
{
    Print(String),
    Stop,
}

fn main() {
    let stdout = Arc::new(Mutex::new(stdout())); // Wrap stdout in Arc<Mutex>
    let mut handles: Vec<thread::JoinHandle<()>> = vec![];
    let (tx, rx): (mpsc::Sender<Command>, mpsc::Receiver<Command>) = mpsc::channel();
    let rx = Arc::new(Mutex::new(rx));
    let tx = Arc::new(Mutex::new(tx));
    let tx_arr: Vec<Arc<Mutex<Command>>> = vec![];

    {
        let mut output = stdout.lock().unwrap(); // Lock stdout to use it
        output.execute(terminal::Clear(terminal::ClearType::All)).unwrap();
        output.execute(cursor::Hide).unwrap();
    } // Unlock stdout after the initial setup
    
    for i in 0..10 {
        let stdout = Arc::clone(&stdout); // Clone the Arc to share across threads
        let rx = Arc::clone(&rx); // Clone the Arc<Mutex<Receiver>> for each thread
        let tx = Arc::clone(&tx);
        let handle = thread::spawn(move || {
            loop {
                let message = {
                    // Lock and receive a message
                    let rx = rx.lock().unwrap();
                    rx.recv().unwrap() // This will block until a message is received
                };
                match message {
                    Command::Print(msg) => {
                        let mut output = stdout.lock().unwrap();
                        output.queue(cursor::MoveTo(0, i)).unwrap(); // Move to specific line
                        write!(output, "Thread {}:", i).unwrap(); // Print the message
                        output.flush().unwrap();
                        for char in msg.chars() {
                            write!(output, "{}", char).unwrap(); // Print the message
                            output.flush().unwrap();
                            thread::sleep(time::Duration::from_millis(100));
                        }
                    }
                    Command::Stop => {
                        println!("Thread {} stopping.", i);
                        break;
                    }
                    // Err(_) => {
                    //     println!("Error receiving command.");
                    //     break;
                    // }
                }
            }
        });
        handles.push(handle); // Save the thread handle
    }

    // Sending messages from the main thread
    for i in 0..10 {
        tx.lock().unwrap().send(Command::Print(format!("####################"))).unwrap();
        thread::sleep(time::Duration::from_millis(100));
    }
    // Send stop command to all threads
    for _ in 0..10 {
        tx.lock().unwrap().send(Command::Stop).unwrap();
    }

    for handle in handles {
        handle.join().unwrap();
    }


    let mut output = stdout.lock().unwrap(); // Lock stdout to show cursor and print done message
    output.execute(terminal::Clear(terminal::ClearType::All)).unwrap();
    output.execute(cursor::Show).unwrap();

    println!("\nDone!");
}
