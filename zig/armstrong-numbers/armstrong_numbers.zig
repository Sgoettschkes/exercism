const std = @import("std");
const math = std.math;

pub fn isArmstrongNumber(num: u128) bool {
    var tmpNum: u128 = num;
    var count: u128 = 0;
    while (tmpNum > 0) {
        tmpNum /= 10;
        count += 1;
    }
    tmpNum = num;
    var sum: u129 = 0;
    while (tmpNum > 0): (tmpNum /= 10) {
        var digit = tmpNum % 10;
        sum += math.pow(u128, digit, count);
    }
    return num == sum;
}
