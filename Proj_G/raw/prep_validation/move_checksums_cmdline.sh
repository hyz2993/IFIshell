## move a&v md5 to *x*/
for dir in *; do echo $dir && mv "$dir"*.md5 "$dir"/*x*; done

## move wav md5 from *x*/ to Wav/
for dir in *; do echo $dir && mv "$dir"/*x*/*.wav.md5 "$dir"/Wav; done

## move wav from *x*/ to Wav/
for dir in *; do echo $dir && mv "$dir"/*x*/*.wav "$dir"/Wav; done

## rename manifest
for dir in *-*/*x*/; do echo $dir && mv "$dir"*.md5 "$dir"CHECKSUM.md5; done