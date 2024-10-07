pub struct Post
{
    content: String,
}

pub struct DraftPost {
    content: String,
}

impl Post
{
    pub fn new() -> DraftPost
    {
        DraftPost {
            content: String::new(),
        }
    }

    pub fn content(&self) -> &str
    {
        &self.content
    }

}

impl DraftPost {    
    pub fn add_text(&mut self, text: &str)
    {
        self.content.push_str(text);
    }
    pub fn request_review(self) -> PendingReviewPost
    {
        PendingReviewPost {
            content: self.content,
            approvals: 0,
        }
    }

}

pub struct PendingReviewPost {
    content: String,
    approvals: i32,
}

impl PendingReviewPost {

    // TODO: Require two calls to approve before the state can be changed to Published.
    pub fn approve(self) -> Post {
        Post {
            content: self.content,
        }
    }
    pub fn reject(self) -> DraftPost
    {
        DraftPost {
            content: self.content,
        }
    }
}

trait State
{
    fn request_review(self: Box<Self>) -> Box<dyn State>;
    fn approve(self: Box<Self>) -> Box<dyn State>;
    fn content<'a>(&self, post: &'a Post) -> &'a str
    {
        ""
    }
    fn reject(self: Box<Self>) -> Box<dyn State>;
    fn is_draft(&self) -> bool 
    {
        false
    }
}

struct Draft {}

impl State for Draft
{
    fn request_review(self: Box<Self>) -> Box<dyn State>
    {
        Box::new(PendingReview {})
    }
    fn approve(self: Box<Self>) -> Box<dyn State>
    {
        self
    }
    fn reject(self: Box<Self>) -> Box<dyn State>
    {
        self
    }
    fn is_draft(&self) -> bool {
        true
    }
}

struct PendingReview {}

impl State for PendingReview
{
    fn request_review(self: Box<Self>) -> Box<dyn State>
    {
        self
    }
    fn approve(self: Box<Self>) -> Box<dyn State>
    {
        Box::new(Published {})
    }
    fn reject(self: Box<Self>) -> Box<dyn State>
    {
        Box::new(Draft {})
    }
}

struct Published {}

impl State for Published
{
    fn request_review(self: Box<Self>) -> Box<dyn State>
    {
        self
    }
    fn approve(self: Box<Self>) -> Box<dyn State>
    {
        self
    }
    fn reject(self: Box<Self>) -> Box<dyn State>
    {
        self
    }
    fn content<'a>(&self, post: &'a Post) -> &'a str
    {
        &post.content
    }
}

pub fn blog()
{
    let mut post = Post::new();

    post.add_text("I ate a burrito for lunch today");

    let post = post.request_review();
    let post = post.approve();

    assert_eq!("I ate a burrito for lunch today", post.content);
}
