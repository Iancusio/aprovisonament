#!/bin/bash

nomscript=$0   # $0 es el nom del programa

function usage () {
   cat <<EOF
Usage: nomscript [-u usuari] [-h hostname] [-t]
   -u   usuari de la base de dades (obligatori)
   -h   hostname on es connectarà (obligatori
   -p   port (no obligatori ja que per defecte és 3306, però si existeix ha de ser un numero superior a 1024 i inferior o igual a 65535)
   -t   no es connecta,  només comprova connexió
EOF
}

while getopts ":u:h:p:t"  OPT ; do
case "${OPT}" in 
    u)
        #echo "-u usuari de la base de dades (obligatori)"
        OPTU=$OPTARG
        USERNAME=$1
        ;;
    h)
        #echo "-h hostname on es connectarà (obligatori)"
        OPTH=$OPTARG
        HOSTNAME="${@:2}"
        ;;
    p)
        #echo " -p   port (no obligatori ja que per defecte és      3306, però si 		#existeix ha de ser un numero superior a 1024 i inferior o igual a 65535)"
	OPTP=3306
	if [[ $OPTARG -le "1024" || $OPTARG -ge "65535" ]];
	then
		usage
	else
		OPTP=$OPTARG
	fi
        ;;
    t)
        #echo "-t no es connecta,  només comprova connexió EOF"
         OPTP=$OPTARG
        ;;
    :)  
            echo "ERROR: Option -$OPTARG requires an argument"
            #usage
            ;;
    \?)
            echo "ERROR: Invalid option -$OPTARG"
            #usage
            ;;
    esac
done


if [ -z "${OPTU}" ] || [ -z "${OPTH}" ]; then
    echo "ERROR: NECESITA EL USER_NAME I EL HOSTNAME"
    #usage 
fi

echo "USERNAME = ${OPTU}"
echo "HOSTNAME = ${OPTH}"
echo "PORT = ${OPTP}"



