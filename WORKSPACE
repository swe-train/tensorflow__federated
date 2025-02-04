# Dependencies for the TensorFlow Federated bazel environment.
#
# If you add a new or update a repository, follow these guidelines:
#
# *   Repositories must be deterministic (i.e., not a branch).
# *   Prefer to use an `http_archive` rule with a `sha256` parameter.
# *   Prefer for the repository to be a released product (i.e., a tag).
# *   Configuration must be documented when a commit is used instead of a
#     released product.

workspace(name = "org_tensorflow_federated")

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

#
# Direct dependencies
#

http_archive(
    name = "bazel_skylib",
    url = "https://github.com/bazelbuild/bazel-skylib/archive/refs/tags/1.3.0.tar.gz",
    sha256 = "3b620033ca48fcd6f5ef2ac85e0f6ec5639605fa2f627968490e52fc91a9932f",
    strip_prefix = "bazel-skylib-1.3.0",
)

http_archive(
    name = "com_github_grpc_grpc",
    url = "https://github.com/grpc/grpc/archive/refs/tags/v1.50.0.tar.gz",
    sha256 = "76900ab068da86378395a8e125b5cc43dfae671e09ff6462ddfef18676e2165a",
    strip_prefix = "grpc-1.50.0",
)

http_archive(
    name = "com_google_benchmark",
    url = "https://github.com/google/benchmark/archive/refs/tags/v1.8.3.tar.gz",
    sha256 = "6bc180a57d23d4d9515519f92b0c83d61b05b5bab188961f36ac7b06b0d9e9ce",
    strip_prefix = "benchmark-1.8.3",
)

http_archive(
  name = "com_google_cc_differential_privacy",
  url = "https://github.com/google/differential-privacy/archive/refs/tags/v3.0.0.tar.gz",
  sha256 = "6e6e1cd7a819695caae408f4fa938129ab7a86e83fe2410137c85e50131abbe0",
  strip_prefix = "differential-privacy-3.0.0/cc",
)

http_archive(
  name = "com_google_differential_privacy",
  url = "https://github.com/google/differential-privacy/archive/refs/tags/v3.0.0.tar.gz",
  sha256 = "6e6e1cd7a819695caae408f4fa938129ab7a86e83fe2410137c85e50131abbe0",
  strip_prefix = "differential-privacy-3.0.0",
)

# This commit is determined by
# https://github.com/tensorflow/tensorflow/blob/master/third_party/absl/workspace.bzl#L10.
http_archive(
    name = "com_google_absl",
    url = "https://github.com/abseil/abseil-cpp/archive/fb3621f4f897824c0dbe0615fa94543df6192f30.tar.gz",
    sha256 = "0320586856674d16b0b7a4d4afb22151bdc798490bb7f295eddd8f6a62b46fea",
    strip_prefix = "abseil-cpp-fb3621f4f897824c0dbe0615fa94543df6192f30",
)

http_archive(
    name = "com_google_googletest",
    url = "https://github.com/google/googletest/archive/refs/tags/release-1.12.1.tar.gz",
    sha256 = "81964fe578e9bd7c94dfdb09c8e4d6e6759e19967e397dbea48d1c10e45d0df2",
    strip_prefix = "googletest-release-1.12.1",
)

http_archive(
    name = "com_google_protobuf",
    url = "https://github.com/protocolbuffers/protobuf/archive/refs/tags/v3.21.9.tar.gz",
    sha256 = "1add10f9bd92775b91f326da259f243881e904dd509367d5031d4c782ba82810",
    strip_prefix = "protobuf-3.21.9",
)

# TODO: b/333391041 - Temporarily disable the direct dependency on
# `eigen`, for now we pick this dependency up from the TensorFlow workspace.
# http_archive(
#     name = "eigen",
#     url = "https://gitlab.com/libeigen/eigen/archive/refs/tags/3.4.0.tar.gz",
#     sha256 = "",
#     strip_prefix = "eigen-3.4.0",
#     build_file = "//third_party/eigen:eigen.BUILD",
#     repo_mapping = {
#         "@eigen": "@eigen_archive",
#     },
# )

