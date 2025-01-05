# Lua Metatable Unexpected Nil Error

This repository demonstrates a subtle bug in Lua involving metatables, nil checks, and unexpected nil errors.  The issue arises from the order of operations and how Lua handles metatable lookups when a nil check is present.

## Bug Description

A function may perform a nil check before accessing table fields, but due to the way metatables are processed, a `nil` error can still occur if the table itself exists but lacks the expected field.  This is particularly relevant when dealing with metatables that dynamically generate values.

## How to Reproduce

1.  Clone the repository.
2.  Run `bug.lua`.  You'll observe an unexpected `attempt to index a nil value` error even though a nil check is present.
3. Run `bugSolution.lua` to see the corrected version

## Solution

The solution lies in properly handling the possibility of a missing field in the metatable lookup and either using pcall or adding another nil check before accessing a member of a metatable to handle the nil case.