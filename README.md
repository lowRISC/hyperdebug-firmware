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

This repository does not contain the Chromium EC source code.  Instead,
we reference Chromium's git repository at the commit that contains the
features we need for hyperdebug (this allows the hyperdebug firmware
release to be independent from EC releases).

To change the version of EC firmware used as hyperdebug firmware, update
the `git_repository` rule in [`//third_party/chromium/repos.bzl`](third_party/chromium/repos.bzl).

```
git_repository(
    name = "ec_src",
    remote = "https://chromium.googlesource.com/chromiumos/platform/ec",
    commit = "17c8bc295fb6c2a258efadb4a52f04a0f494ec0d",
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

To perform a release of the firmware, use the **Create Release** flow
in the **Actions** tab.  It is suggested that you use a `release_tag`
patterned after the build date: `YYYYMMDD_RR`, where:
- `YYYY` is the year.
- `MM` is the month.
- `DD` is the day.
- `RR` is the number of the release on that date, starting at `01`.
