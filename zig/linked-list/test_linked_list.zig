const std = @import("std");
const testing = std.testing;

const linked_list = @import("linked_list.zig");
const List = linked_list.LinkedList(usize);

test "pop gets element from the list" {
    var list = List{};
    var a = List.Node{ .data = 7 };
    list.push(&a);
    try testing.expectEqual(@as(usize, 7), list.pop().?.data);
}
