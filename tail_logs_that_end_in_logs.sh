find . -mtime -1 -type f -print | egrep "log$" | xargs -l1 tail
