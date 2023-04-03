# Hyperdebug Firmware

This repository provides the build and release process for the hyperdebug
firmware used by the [OpenTitan](https://github.com/lowRISC/opentitan)
project.  Hyperdebug is a standard
[NUCLEO-L552ZE-Q](https://www.st.com/en/evaluation-tools/nucleo-l552ze-q.html)
board that provide debug and I/O connectivity with the OpenTitan FPGA
development board.

The hyperdebug firmware is a variant of the [Chromium
EC](https://chromium.googlesource.com/chromiumos/platform/ec) firmware.

## Updating

This repository does not contain the Chromium EC source code.  Instead, we
reference Chromium's git repository at the given commit that contains the
features we need for hyperdebug (this allows the hyperdebug firmware 
release to be independent from EC releases).

To change the version of EC firmware used as hyperdebug firmware, update
the `git_repository` rule in [`//third_party/chromium/repos.bzl`](third_party/chromium/repos.bzl).

```
git_repository(
    name = "ec_src",
    remote = "https://chromium.googlesource.com/chromiumos/platform/ec",
    commit = "43df33b4e57591c0b215ae01474d8c92597306a5",
    build_file = "//third_party/chromium:BUILD.ec_src.bazel",
)
```

After updating the rule, build and release the new firmware.

## Building

To build the hyperdebug firmware, issue the following command:

```
bazel build :hyperdebug-firmware
```

This will emit a `hyperdebug-firmware.tar.gz` archive containing the firmware
binary and support files.

## Releasing

To perform a release of the firmware, issue the following command:

```
bazel run :release -- ${VERSION_TAG}
```

This will build the firmware archive, create a git tag and publish the
release artifacts to github.