# The version of TensorFlow should match the version in
# https://github.com/google-parfait/tensorflow-federated/blob/main/requirements.txt.
http_archive(
    name = "org_tensorflow",
    url = "https://github.com/tensorflow/tensorflow/archive/refs/tags/v2.14.0.tar.gz",
    patches = [
        # Depending on restricted visibility BUILD target om external git
        # repository does not seem to be supported.
        # E.g. issue: https://github.com/bazelbuild/bazel/issues/3744
        # TODO: b/263201501 - Make DTensor C++ API public and remove this patch.
        "//third_party/tensorflow:dtensor_internal_visibility.patch",
        "//third_party/tensorflow:internal_visibility.patch",
        "//third_party/tensorflow:python_toolchain.patch",
        "//third_party/tensorflow:tf2xla_visibility.patch",
    ],
    sha256 = "ce357fd0728f0d1b0831d1653f475591662ec5bca736a94ff789e6b1944df19f",
    strip_prefix = "tensorflow-2.14.0",
)

http_archive(
    name = "pybind11_abseil",
    url = "https://github.com/pybind/pybind11_abseil/archive/38111ef06d426f75bb335a3b58aa0342f6ce0ce3.tar.gz",
    sha256 = "6b669901b2ea8b302533c76439d260e502977b1e67c13ddae4cd1a7d7ca1db6a",
    strip_prefix = "pybind11_abseil-38111ef06d426f75bb335a3b58aa0342f6ce0ce3",
)

http_archive(
    name = "pybind11_bazel",
    url = "https://github.com/pybind/pybind11_bazel/archive/refs/tags/v2.11.1.tar.gz",
    sha256 = "e8355ee56c2ff772334b4bfa22be17c709e5573f6d1d561c7176312156c27bd4",
    strip_prefix = "pybind11_bazel-2.11.1",
)

http_archive(
    name = "pybind11_protobuf",
    url = "https://github.com/pybind/pybind11_protobuf/archive/80f3440cd8fee124e077e2e47a8a17b78b451363.tar.gz",
    sha256 = "ba2c54a8b4d1dd0a68c58159e37b1f863c0d9d1dc815558288195493bcc31682",
    strip_prefix = "pybind11_protobuf-80f3440cd8fee124e077e2e47a8a17b78b451363",
)

http_archive(
    name = "rules_license",
    url = "https://github.com/bazelbuild/rules_license/archive/refs/tags/0.0.8.tar.gz",
    sha256 = "8c1155797cb5f5697ea8c6eac6c154cf51aa020e368813d9d9b949558c84f2da",
    strip_prefix = "rules_license-0.0.8",
)

http_archive(
    name = "rules_python",
    url = "https://github.com/bazelbuild/rules_python/archive/refs/tags/0.23.0.tar.gz",
    sha256 = "8272287b125a23bfc79650ecbbc045ebcaee4d632338b1a50aad34357bcbadce",
    strip_prefix = "rules_python-0.23.0",
)

#
# Inlined transitive dependencies, grouped by direct dependency.
#

# Required by pybind11_abseil and pybind11_protobuf.
http_archive(
    name = "pybind11",
    url = "https://github.com/pybind/pybind11/archive/refs/tags/v2.9.2.tar.gz",
    sha256 = "6bd528c4dbe2276635dc787b6b1f2e5316cf6b49ee3e150264e455a0d68d19c1",
    strip_prefix = "pybind11-2.9.2",
    build_file = "@pybind11_bazel//:pybind11.BUILD",
)

# Required by com_github_grpc_grpc. This commit is determined by
# https://github.com/grpc/grpc/blob/v1.50.0/bazel/grpc_deps.bzl#L344.
http_archive(
    name = "upb",
    url = "https://github.com/protocolbuffers/upb/archive/e4635f223e7d36dfbea3b722a4ca4807a7e882e2.tar.gz",
    sha256 = "017a7e8e4e842d01dba5dc8aa316323eee080cd1b75986a7d1f94d87220e6502",
    strip_prefix = "upb-e4635f223e7d36dfbea3b722a4ca4807a7e882e2",
)

#
# Transitive dependencies, grouped by direct dependency.
#

load("@org_tensorflow//tensorflow:workspace3.bzl", "tf_workspace3")

tf_workspace3()

load("@org_tensorflow//tensorflow:workspace2.bzl", "tf_workspace2")

tf_workspace2()

load("@org_tensorflow//tensorflow:workspace1.bzl", "tf_workspace1")

tf_workspace1()

load("@org_tensorflow//tensorflow:workspace0.bzl", "tf_workspace0")

tf_workspace0()

load("@com_google_protobuf//:protobuf_deps.bzl", "protobuf_deps")

protobuf_deps()

# Unable to load the `grpc_extra_deps` from gRPC because they conflict with the
# dependencies required by TensorFlow.
load("@com_github_grpc_grpc//bazel:grpc_deps.bzl", "grpc_deps")

grpc_deps()
