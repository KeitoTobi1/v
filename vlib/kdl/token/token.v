// Copyright (c) 2024 Keito Tobichi All rights reserved.
// Use of this source code is governed by an MIT license
// that can be found in the LICENSE file.
module token

pub struct Token {
pub:
	kind    Kind
	lit     string
	pos     int
	col     int
	line_nr int = 1
	len     int
}

pub enum Kind {
	unknown
	eof
	bare
	boolean
	plus
	minus
	slash
	asterisk
	whitespace
	newline
	tab
	cr
	lf
	crlf
	lcbr // {
	rcbr // }
	double_quote
	semicolon
	backslash
	slashdash
	comment
	raw_str  // r""
	raw_hash // r#""#
	hash_str     // #
	l_paren
	r_paren
	__end__
}
