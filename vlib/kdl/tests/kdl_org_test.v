// Instructions for developers:
// The actual tests and data can be obtained by doing:
// `git clone -n https://github.com/kdl-org/kdl.git vlib/kdl/tests/testdata/specs`
// `git -C vlib/kdl/tests/testdata/specs checkout de1dbd2`
// See also the CI toml tests
// Kept for easier handling of future updates to the tests
import os

fn test_kdl_org() {
	eprintln('> running ${@LOCATION}')
	test_root := '${@VROOT}/vlib/kdl/tests/testdata/kdl-org/tests/test_case'
	example_root := '${@VROOT}/vlib/kdl/tests/testdata/kdl-org/example'
	if os.is_dir(test_root) {
		input_files := os.walk_ext(os.join_path(test_root, 'input'), '.kdl')
		except_files := os.walk_ext(os.join_path(test_root, 'expect_kdl'), '.kdl')
		mut valid := 0

		println('${valid}/${input_files.len} KDL files were parsed correctly')
	} else {
		println('No test data directory found in "${test_root}"')
		assert true
	}
}
