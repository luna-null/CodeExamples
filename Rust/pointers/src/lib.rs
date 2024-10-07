mod refcell;
mod ref_cycles;

pub use refcell::{Messenger, LimitTracker}; // Import from refcell.rs
#[cfg(test)]
mod tests {
    use super::*;
    use std::cell::RefCell;

    struct MockMessenger {
        sent_messages: RefCell<Vec<String>>,
    }
    impl MockMessenger {
        fn new() -> MockMessenger {
            MockMessenger {
                sent_messages: RefCell::new(vec![]),
            }
        }
    }
    impl Messenger for MockMessenger {
        // fn send(&self, message: &str) {
        //     self.sent_messages
        //         .borrow_mut()
        //         .push(String::from(message));
        // }
        fn send(&self, message: &str) 
        {
            let mut one_borrow = self.sent_messages.borrow_mut();
            let mut two_borrow = self.sent_messages.borrow_mut();
            one_borrow.push(String::from(message));
            two_borrow.push(String::from(message));
        }
    }

    #[test]
    fn it_sends_an_over_75_percent_warning_message() {
        let mock_messenger = MockMessenger::new();
        let mut limit_tracker = LimitTracker::new(&mock_messenger, 100);

        limit_tracker.set_value(80);

        assert_eq!(
            mock_messenger
                .sent_messages
                .borrow()
                .len()
        ,   1 
        );
    }
}
