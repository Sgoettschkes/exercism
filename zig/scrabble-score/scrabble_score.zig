pub fn score(s: []const u8) u32 {
    var total: u32 = 0;
    for (s) |char| {
        var lowerChar: usize = char;
        if (char <= 90) {
            lowerChar += 32;
        }
        if(lowerChar == 'd' or lowerChar == 'g') {
            total += 2;
        } else if (lowerChar == 'b' or lowerChar == 'c' or lowerChar == 'm' or lowerChar == 'p') {
            total += 3;
        } else if (lowerChar == 'f' or lowerChar == 'h' or lowerChar == 'v' or lowerChar == 'w' or lowerChar == 'y') {
            total += 4;
        } else if (lowerChar == 'k') {
            total += 5;
        } else if (lowerChar == 'j' or lowerChar == 'x') {
            total += 8;
        } else if (lowerChar == 'q' or lowerChar == 'z') {
            total += 10;
        } else {
            total += 1;
        }
    }
    
    return total;
}
