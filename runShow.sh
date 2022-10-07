#!/bin/bash

#./runShow NSERVER NOBJSERVER NCLIENT WRITES NTTRANS NOBJTRANS
#NSERVER = numero de servidores
#NOBJSERVER = numero de objetos criados por cada servidor
#NCLIENT = numero de clientes
#WRITES = % de writes por transacao
#NTTRANS = numero total de transacoes (vai ser dividido pelos clientes em NTRANS)
#NOBJTRANS = numero de objetos acessados por transacao

if [ -z $1 ]
then
	NSERVER=2
else
	NSERVER=$1
fi

if [ -z $2 ]
then
	NOBJSERVER=500
else
	NOBJSERVER=$2
fi

if [ -z $3 ]
then
	NCLIENT=2
else
	NCLIENT=$3
fi

if [ -z $4 ]
then
	WRITES=20
else
	WRITES=$4
fi

if [ -z $5 ]
then
	NTTRANS=5000
else
	NTTRANS=$5
fi

if [ -z $6 ]
then
	NOBJTRANS=5
else
	NOBJTRANS=$6
fi
#=$(expr $5 - 1)
#fi

echo "$1 $2 $3 $4 $5 $6"
echo "$NSERVER $NOBJSERVER $NCLIENT $WRITES $NTTRANS $NOBJTRANS"
echo "NOBJSERVER: $NOBJSERVER WRITES: $WRITES NOBJTRANS: $NOBJTRANS"
./compileTRMIPolite.sh
NTRANS=$(($NTTRANS/$NCLIENT))
./runTRMIPolite.sh $NSERVER $NOBJSERVER $NCLIENT $WRITES $NTRANS $NOBJTRANS

./compileTRMIPassive.sh
NTRANS=$(($NTTRANS/$NCLIENT))
./runTRMIPassive.sh $NSERVER $NOBJSERVER $NCLIENT $WRITES $NTRANS $NOBJTRANS 


./compileLocks.sh
NTRANS=$(($NTTRANS/$NCLIENT))
./runLocks.sh $NSERVER $NOBJSERVER $NCLIENT $WRITES $NTRANS $NOBJTRANS  

./compileARMI.sh
NTRANS=$(($NTTRANS/$NCLIENT))
./runARMI.sh $NSERVER $NOBJSERVER $NCLIENT $WRITES $NTRANS $NOBJTRANS  

