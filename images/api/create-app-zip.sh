#!/bin/bash

set -eu -o pipefail

git archive --format zip HEAD >app-api.zip
