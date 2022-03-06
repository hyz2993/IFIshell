## mediainfo wav
for file in */*x*/; do echo "$file" && mediainfo "$file"*.wav>>mediainfo_a.txt; done

## mediainfo image
for file in */*x*/; do echo "$file" && mediainfo "$file"*6400.dpx>>mediainfo_v.txt; done