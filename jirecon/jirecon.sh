#!/bin/bash

if [[ "$1" == "--help"  || $# -lt 1 ]]; then
    echo -e "Usage:"
    echo -e "$0 [OPTIONS...] <MUCJID>..."
    echo -e "Record the specific jitsi-meeting conference into local files."
    echo
    echo -e "Examples:"
    echo -e "\t$0 --conf=jirecon.properties --time=20 XXX@conference.example.com"
    echo
    echo "Operations can be:"
    echo -e "\t--conf\t sets the configuration file path. Default value is jirecon.properties."
    echo -e "\t--time\t sets how many seconds it will record. Default value is -1 which means infinite."
    echo
    exit 1
fi

SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"

jars = $SCRIPT_DIR/jirecon.jar

java -jar $jars $@
