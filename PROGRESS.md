# Goals: Milestone For [0.15.2]-[1.0.0]

This page outlines the specific technical standards and topics that must be documented to reach the next memoir version. 

## 🎯 Technical Content Goals

### 1. Naming Conventions
- [ ] Document the "Zig-way" for naming:
- [ ] Explain the rationale behind why Zig chooses these specific styles.

### 2. Variables and Constants
- [ ] `const` vs `var`: When to use which (favoring immutability).
- [ ] Type inference: How `const x = @as(u32, 5);` differs from `const x: u32 = 5;`.
- [ ] Explain "Undefined" initialization (`var x: i32 = undefined;`) and why it exists.

### 3. Data Structures: Arrays, Pointers, and Slices
- [ ] **Arrays**: Fixed-size memory blocks `[5]u32`.
- [ ] **Pointers**: Single-item pointers `*T` vs. Many-item pointers `[*]T`.
- [ ] **Slices**: The power of `[]T` (pointer + length) and why they are the "workhorse" of Zig.
- [ ] Visualizing the memory layout difference between all three.

### 4. Type Casting
- [ ] Safe casting with `@intCast` and `@floatCast`.
- [ ] Coercion (Peer Type Resolution).
- [ ] Explicitly handling truncation and overflow during casts.