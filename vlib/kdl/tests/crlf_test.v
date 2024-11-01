import kdl

pub fn test_crlf() {
	str_value = 'test_string'
	mut kdl_txt := 'test {\r\n
\tfoo = "test_string"\r\n
}\r\n
// Comment with CRLF is not allowed'
	kdl_doc := kdl.parse_text(str_value) or { panic(err) }
	node := kdl_doc.get_node('test')
	value := node.get_string('foo')
	assert value == str_value
}
