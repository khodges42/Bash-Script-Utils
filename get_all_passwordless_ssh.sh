# Util for red team stuff
IFS=$'\n'; for y in echo $( history 0 | cut -d" " -f4- | grep -i "^ssh \w*@[\w\d\.]*" | grep "\-i" | cut -d" " -f1,2,3,4 | sort | uniq;IFS=$'\n';for x in $(history 0 | cut -d" " -f4- | grep -i "^ssh \w*@[\w\d\.]*" | grep -v "\-i" | sort | uniq | cut -d" " -f1,2);do if grep -q $( echo $x | cut -d"@" -f2 ) ~/.ssh/config; then echo $x; fi; done; IFS=" " ); do echo $y; done
