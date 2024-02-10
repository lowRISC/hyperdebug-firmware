# Copyright lowRISC contributors.
# Licensed under the Apache License, Version 2.0, see LICENSE for details.
# SPDX-License-Identifier: Apache-2.0

load("@bazel_tools//tools/build_defs/repo:git.bzl", "git_repository")

def chromium_repos():
    git_repository(
        name = "ec_src",
        remote = "https://chromium.googlesource.com/chromiumos/platform/ec",
        commit = "a8f2dc71df133c3474ab977d7e3b278fe22a6a99",
        build_file = "//third_party/chromium:BUILD.ec_src.bazel",
        patches = [
            "//third_party/chromium:ec-custom-version.patch",
        ],
        patch_args = ["-p1"],
    )
