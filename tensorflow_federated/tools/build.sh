#!/usr/bin/env bash
# Copyright 2024, The TensorFlow Federated Authors.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
set -e

usage() {
  local script_name=$(basename "${0}")
  local options=(
  )
  echo "usage: ${script_name} ${options[@]}"
  exit 1
}

main() {

  # Create a working directory.
  local temp_dir="$(mktemp -d)"
  trap "rm -rf ${temp_dir}" EXIT
  # local temp_dir="/tmp/tff"
  # rm -rf "${temp_dir}"

  # Create an environment.
  # local copybara='/google/data/ro/teams/copybara/copybara'
  /google/data/ro/teams/copybara/copybara \
      "tensorflow_federated/copy.bara.sky" \
      test_local \
      "${PWD}/.." \
      --folder-dir "${temp_dir}"
  # cd "${temp_dir}"

  docker run \
      -v "${temp_dir}:/tmp/tff" \
      --rm \
      -ti tensorflow/build:latest-python3.11


  exit

  cd "/tmp/tff"
  bazel test \
      --build_tag_filters="-nokokoro,-nopresubmit" \
      --test_size_filters=small,medium,large \
      --test_timeout_filters=short,moderate,long \
      --test_tag_filters="-nokokoro,-nopresubmit" \
      //tensorflow_federated/python/core/impl/types/...
}

main "$@"
