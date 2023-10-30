const std = @import("std");
const print = @import("std").debug.print;
const mem = std.mem;
const ArrayList = std.ArrayList;

pub const Signal = enum {
    wink,
    double_blink,
    close_your_eyes,
    jump,
};

pub fn calculateHandshake(allocator: mem.Allocator, number: isize) mem.Allocator.Error![] Signal {
    var binary: [5]u8 = undefined;
    std.mem.copy(u8, binary[0..], "00000");
    var curNum: isize = number;
    var curMultiple: isize = 16;
    var i: usize = 0;
    while (curMultiple >= 1) {
        if (curNum >= curMultiple) {
            std.mem.copy(u8, binary[i..], "1");
        }
        curNum -= curMultiple;
        curMultiple = @divFloor(curMultiple, 2);
        i += 1;
    }

    print("{s}", .{binary});

    var result = try allocator.alloc(Signal, 1);

    result[0] = .wink;

    return result;
}
