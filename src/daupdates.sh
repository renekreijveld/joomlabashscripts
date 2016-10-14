#!/bin/sh

# Setup variables
server="$(hostname)"server="$(hostname)"
receivers="r.kreijveld@dsd.nu,email@renekreijveld.nl"
tmpdir=/tmp
emailmsg="${tmpdir}/daupdates.txt"

# Find mail client
if [ -s /bin/mail ]; then
	mailprog=/bin/mail
elif [ -s /usr/bin/mail ]; then
	mailprog=/usr/bin/mail
fi

cd /usr/local/directadmin/custombuild
./build update > /dev/null 2>&1
./build versions | grep available > ${emailmsg}

${mailprog} -s "DirectAdmin updates ${server}" "${receivers}" < ${emailmsg}
rm ${emailmsg}
