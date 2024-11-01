module util

@[if trace_kdl ?]
pub fn printdbg(id string, message string) {
	eprintln(id + ' ' + message)
}
