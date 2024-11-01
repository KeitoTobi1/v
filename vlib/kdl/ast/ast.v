// Copyright (c) 2024 Keito Tobichi All rights reserved.
// Use of this source code is governed by an MIT license
// that can be found in the LICENSE file.
module ast

import kdl.input

@[heap]
pub struct Root {
pub:
	input input.Config
pub mut:
	node    Document
	comment Comments
}

pub fn (r Root) str() string {
	return ''
}
