# IFIshells
IFIshells is to store bash shells (mac, git bash) and .bat processing files (windows) working for adjusting objects structure, looping **IFIscripts** and further usage.

*All the Bash scripts are for the specific function. You may not run them for different purposes, formats, or even paths.*

*For most of the scripts, they have comments inside the scripts.*

**For all the destination, the path shouldn't have any space**
*While if there has to be, reference batch_validate_uni.sh for ' -> \ '*

- For <strong>Proj_B</strong>:
  - **multiMov2dip.sh** is for all AIPs with multiple .mov objects copied to the mezzanines directory and rename to ${aaa}_${index}.mov
  - *THis project has been completed and closed. Scripts are no longer mantained.*

- For <strong>Proj_G</strong>:
  - **batch_validate.sh** in the *raw/prep_validation* dir is for manually comparing the audio checksums, merging A&V files into the same folder, moving, and renaming the manifest out of the material directory, reformating the manifest structure for validation, and then run **validate.py from IFIscripts** for a batch of the materials. The script needs to copied within the batch folder to find materials. (all psms are named with "C-...", change it if needed)
  - **batch_validate_uni.sh** in the *raw/prep_validation* dir is a universal version of `batch_validate.sh` with more comments and updates in the script. It is able to compare audio checksums audomatically. The manifest renaming function has been commented out. The result of loin the *prep_validation* diroping `validate.py` from IFIscripts will be exported to a text file in the batch folder. An error list will also present at the end of the text file.
  - **batch_validate_prores.sh** in the *treated/validation* dir is a version of `batch_validate_uni.sh` for treated ProRes materials. It will automatically check compare the manifest and the PrRes and print out the mismatched results to both terminal and validation_result.txt in the batch folder. 
  - **move_checksums_cmdline.sh** in the *raw/prep_validation* dir is not a script but only several bash commandlines for rolling the structure back to psm structure, including moving a&v manifest back to img seq folder, moving audio manifest from img seq folder back to audio folder, moving audio from img seq folder back to audio folder, and renaming image manifest back to its original name.
  - **batch_seq2ffv1.bat** in the *sip* dir is the latest version of **batch_seq2ffv2.sh** for Windows platform. It loop runs **seq2ffv1.py from IFIscripts** to sip the image sequence (with audio). It will ask username, start object entry number, and destination. You will need to relocate the terminal to the source directory first, and it will show the source again before asking the destination. Once finished, it will open the destination folder and print out finished message.
  - **batch_seq2ffv1.sh** in the *raw/sip* dir is the latest version of **batch_seq2ffv2.sh** for Mac platform. Usage is the same as above. While it doesn't have input re-present and finished steps.
  - **check_losslessness.sh** in the *raw/sip* dir is for checking the log in the SIP folder, get the `eventOutcome` line of the sipping losslessness, and print out the results for SIPs in a batch. It will also print out a final result at the end of the script. The script needs to copied within the batch folder to find SIPs.
  - **structure_check.bat** in the *raw/sip* dir is for getting the tree for each SIP (can also use for treated materials and AIPs ). The script needs to copied within the batch folder to find SIPs. User needs to check the structure manually.
  - **mediainfo_av_cmdline_mac.sh** is for looping mediainfo for a whole batch (/folder). It can run for wav, dpx, and mkv, and creates txt files for the results.
  - `seq2ffv2.py`, `batch_seq2ffv2_es2.sh`, and `batch_seq2ffv2_untreated.sh` in `Proj_G/outdated/` have been outdated as `seq2ffv1.py` from **IFIscripts** has already been updated with `-oe` and `-user` for loop running
  
- For <strong>proxies</strong>:
  - **bat_mkv2h264nprores.sh** is for transcoding (raw/untreated SIP) mkv to h264 and ProRes mov proxies in order to do the **Colour Grading**. It will name proxies with their OE number and codec (ie. oe12345_h264.mov) and move them to a proxy folder in the batch folder. The script needs to copied within the batch folder to find SIPs.
  - **downres2k_batch_cmdline.sh** is using ffmpeg for transcoding from 4k to 2k. The new files named with '_2kconvert' extension .The script needs to copied within the batch folder to find SIPs.
