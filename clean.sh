#!/bin/bash

MYPATH='/path/to/backup/scripts'
source config.cfg
export PASSPHRASE=$PASS
export SIGN_PASSPHRASE=$PASS

for LOCAL in ${SRC[*]};
do
        REMOTE=$DEST/${LOCAL##*/}
        echo Cleaning $REMOTE
	duplicity -v4 --encrypt-key $KEY --sign-key $KEY cleanup --force $REMOTE
done


unset PASSPHRASE
unset SIGN_PASSPHRASE
