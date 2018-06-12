#!/bin/bash

# Kevin's bash utils and such.

confirm() {
    read -r -p "${1:-Are you sure? [y/N]} " response
    case "$response" in
        [yY][eE][sS]|[yY]) 
            true
            ;;
        *)
            false
            ;;
    esac
}

print_style () {
    echo "$(tput setaf $2)$1$(tput sgr0)"
}

download_list () {
    DOWNLOAD_DIR=$1
    LIST_LOCATION=${LIST_LOCATION:-"$DOWNLOAD_DIR/dependencies.txt"}
    while read p; do
        if [ ! -f $DOWNLOAD_DIR${p##*/} ]; then
            if [[ $string =~ $RE_URL ]];then 
                echo "  Downloading "$p
                if wget -q "$p" -P "$DOWNLOAD_DIR"; then
                    print_style "  Got $p" "2"
                else
                    print_style "  Failed downloading $p" "1"
                fi
                
            else
                print_style "  $p is not a valid URL and could not be found locally. Maybe go find it?" "1"
            fi
        else
            print_style "  Found local $p" "2"
        fi
    done <"$LIST_LOCATION"

}
