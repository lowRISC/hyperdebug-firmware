# Copyright lowRISC contributors.
# Licensed under the Apache License, Version 2.0, see LICENSE for details.
# SPDX-License-Identifier: Apache-2.0

load("//third_party/chromium:repos.bzl", "chromium_repos")

sources = module_extension(
    implementation = lambda ctx: chromium_repos(),
)
