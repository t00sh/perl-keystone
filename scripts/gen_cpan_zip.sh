#!/bin/sh


if test -z $1
then
    echo "Usage : $0 <version>"
    exit 1
fi

CPAN_PATH="pkgs/cpan"
ZIP_ARCHIVE="Keystone-$1.zip"

rm -rf $CPAN_PATH/"Keystone"

mkdir $CPAN_PATH/"Keystone"               || exit 1
cp $(cat MANIFEST) $CPAN_PATH/"Keystone"  || exit 1
cd $CPAN_PATH
zip -r $ZIP_ARCHIVE "Keystone"            || exit 1

rm -rf "Keystone"

echo "DONE"
