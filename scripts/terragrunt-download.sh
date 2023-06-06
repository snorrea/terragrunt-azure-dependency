# ---------------------------------------------------------------------------------------------------------------------
# THIS SCRIPT DOWNLOADS AND INSTALLS TERRAGRUNT
#
# Required envirnoment variable:
# TERRAGRUNT_VERSION      - The version of terragrunt
# TERRAGRUNT_DOWNLOAD_SHA - The sha256sum of the downloaded file
# ---------------------------------------------------------------------------------------------------------------------

#!/usr/bin/env bash
set -euo pipefail

# Download the binary file and save it as 'terragrunt'
mkdir terragrunt
cd terragrunt
curl -SL "https://github.com/gruntwork-io/terragrunt/releases/download/v0.46.1/terragrunt_linux_amd64" --output terragrunt
