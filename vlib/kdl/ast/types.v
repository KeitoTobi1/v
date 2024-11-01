// Copyright (c) 2024 Keito Tobichi All rights reserved.
// Use of this source code is governed by an MIT license
// that can be found in the LICENSE file.
module ast

import token
import net

pub type Identifier = Bare | Value

pub type Value = Bool | Number | Quoted | RawString | HashRaw | Null

pub type Annotation = Int8 | Int16 | Int32 | Int64 | IPv4 | UUID

pub type Comments = Comment | SlashDash

pub struct Document {
pub:
	nodes []Node
}

/*
 *  ```
 *	is_slashdash key argument property=val {
 *		children
 *	}
 *  ```
 */
pub struct Node {
pub mut:
	is_slashdash bool
	key          Value
	argument     []Argument
	property     []Property
	children     []Node
}

pub struct Property {
	key   Bare
	value Value
}

pub struct Argument {
pub:
	text []Value
}

pub struct Bare {
pub:
	text string
	pos  token.Pos
}

pub struct Comment {
pub:
	text string
	pos  token.Pos
}

pub struct SlashDash {
pub:
	text string
}

pub struct Null {
pub:
	text string
	pos  token.Pos
}

pub fn (n Null) str() string {
	return n.text
}

pub struct Bool {
	text bool
	pos  token.Pos
}

pub struct Number {
	text f64
	pos  token.Pos
}

pub struct Quoted {
pub mut:
	text string
}

pub struct RawString {
	text string
}

pub struct HashRaw {
	val string
}

pub struct IPv4 {
	val net.Ip
}

pub struct IPv6 {
	val net.Ip6
}

pub struct Int8 {
	val i8
}

pub struct Int16 {
	val i16
}

pub struct Int32 {
	val int
}

pub struct Int64 {
	val int
}

pub struct UUID {
	val string
}
