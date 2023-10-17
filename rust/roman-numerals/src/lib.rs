use std::fmt::{Display, Formatter, Result};

pub struct Roman {
    result: String
}

impl Display for Roman {
    fn fmt(&self, f: &mut Formatter<'_>) -> Result {        
        f.write_str(&self.result)
    }
}

impl From<u32> for Roman {
    fn from(mut num: u32) -> Self {
        let mut result: String = "".to_string();
        let literals = vec![1000, 500, 100, 50, 10, 5, 1];
        for lit in literals.iter() {
            let amount = num / lit;
            for n in 0..amount {
                result = result.to_owned() + to_literal(lit);
            }
            num = num - (amount * lit);
        }
        result = result.replace("DCCCC", "CM");
        result = result.replace("CCCC", "CD");
        result = result.replace("LXXXX", "XC");
        result = result.replace("XXXX", "XL");
        result = result.replace("VIIII", "IX");
        result = result.replace("IIII", "IV");
        return Roman{result: result};
    }
}

fn to_literal(x: &u32) -> &str {
    match x {
        1 => "I",
        5 => "V",
        10 => "X",
        50 => "L",
        100 => "C",
        500 => "D",
        1000 => "M",
        _ => ""
    }
}
