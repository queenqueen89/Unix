# Produce Unique Filenames
# Usage: bash species.sh Filename

cut -d , -f 2 "$@" | sort | uniq
