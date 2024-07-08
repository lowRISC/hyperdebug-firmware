# Copyright lowRISC contributors.
# Licensed under the Apache License, Version 2.0, see LICENSE for details.
# SPDX-License-Identifier: Apache-2.0

load("@toolchains_arm_gnu//:deps.bzl", "arm_none_eabi_deps")

def toolchains_arm_gnu_deps():
    arm_none_eabi_deps()
