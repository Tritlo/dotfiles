#!/bin/bash

mails=$(curl -u icetritlo:***REMOVED***  --silent "https://mail.google.com/mail/feed/atom" | awk 'BEGIN{FS="\n";RS="(</entry>\n)?<entry>"}NR!=1{print "\033[1;31m"$9"\033[0;32m ("$10")\033[0m:\t\033[1;33m"$2"\033[0m"}' | sed -e 's,<[^>]*>,,g' | column -t -s $'\t'| wc -l)

#echo "<action=chromium-browser --new-window gmail.com>G $mails</action>"
echo "<action=chromium-browser --new-window gmail.com><fc=#FF0000><icon=/home/tritlo/.icons/mail.xbm/></fc> $mails</action>"

