const std = @import("std");
const util = @import("util.zig");

pub fn part1(input: []const u8) i32 {
    var count: i32 = 0;

    var last_value: i32 = -1;
    var lines = std.mem.split(u8, input, "\n");
    while (lines.next()) |line| {
        if (line.len == 0) continue;
        const value = util.parseInt(line);
        if (last_value != -1 and value > last_value) {
            count += 1;
        }
        last_value = value;
    }

    return count;
}

pub fn part2(input: []const u8) i32 {
    var count: i32 = 0;

    var last_values = [3]i32{ -1, -1, -1 };
    var lines = std.mem.split(u8, input, "\n");
    while (lines.next()) |line| {
        if (line.len == 0) continue;

        const value = util.parseInt(line);

        if (last_values[0] != -1 and value > last_values[0]) {
            count += 1;
        }

        var i: usize = 0;
        while (i < 2) : (i += 1) {
            last_values[i] = last_values[i + 1];
        }
        last_values[2] = value;
    }

    return count;
}

test "day 1 part 1" {
    const test_input =
        \\199
        \\200
        \\208
        \\210
        \\200
        \\207
        \\240
        \\269
        \\260
        \\263
    ;

    try std.testing.expectEqual(part1(test_input), 7);
}

test "day 1 part 2" {
    const test_input =
        \\199
        \\200
        \\208
        \\210
        \\200
        \\207
        \\240
        \\269
        \\260
        \\263
    ;

    try std.testing.expectEqual(part2(test_input), 5);
}
