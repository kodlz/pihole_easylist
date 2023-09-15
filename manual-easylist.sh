#!/bin/bash
#source: https://gist.github.com/g3rhard/71fe0b95e69736f442dff5e8615245bf
for source in $(cat list.lst | grep -v '^#'); do
    echo $source;
        curl --silent $source >> ads.txt
	    echo -e "\t`wc -l ads.txt | cut -d " " -f 1` lines downloaded"
	    done

	    echo -e "\nFiltering non-url content..."
	    perl easylist.pl ads.txt > ads_parsed.txt
	    rm ads.txt
	    echo -e "\t`wc -l ads_parsed.txt | cut -d " " -f 1` lines after parsing"

	    echo -e "\nRemoving duplicates..."
	    sort -u ads_parsed.txt > ads_unique.txt
	    rm ads_parsed.txt
	    echo -e "\t`wc -l ads_unique.txt | cut -d " " -f 1` lines after deduping"
	    
	    cat ads_unique.txt >> adblock.raw
	    sort -u adblock.raw > adblock_list/adblock.hosts

	    rm adblock.raw
	    rm ads_unique.txt

# in case of straight import to pihole:	    
#	    cat ads_unique.txt >> /etc/pihole/adblock.raw
#	    sort -u /etc/pihole/adblock.raw > /var/www/html/pihole/adblock.hosts
#	    cp /etc/pihole/adblock.raw /root/adblock.list
#	    rm /etc/pihole/adblock.raw
#	    pihole -g
