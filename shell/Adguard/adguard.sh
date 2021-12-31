#!/bin/bash
cd shell/adguard/src

# Start Download
curl -o i1.txt https://filters.adtidy.org/android/filters/2_optimized.txt
curl -o i2.txt https://filters.adtidy.org/android/filters/11_optimized.txt
curl -o i3.txt https://filters.adtidy.org/android/filters/3_optimized.txt
curl -o i4.txt https://filters.adtidy.org/android/filters/224_optimized.txt
curl -o i5.txt https://filters.adtidy.org/android/filters/14_optimized.txt
curl -o i6.txt https://filters.adtidy.org/android/filters/5_optimized.txt
curl -o i7.txt https://filters.adtidy.org/android/filters/4_optimized.txt
curl -o i8.txt https://github.com/siankatabg/FuFu-AdGuard-blacklist/blob/master/fufu-adguard-blacklist.txt
curl -o i9.txt https://raw.githubusercontent.com/chirag127/adblock/main/T.txt
curl -o i10.txt https://raw.githubusercontent.com/chirag127/adblock/main/AD.txt
curl -o i11.txt https://raw.githubusercontent.com/chirag127/adblock/main/AP.txt
curl -o i12.txt https://raw.githubusercontent.com/chirag127/adblock/main/adtl/ageconfirmation.txt
curl -o i13.txt https://raw.githubusercontent.com/chirag127/adblock/main/A.txt
curl -o i14.txt https://raw.githubusercontent.com/chirag127/adblock/main/S.txt
curl -o i15.txt https://raw.githubusercontent.com/chirag127/adblock/main/S.txt
curl -o i16.txt https://github.com/lukaskronus/FukuroFilter/raw/main/mainlist.txt
curl -o i17.txt https://easylist.to/easylist/easyprivacy.txt
curl -o i18.txt https://raw.githubusercontent.com/AdguardTeam/FiltersRegistry/master/filters/filter_14_Annoyances/filter.txt
curl -o i19.txt https://raw.githubusercontent.com/AdguardTeam/FiltersRegistry/master/filters/filter_4_Social/filter.txt
curl -o i20.txt https://raw.githubusercontent.com/AdguardTeam/FiltersRegistry/master/filters/filter_17_TrackParam/filter.txt
curl -o i21.txt https://raw.githubusercontent.com/AdguardTeam/FiltersRegistry/master/filters/filter_2_English/filter.txt
curl -o i22.txt https://raw.githubusercontent.com/AdguardTeam/FiltersRegistry/master/filters/filter_3_Spyware/filter.txt
curl -o i23.txt https://raw.githubusercontent.com/AdguardTeam/FiltersRegistry/master/filters/filter_10_Useful/filter.txt
curl -o i24.txt https://github.com/MrBukLau/filter-lists-for-ublock-origin/raw/master/filter_lists/iosfilterlist.txt
curl -o i25.txt https://easylist-downloads.adblockplus.org/Liste_AR.txt
curl -o i26.txt https://raw.githubusercontent.com/bogachenko/fuckfuckadblock/master/fuckfuckadblock.txt

# Start Merge and Duplicate Removal
cat i*.txt > mergd.txt
cat mergd.txt | grep -v '^!' | grep -v '^！' | grep -v '^# ' | grep -v '^# ' | grep -v '^\[' | grep -v '^\【' > tmpp.txt
sort tmpp.txt | uniq > tmp.txt
sort -n tmp.txt > tmmp.txt


# Start Count Rules
num=`cat tmmp.txt | wc -l`

# Start Add title and date
echo "! Version: `date +"%Y-%m-%d %H:%M:%S"`" >> tpdate.txt
echo "! Total count: $num" >> tpdate.txt
cat title.dd tpdate.txt tmmp.txt > final.txt

mv final.txt ../../adguard.txt
rm *.txt
cd ../../
exit
