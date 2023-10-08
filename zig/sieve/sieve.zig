const std = @import("std");
const print = std.debug.print;

pub fn primes(buffer: []u32, limit: u32) []u32 {
    var sieve = [_]bool{true} ** 1001;
    sieve[0] = false;
    sieve[1] = false;

    if (limit < 2) {
        return &[_]u32{};
    }

    var primeCount: u32 = 0;
    var i: u32 = 2;
    while (i <= limit) : (i += 1) {
        if (sieve[i]) {
            buffer[primeCount] = i;
            primeCount += 1;
        }

        var multiple: u32 = 2 * i;
        while (multiple <= limit) {
            sieve[multiple] = false;
            multiple += i;
        }
    }

    return buffer[0..primeCount];
}
