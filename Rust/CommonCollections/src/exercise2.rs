use std::{collections::HashMap, str::FromStr};
use regex::Regex;

fn pig_latin(Str: &String) -> String
{
    let mut offset = 0;
    let punc_reg = Regex::new
        (r"([.!?,])")   // Gets a regex of a punctuation
        .unwrap();
    let mut punc_hash = HashMap::new();
    for punc in punc_reg.captures_iter(Str) {
        punc_hash.insert(punc.get(1).unwrap().end(), format!("{}",&punc[1]));
    }
    let reg = Regex::new
        (r"\b(?i)([qwrtpsdfghjklzxcvbnm]{1,3}|y{1}|)(\w+)\b")   // matches a consonant or a y as the first letter
                                                                // in the first group, and any amount of letters 
                                                                // greater than 0 afterward in the second
        .unwrap();

    let mut new_string = String::new();

    for cap in reg.captures_iter(Str) {
        let match_cons = format!("{}{}ay", &cap[2], &cap[1]);
        let match_vowel = format!("{}hay", &cap[2]);
        if cap[1].is_empty() {
            new_string = new_string + &match_vowel + " ";
            offset += 3;
        }
        else {
            new_string = new_string + &match_cons + " ";
            offset += 2;
        }
    }
    for (key, val) in punc_hash.into_iter() {

        new_string.insert(key+offset - 1, val.chars().next().unwrap());

    }
    return new_string;
}


pub fn exercise2()
{
    let sentence = pig_latin(&String::from("The word of the day is ligma."));
    println!("{sentence}");
}
