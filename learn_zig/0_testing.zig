//! This module is all about testing in zig:-
//! - using the keyword test
//! - running a test from terminal
//! - using the `std.testing` module



// -------------------------------------------------------------------------------------------------



// importing the standard library
const std = @import("std");

// setting up aliases
const testing = std.testing;
const assert = std.debug.assert;
const dPrint = std.debug.print;



// -------------------------------------------------------------------------------------------------



// you use the keyword `test` to declare a block of code as a test following this format:-
test "name_of_test" {
    // code
}



// -------------------------------------------------------------------------------------------------



// to run a specific test in a file run: zig test file.zig --test-filter "name_of_test"
// TIP: remember file.zig is the relative path from the directory you are running `zig test` from.

// to run all the tests in a file run in terminal: zig test file.zig



// -------------------------------------------------------------------------------------------------



// DONOT: when trying to assert a final result in a test we do not use std.debug.assert
test "assertion_test_incorrect" { // ❌
    const num: u8 = 100; // ❌
    assert(num > 0); // ❌
}
// - blocks the flow of execution
// - if even one assert fails, it triggers thread panic, all the remaining tests can't be executed.

// So instead use `std.testing.expect` this raises `error.TestUnexpectedResult` and not a @panic
test "assertion_test_correct" {
    const num: u8 = 100;
    try testing.expect(num == 100);
}



// -------------------------------------------------------------------------------------------------



// ALTR: 
// usually if you take this conventional approach you often get this verbose of a trace

// /home/user/dev/tools/zig-0.15.2/lib/std/testing.zig:607:14: 0x1127ae9 in expect (std.zig)
//     if (!ok) return error.TestUnexpectedResult;
//              ^
// /home/user/dev/zig/lzig/learn_zig/0_testing.zig:42:5: 0x1127b48 in test.assertion_test_correct (0_testing.zig)
//     try testing.expect(num < 0);
//     ^

// you can instead catch this error and print it out 
test "print_assertion_result" {
    const num: u8 = 100;
    testing.expect(num != 100) catch |err| try dealWithError(err, @src().fn_name);   
}

// function that prints the test failed message
fn dealWithError(err: anyerror, test_name: []const u8) !void {
    if ( err != error.TestUnexpectedResult ) return err;
    dPrint("{s} failed!\n", .{ test_name });
}

// now the trace is literally a two lines big: -

// test.print_assertion_result failed!
// All 4 tests passed.

// WARNING: This generally discouraged in Zig because zig test will report "All tests passed," 
// which can be dangerous if you miss a print.

// -------------------------------------------------------------------------------------------------



// here are some other `std.testing` functions that you can use for assertions inside tests
test "other_expect_functions" {
    // same as test.expect(100 == 100) catch |err| try dealWithError(err, @src().fn_name);
    testing.expectEqual( 100, 100) catch |err| try dealWithError(err, @src().fn_name);
    // same as test.expectEqual but you can't use it for error hence this one.
    testing.expectError( error.Random, randomError()) catch |err| {
        try dealWithError(err, @src().fn_name);
    };
}

// function to return an error
fn randomError() !void {
    if (true) { return error.Random; }
}



// -------------------------------------------------------------------------------------------------



// SUMMARY:
// - use keyword `test` to create a test block in zig
// - use `zig test <file-name>` to run the test from terminal
// - use `zig test <file-name> --test-filter <test-name>` to run a specific test
// - use `std.test.expect` for an assertion inside a test block
// - print the test fails by catching the `error.TestUnexpectedResult` and using `@src().fn_name` to
//  obtain the name of test inside the test block. If you wish to skip the verbosity of fail results.
// - use `std.testing.expectEqual` to do a comparison
// - use `std.testing.expectError` to do a comparison in an error and union of this error with a value.