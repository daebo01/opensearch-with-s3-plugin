#!./dumb-init /bin/bash

FILEPATH=${FILEPATH-/config/config.ini}

if [ ! -f "$FILEPATH" ]; then
    echo "File $FILEPATH not found!"
    exit 1
fi

opensearch-keystore create

mapfile -t CONFS < $FILEPATH

for CONF in "${CONFS[@]}"
do
    KEY=${CONF%=*}
    VALUE=${CONF##*=}
    echo $VALUE | opensearch-keystore add --stdin $KEY
done

opensearch