#!/usr/bin/bash

# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
#  CONSTANTS
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
# EXIT CODES
readonly GENERAL_ERROR_EXIT_CODE=1


# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
#  HELPER FUNCTIONS
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
# ●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●
# Purpose:  Terminate script execution immediately with an error message and
#           non-zero exit status.
#
# Behavior: - Prints formatted error message to STDERR (not STDOUT)
#           - Ensures errors are visible even when output is redirected
#           - Exits script with status code 1 (general error exit code)
#           - Supports dynamic error messages via function arguments
#
# Usage:    die "Database connection failed"
#           die "File not found: ${filename}"
#           die "Expected 2 arguments, got $#"
# ●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●
die() {
    # All die print messages contain '[ERROR]' as a prefix.
    #
    # Why $* instead of $1?
    # - Flexibility: Allows callers to pass multiple arguments that get automatically
    #   concatenated into a single error message.
    # - Natural syntax: die "File" $filename "not found" works without
    #   manual string concatenation or quoting.
    # - Future-proof: Accommodates complex error messages that might need to
    #   combine literals and variables naturally.
    #
    # The '>&2' syntax redirects output from STDOUT (file descriptor 1)
    # to STDERR (file descriptor 2). This ensures error messages are
    # properly separated from normal program output streams.
    echo "[ERROR] $*" >&2
    
    # Exit with relevant code
    exit $GENERAL_ERROR_EXIT_CODE
}

bash bash/0_preinstall_odb_19c.sh || die "Preinstall script could not be run."
bash bash/1_configure_odb.sh || die "Configuration script could not be run."
bash bash/2_download_odb_19c.sh || die "Package download script could not be run."