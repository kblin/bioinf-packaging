#!/bin/bash
# Create and publish antiSMASH debian repository releases

set -o errexit
set -o nounset
set -o pipefail

DISTROS=(jessie trusty)

# First, make sure your repositories are up-to-date
# you can add new debs by using
# aptly repo add antismash-jessie <debfile>
# aptly repo add antismash-trusty <debfile>

function get_snapshot_name {
    readonly CODENAME=$1
    readonly TODAY=$(date +%Y%m%d)
    readonly OLD_SNAPSHOT=$(aptly snapshot list | grep "$CODENAME" | \
                            sed -e "s# \* \[\([a-zA-Z0-9-]\+\)\].*#\1#" | \
                            sort -r | head -n1 | cut -d"-" -f3)

    INDEX=1
    NEW_SNAPSHOT=$(printf "${TODAY}%02d" $INDEX)

    while [ $NEW_SNAPSHOT -le $OLD_SNAPSHOT ]; do
        INDEX=$(( $INDEX + 1))
        NEW_SNAPSHOT=$(printf "${TODAY}%02d" $INDEX)
    done
    echo "antismash-${CODENAME}-${NEW_SNAPSHOT}"
}

for DISTRO in ${DISTROS[@]}; do
    SNAPSHOT_NAME=$(get_snapshot_name $DISTRO)
    echo aptly snapshot create $SNAPSHOT_NAME from repo antismash-$DISTRO
    echo aptly publish drop $DISTRO
    echo aptly publish snapshot -architectures=i386,amd64 $SNAPSHOT_NAME
done

echo rsync -e ssh -avuP --delete $HOME/.aptly/public/ root@dl.secondarymetabolites.org:/vol/download/repos/deb/
