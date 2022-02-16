#!/bin/bash
cd shell/AGH/src

# Start Download
curl -o i1.txt https://adguardteam.github.io/AdGuardSDNSFilter/Filters/filter.txt
curl -o i4.txt https://raw.githubusercontent.com/jdlingyu/ad-wars/master/hosts
curl -o i5.txt https://raw.githubusercontent.com/badmojr/1Hosts/master/mini/adblock.txt
curl -o i6.txt https://raw.githubusercontent.com/xinggsf/Adblock-Plus-Rule/master/rule.txt
curl -o i7.txt https://raw.githubusercontent.com/o0HalfLife0o/list/master/ad-pc.txt
curl -o i8.txt https://raw.githubusercontent.com/o0HalfLife0o/list/master/ad-edentw.txt
curl -o i9.txt https://raw.githubusercontent.com/banbendalao/ADgk/master/ADgk.txt
curl -o i11.txt https://adaway.org/hosts.txt
curl -o i12.txt https://raw.githubusercontent.com/ftpmorph/ftprivacy/master/blocklists/windows10-spying-erm-i-mean-telemetry-lol.txt
curl -o i13.txt https://raw.githubusercontent.com/ftpmorph/ftprivacy/master/blocklists/huawei-trackers.txt
curl -o i14.txt https://raw.githubusercontent.com/notracking/hosts-blocklists/master/adblock/adblock.txt
curl -o i15.txt https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts
curl -o i16.txt https://abp.oisd.nl/
curl -o i17.txt https://block.energized.pro/ultimate/formats/hosts
curl -o i18.txt https://easylist-downloads.adblockplus.org/abp-filters-anti-cv.txt
curl -o i19.txt https://easylist.to/easylist/easyprivacy.txt
curl -o i20.txt https://raw.githubusercontent.com/DandelionSprout/adfilt/master/GameConsoleAdblockList.txt
curl -o i21.txt https://curben.gitlab.io/malware-filter/urlhaus-filter-agh-online.txt
curl -o i23.txt https://someonewhocares.org/hosts/zero/hosts
curl -o i24.txt https://raw.githubusercontent.com/DRSDavidSoft/additional-hosts/master/domains/blacklist/unwanted-iranian.txt
curl -o i25.txt https://raw.githubusercontent.com/mitchellkrogza/The-Big-List-of-Hacked-Malware-Web-Sites/master/hosts
curl -o i26.txt https://raw.githubusercontent.com/Perflyst/PiHoleBlocklist/master/SmartTV-AGH.txt
curl -o i27.txt https://pgl.yoyo.org/adservers/serverlist.php?hostformat=adblockplus&showintro=1&mimetype=plaintext
curl -o i28.txt https://paulgb.github.io/BarbBlock/blacklists/hosts-file.txt
curl -o i29.txt https://raw.githubusercontent.com/crazy-max/WindowsSpyBlocker/master/data/hosts/spy.txt
curl -o i30.txt https://raw.githubusercontent.com/Spam404/lists/master/main-blacklist.txt
curl -o i31.txt https://raw.githubusercontent.com/matomo-org/referrer-spam-list/master/spammers.txt
curl -o i32.txt https://raw.githubusercontent.com/nextdns/cname-cloaking-blocklist/master/domains
curl -o i33.txt https://raw.githubusercontent.com/nextdns/metadata/master/privacy/native/apple
curl -o i34.txt https://raw.githubusercontent.com/nextdns/metadata/master/privacy/native/alexa
curl -o i35.txt https://raw.githubusercontent.com/nextdns/metadata/master/privacy/native/windows
curl -o i36.txt https://raw.githubusercontent.com/olbat/ut1-blacklists/master/blacklists/cryptojacking/domains
curl -o i37.txt https://raw.githubusercontent.com/jerryn70/GoodbyeAds/master/Extension/GoodbyeAds-Spotify-AdBlock.txt
curl -o i38.txt https://raw.githubusercontent.com/badmojr/1Hosts/master/Pro/adblock.txt
curl -o i39.txt https://www.github.developerdan.com/hosts/lists/ads-and-tracking-extended.txt
curl -o i40.txt https://www.github.developerdan.com/hosts/lists/facebook-extended.txt
curl -o i41.txt https://github.com/abp-filters/abp-filters-anti-cv/raw/master/arabic.txt

# Start Merge and Duplicate Removal
cat i*.txt > mergd.txt
cat mergd.txt | grep '^|' | grep -v './' | grep -v '.\$' > block.txt
cat mergd.txt | grep '^@' | grep -v './' | grep -v '.\$' > allow.txt
cat block.txt allow.txt > tmpp.txt
sort -n tmpp.txt | uniq > tmp.txt


# Start Count Rules
num=`cat tmp.txt | wc -l`

# Start Add title and date
echo "! Version: `date +"%Y-%m-%d %H:%M:%S"`" >> tpdate.txt
echo "! Total count: $num" >> tpdate.txt
cat title.dd tpdate.txt tmp.txt > final.txt

mv final.txt ../../dns.txt
rm *.txt
cd ../../
exit
