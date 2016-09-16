#!/bin/bash
#       author: thewalnutbowl
# requirements: Mac OS X
#  description: Optimize all PNG images in a given folder.
#

# Check usage
if [ $# -eq 1 ]; then
  echo "--- Optimizing PNG images in $1 ---"
  for f in $(find $1/* -name "*.png"); do
    filename=$(basename "$f")
    path=${f%/*}
    new_filename_plus_path="$path/reduced-$filename"
    #./pngcrush -reduce -brute $f $new_filename_plus_path
    /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/usr/bin/pngcrush -reduce -brute $f $new_filename_plus_path
    mv $new_filename_plus_path $f
  done
else
  echo "Usage: ./img-opt <path/to/png/images>"
fi

# Done!
exit

