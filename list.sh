#!/bin/bash

MYPATH='/path/to/backup/scripts'
source config.cfg
export PASSPHRASE=$PASS
export SIGN_PASSPHRASE=$PASS

for LOCAL in ${SRC[*]};
do
        REMOTE=$DEST/${LOCAL##*/}
	FILE=$MYPATH/${LOCAL##*/}.txt
        echo Performing file listing of $REMOTE to $FILE
	duplicity -v4 --encrypt-key $KEY --sign-key $KEY list-current-files  $REMOTE > $FILE
done

unset PASSPHRASE
unset SIGN_PASSPHRASE
