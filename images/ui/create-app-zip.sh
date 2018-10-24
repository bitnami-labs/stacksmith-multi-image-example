#!/bin/bash

set -eu -o pipefail

cd html
git archive --format zip HEAD >../app-ui.zip
