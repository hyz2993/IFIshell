# IFIshells
IFIshells is to store some bash shells (mac) working for adjusting objects structure, looping IFIscripts for validation, SIP generatiion and further usage.

*All the Bash scripts are for the specific function. You may not run them for different purposes, formats, or even paths.*

*For most of the scripts, they have comments inside the scripts.*

**For all the destination, the path shouldn't have any space**
*While if there is any, reference batch_validate_uni.sh for ' -> \ '*

## `bat_mkv2h264nprores.sh`
**Put this script inside the folder including SIPs, and drag it into the terminal to run**
It will get all the mkv file in the SIP/uuid/object/*.mkv, 
- trancoding them to h264/mov and ProRes/mov, 
- naming with their OE number and format (ie. oe12345_h264.mov) 
- and moving them into a new 'proxy' folder.

## `downres2k_batch_cmdline.sh`
**Put this script inside of the folder including MOVs**
This is just simple command line using ffmpeg transcoding from 4k to 2k. The new files named with '_2kconvert' extension.



- For **Guinness** Projects:
  - **batch_validate.sh** is for looping validate.py on a single batch (/parent folder)
  - **batch_seq2ffv2.sh** is for looping seq2ffv2.py which SIPping the material
  - **bat_mkv2h264nprores.sh** is for transcoding mkv to h264 and ProRes proxies in order to do the **Colour Grading**.
  - **downres2k_batch_cmdline.sh** is for proxies with 4k Resolution down to 2k so the tools won't read it for too long.
  - **mediainfo_av_cmdline_mac.sh** is for looping mediainfo for a whole batch (/folder). It can run for wav, dpx, and mkv, and creates txt files for the results.
  
  *continue*
