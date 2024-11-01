import os

const kdl_text = os.read_file(
	os.real_path(os.join_path(os.dir(@FILE), 'testdata', os.file_name(@FILE).all_before_last('.'))) +
	'.kdl') or { panic(err) }
