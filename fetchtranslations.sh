#! /bin/sh


if [ "$ICSCROWDAPIKEY" != "" ]
then
	echo "Generating new translation archives"
	fetch -q -1 -o - http://api.crowdin.net/api/project/ics-openvpn/export?key=$ICSCROWDAPIKEY
fi

echo "Fetch translation archive"
fetch -q http://crowdin.net/download/project/ics-openvpn.zip

langtoinclude="de cs ko et fr he ru"

for lang in $langtoinclude
do
    tar xfv ics-openvpn.zip /res/values-$lang/
done

# Chinese language require zh-CN and zh-TW

lang="zh-CN"
rlang="zh-rCN"
do
	echo "Fetch archive for $lang"
	fetch http://crowdin.net/download/project/ics-openvpn/$lang.zip
	tar -xv -C res/values-$rlang/ --strip-components 3 -f $lang.zip
done