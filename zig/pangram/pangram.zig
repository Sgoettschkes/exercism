const std = @import("std");

pub fn isPangram(str: []const u8) bool {
    var uniqueChars = [_]bool{false} ** 26;
    var count: usize = 0;
    for (str) |char| {
        var lowerChar: usize = char;
        if (char < 65) {
            continue;
        }
        if (char > 122) {
            continue;
        }
        if (char > 90 and char < 97) {
            continue;
        }
        if (char <= 90) {
            lowerChar += 32;
        }
        lowerChar -= 97;
        if (!uniqueChars[lowerChar]) {
            uniqueChars[lowerChar] = true;
            
            count += 1;
        }
    }
    
    return count == 26;
}
