load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def crt_repos(local = None):
    if local:
        native.local_repository(
            name = "crt",
            path = local,
        )
    else:
        maybe(
            http_archive,
            name = "crt",
            url = "https://github.com/lowRISC/crt/archive/refs/tags/v0.3.8.tar.gz",
            sha256 = "2501ab58709946df1421ce5901710d880900912b05e04f9f4e6f2c1c3c7d12e0",
            strip_prefix = "crt-0.3.8",
        )
