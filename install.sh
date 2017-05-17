#!/bin/bash
mkdir /opt/wlist
cd /opt/wlist
git clone https://github.com/swisskyrepo/PayloadsAllTheThings.git
git clone https://github.com/xmendez/wfuzz.git
git clone https://github.com/fuzzdb-project/fuzzdb.git
git clone https://github.com/minimaxir/big-list-of-naughty-strings.git
git clone https://github.com/foospidy/payloads.git
git clone https://github.com/danielmiessler/RobotsDisallowed.git
git clone https://github.com/danielmiessler/SecLists.git
wget http://download.g0tmi1k.com/wordlists/large/crackstation-human-only.txt.gz 
gzip -d crackstation-human-only.txt.gz 
git clone https://github.com/danielmiessler/SecLists.git seclists 
git clone https://github.com/minimaxir/big-list-of-naughty-strings.git naughty
cp -R /usr/share/wordlists/ /opt/wlists 
cd /opt/wlists
ln -s /usr/share/golismero/wordlist /opt/wlists/golismero 
ln -s /usr/share/dict /opt/wlists/dict 
printf "ls /opt/wlists -R | awk '/:$/&&f{s=$0;f=0}/:$/&&!f\{sub(/:$/,"");s=$0;f=1;next}NF&&f{ print s"/"$0 }' | grep -i --color $1" > /usr/bin/wlist-find
wget https://raw.githubusercontent.com/royharoush/rtools/master/wlist-find -O /usr/bin/wlist-find && chmod +x /usr/bin/wlist-find
wget https://raw.githubusercontent.com/royharoush/rtools/master/wlist-update -O /usr/bin/wlist-update  && chmod +x /usr/bin/wlist-update
echo "finished creating wlists, use wlist-find to search for a wordlist to use "
echo "to update run wlist-update" 
