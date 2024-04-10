#! /usr/bin/sh

# Returns the CRC32 hash of the string input passed in as the first argument
# This is janky, send angry emails to: https://stackoverflow.com/questions/44804668/how-to-calculate-crc32-checksum-from-a-string-on-linux-bash#49446525
echo -n $1 | gzip -1 -c | tail -c8 | hexdump -n4 -e '"%08x"'
