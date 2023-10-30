const std = @import("std");
const testing = std.testing;

const secret_handshake = @import("secret_handshake.zig");

test "wink for 1" {
    const expected = &[_]secret_handshake.Signal{.wink};
    const actual = try secret_handshake.calculateHandshake(testing.allocator, 1);
    defer testing.allocator.free(actual);
    try testing.expectEqualSlices(secret_handshake.Signal, expected, actual);
}
