# Copyright lowRISC contributors.
# Licensed under the Apache License, Version 2.0, see LICENSE for details.
# SPDX-License-Identifier: Apache-2.0

load("@bazel_tools//tools/build_defs/repo:git.bzl", "git_repository")

def chromium_repos():
    git_repository(
        name = "ec_src",
        branch = "refs/changes/42/6217842/1",
        remote = "https://chromium.googlesource.com/chromiumos/platform/ec",
        build_file = "//third_party/chromium:BUILD.ec_src.bazel",
        patches = [
            "//third_party/chromium:ec-custom-version.patch",
            "//third_party/chromium:work-with-old-gcc-10.patch",
        ],
        patch_args = ["-p1"],
    )
