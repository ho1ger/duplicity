#!/bin/bash

MYPATH='/path/to/backup/scripts'
source config.cfg
export PASSPHRASE=$PASS
export SIGN_PASSPHRASE=$PASS

for LOCAL in ${SRC[*]};
do
    REMOTE=$DEST/${LOCAL##*/}
    LOCAL=$REST/${LOCAL##*/}
    echo Restoring $REMOTE to $LOCAL
    duplicity -v4 --encrypt-key $KEY --sign-key $KEY restore $REMOTE $LOCAL
done

unset PASSPHRASE
unset SIGN_PASSPHRASE
