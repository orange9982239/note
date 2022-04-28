#!/bin/bash

SOURCE="/cygdrive/d/DBBAK/NTTUDB/"      # 來源(/結尾)
TARGET="/rsyncfolder/NTTUDB"            # 儲存目標
SSHSERVER="#account#@192.168.1.1:"         # 遠端SERVER
SSHPORT="22"                            # 遠端SERVER PORT
SYNCDAYS="1"                            # 同步天數

rsync \
    -ahrv \
    -e "ssh -p $SSHPORT" \
    --progress \
    --files-from=<(find $SOURCE -mtime -$SYNCDAYS -type f -exec realpath --relative-to $SOURCE {} \;) \
    $SOURCE \
    "${SSHSERVER}${TARGET}" 