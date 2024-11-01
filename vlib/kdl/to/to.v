// Copyright (c) 2024 Keito Tobichi All rights reserved.
// Use of this source code is governed by an MIT license
// that can be found in the LICENSE file.
module to

import kdl
import encoding.xml
import x.json2

const literal_json = '_'
const array_json = 'array'
const dict_json = 'dict'

pub fn from_xml(doc xml.XMLDocument) {
}

fn any_to_xml(a kdl.Any) string {
	match a {
		kdl.Null {
			return 'null'
		}
		else {
			return ''
		}
	}
}

pub fn json() string {
	return ''
}

fn any_to_json(a kdl.Any) string {
	match a {
		kdl.Null {
			return 'null'
		}
		else {
			return ''
		}
	}
}
