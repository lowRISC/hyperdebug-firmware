#!/usr/bin/bash
# Copyright lowRISC contributors.
# Licensed under the Apache License, Version 2.0, see LICENSE for details.
# SPDX-License-Identifier: Apache-2.0

# Transform the status files into env vars and eval them.
eval $(sed -e "s/ /=\"/" -e "s/$/\"/" bazel-out/volatile-status.txt)
eval $(sed -e "s/ /=\"/" -e "s/$/\"/" bazel-out/stable-status.txt)

if [[ ${BUILD_SCM_STATUS} != "clean" ]]; then
    clean="-${BUILD_SCM_STATUS}"
else
    clean=""
fi

ver="hyperdebug_${BUILD_GIT_VERSION}${clean}"
ver32="${ver:0:31}"

cat <<EOF
/* This file was generated by //util:custom_version. */
#define CROS_EC_VERSION32 "${ver32}"
#define CROS_ECTOOL_VERSION "${ver32}"
#define CROS_STM32MON_VERSION "${ver32}"

#define VERSION "${ver}"
#define BUILDER "${BUILD_USER}@${BUILD_HOST}"
#define DATE "${BUILD_TIMESTAMP}"

#define CROS_FWID_MISSING_STR "CROS_FWID_MISSING"
/* CrOS FWID is not available for this build */
#define CROS_FWID32 CROS_FWID_MISSING_STR
EOF
