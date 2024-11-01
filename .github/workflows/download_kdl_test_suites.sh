#!/usr/bin/env bash

set -ex

rm -rf vlib/kdl/tests/testdata/kdl-org

./v retry -- git clone -n https://github.com/kdl-org/kdl.git vlib/kdl/tests/testdata
git -C vlib/kdl/tests/testdata/kdl-org checkout de1dbd2
