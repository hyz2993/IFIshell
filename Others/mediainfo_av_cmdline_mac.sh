## mediainfo wav
for file in */*x*/; do echo "$file" && mediainfo "$file"*.wav>>mediainfo_a.txt; done

## mediainfo dpx image
for file in */*x*/; do echo "$file" && mediainfo "$file"*6400.dpx>>mediainfo_dpx.txt; done

## mediainfo mkv (SIPped, could take a while as the file will be large)
for file in oe*/*/objects/; do echo "$file" && mediainfo "$file"*.mkv>>mediainfo_mkv.txt; done