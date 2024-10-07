//! # Art
//!
//! A library for modeling artistic concepts

pub mod kinds {
    /// The primary colors according to the RYB color model.
    pub enum PrimaryColor {
        Red,
        Yellow,
        Blue,
    }

    /// The secondary colors according to the RYB color model.
    pub enum SecondaryColor {
        Orange,
        Green,
        Purple,
    }
}

pub mod utils {
    use super::kinds::*;

    /// Combines two primary colors in equal amounts to create
    /// a secondary color.
    pub fn mix(c1: PrimaryColor, c2: PrimaryColor) 
        -> SecondaryColor 
    {
        // Implementation of the color mixing logic here
        // This is just a placeholder:
        match (c1, c2) {
            (PrimaryColor::Red, PrimaryColor::Yellow) => SecondaryColor::Orange,
            (PrimaryColor::Red, PrimaryColor::Blue) => SecondaryColor::Purple,
            (PrimaryColor::Yellow, PrimaryColor::Blue) => SecondaryColor::Green,
            // Add more combinations or return a default/fallback value
            _ => panic!("Invalid color combination"),
        }
    }
}

