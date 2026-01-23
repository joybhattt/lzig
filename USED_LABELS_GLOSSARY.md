# Project Glossary & Conventions

This document explains the custom markers used throughout this learning resource. These tags are designed to help you distinguish between "working code" and "idiomatic/optimized code."

---

## 🏷️ Custom Tags

| Tag | Full Form | Purpose |
| :--- | :--- | :--- |
| **SRC:** | Source | Highlights the origin of a concept, documentation, or external library. |
| **ALTR:** | Alternatively | Shows an equivalent or "same as" approach to a problem. |
| **TIP:** | Tip | Advice on a better, more idiomatic way to handle a task. |
| **OPTIMIZE:** | Optimize | Guidance on performance, memory layout, or `comptime` efficiency. |
| **DONOT:** | Disclaimer | Critical warnings about anti-patterns or dangerous logic. |
| **SUMMARY:** | Summary | A condensed recap of the current section's key points. |
| **WARNING:** | Important | Warning or Disclaimer related to an adjacent topic. |

---

## 🛠️ Usage Examples

### 1. Citing Origins
```zig
// SRC: [https://ziglang.org/documentation/master/#Allocators](https://ziglang.org/documentation/master/#Allocators)
// Logic for custom arena allocator starts here.