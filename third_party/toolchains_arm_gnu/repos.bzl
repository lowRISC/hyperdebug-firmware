# Copyright lowRISC contributors.
# Licensed under the Apache License, Version 2.0, see LICENSE for details.
# SPDX-License-Identifier: Apache-2.0

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def toolchains_arm_gnu_repos():
    http_archive(
        name = "rules_cc",
        urls = ["https://github.com/bazelbuild/rules_cc/releases/download/0.0.9/rules_cc-0.0.9.tar.gz"],
        sha256 = "2037875b9a4456dce4a79d112a8ae885bbc4aad968e6587dca6e64f3a0900cdf",
        strip_prefix = "rules_cc-0.0.9",
    )

    http_archive(
        name = "toolchains_arm_gnu",
        urls = [
            "https://github.com/hexdae/toolchains_arm_gnu/releases/download/v1.0.2/toolchains_arm_gnu-v1.0.2.tar.gz",
        ],
        strip_prefix = "toolchains_arm_gnu-1.0.2",
        sha256 = "62e4a770230aebcf5f62d63c6d221d2ef5969dd3188a0cd073e55ce61a5fab50",
    )
