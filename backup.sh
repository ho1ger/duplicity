#!/bin/bash

MYPATH='/path/to/backup/scripts'
source $MYPATH/config.cfg
export PASSPHRASE=$PASS
export SIGN_PASSPHRASE=$PASS

echo ========== SERVERNAME ==========

for LOCAL in ${SRC[*]};
do
	REMOTE=$DEST/${LOCAL##*/}
	echo Backing up $LOCAL to $REMOTE
	duplicity -v4 --encrypt-key $KEY --sign-key $KEY --exclude-globbing-filelist $MYPATH/$EXCL $LOCAL $REMOTE
done

unset PASSPHRASE
unset SIGN_PASSPHRASE
