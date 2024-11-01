// Copyright (c) 2024 Keito Tobichi All rights reserved.
// Use of this source code is governed by an MIT license
// that can be found in the LICENSE file.
module scanner

import kdl.token
import kdl.util

pub const extra_digits = [`_`, `b`, `o`, `x`, `e`, `E`]
pub const end_of_text = u32(~0)

pub struct Scanner {
	text string
mut:
	pos     int
	line_nr int = 1
	col     int
}

pub struct State {
pub:
	col     int
	line_nr int = 1
	pos     int
}

// scan returns the next token from the input.
pub fn (mut s Scanner) scan() !token.Token {
	for {
		c := s.next()
		byte_c := u8(c)
		ascii := byte_c.ascii_str()
		if c == end_of_text {
			s.inc_line_number()
			return s.new_token(.eof, '', 1)
		}
		match rune(c) {
			` `, `\t`, `\n`, `\r` {
				if c == `\n` {
					s.inc_line_number()
					util.printdbg(@MOD + '.' + @STRUCT + '.' + @FN, 'incremented line nr to ${s.line_nr}')
				}
				if c == ` ` {
					s.new_token(token.Kind.whitespace, ascii, ascii.len)
				}
			}
			`/` {
				if s.peek(1) == `/` {
					start := s.pos + 1
					mut comment_line_end := s.pos
				} else if s.peek(1) == `-` {
					// return slashdash.
					next := u8(s.peek(1)).ascii_str()
					return s.new_token(token.Kind.slashdash, ascii + next, 2)
				} else if s.peek(1) == `*` {
					starts := s.pos + 2
					start_line := s.line_nr
				}
			}
			`"`, `'` {}
			`#` {

			}
			`r` {
				
			}
			`\\` {
				s.new_token(.backslash, ascii, ascii.len)
			}
			`{` {
				s.new_token(.lcbr, ascii, ascii.len)
			}
			`}` {
				s.new_token(.rcbr, ascii, ascii.len)
			}
			`;` {
				s.new_token(.semicolon, ascii, ascii.len)
			}
			else {}
		}
	}
	return s.new_token(.unknown, '', 0)
}

pub fn (mut s Scanner) reset() {
	s.pos = 0
	s.col = 0
	s.line_nr = 1
}

// at returns the *current* character code from the input text.
// at returns `end_of_text` if it can't get the current character.
// unlike `next()`, `at()` does not change the state of the scanner.
@[direct_array_access; inline]
pub fn (s &Scanner) at() u32 {
	if s.pos < s.text.len {
		return s.text[s.pos]
	}
	return end_of_text
}

fn (mut s Scanner) new_token(kind token.Kind, lit string, len int) token.Token {
	mut col := s.col - len + 1
	return token.Token{
		kind:    kind
		lit:     lit
		col:     col
		line_nr: s.line_nr + 1
		pos:     s.pos
		len:     len
	}
}

fn (s &Scanner) at_crlf() bool {
	return s.at() == `\r` && s.peek(1) == `\n`
}

// inc_line_number incrases the internal line number.
@[inline]
fn (mut s Scanner) inc_line_number() {
	s.col = 0
	s.line_nr++
}

@[direct_array_access; inline]
pub fn (s &Scanner) peek(n int) u32 {
	if s.pos + n < s.text.len {
		// Allow peeking back - needed for spaces between date and time in RFC 3339 format :/
		if n - 1 < 0 && s.pos + n - 1 >= 0 {
			// util.printdbg(@MOD + '.' + @STRUCT + '.' + @FN, 'LOOKING BAAAA-AACK - OOOVER MY SHOOOOULDEEEER "${s.text[s.pos + n-1]}"')
			return s.text[s.pos + n - 1]
		}
		return s.text[s.pos + n]
	}
	return end_of_text
}

// next returns the next character code the input text
// next returns `end_of_text` if it can't reach the next character.
pub fn (mut s Scanner) next() u32 {
	if s.pos < s.text.len {
		opos := s.pos
		s.pos++
		s.col++
		c := s.text[opos]
		return c
	}
	return end_of_text
}
