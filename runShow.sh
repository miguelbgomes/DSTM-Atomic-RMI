#!/bin/bash

#NSERVER = numero de servidores
#NCLIENT = numero de clientes
#NTTRANS = numero total de transacoes (vai ser dividido pelos clientes em NTRANS)
#WRITES = % de transacoes write
#NOBJTRANS = numero de objetos acessados por transacao
#NOBJSERVER = numero de objetos criados por cada servidor

if [ -z $1 ]
then
	NSERVER=3
else
	NSERVER=$1
fi

if [ -z $2 ]
then
	NTTRANS=5000
else
	NTTRANS=$2
fi

if [ -z $3 ]
then
	NOBJTRANS=5
else
	NOBJTRANS=$3
fi

if [ -z $4 ]
then
	NOBJSERVER=500
else
	NOBJSERVER=$4
fi

if [ -z $5 ]
then
	WRITES=20
else
	WRITES=$5
fi
#=$(expr $5 - 1)
#fi


echo "NOBJSERVER: $NOBJSERVER WRITES: $WRITES NOBJTRANS: $NOBJTRANS"
./compileTRMIPolite.sh
for NCLIENT in 3;
do
NTRANS=$(($NTTRANS/$NCLIENT))
#echo "clients: $NCLIENT transacoes por client: $NTRANS, NTTRANS: $NTTRANS"
./runTRMIPolite.sh $NSERVER $NOBJSERVER $NCLIENT $WRITES $NTRANS $NOBJTRANS
done 

./compileTRMIPassive.sh
for NCLIENT in 3;
do
NTRANS=$(($NTTRANS/$NCLIENT))
#echo "clients: $NCLIENT transacoes por client: $NTRANS, NTTRANS: $NTTRANS"
./runTRMIPassive.sh $NSERVER $NOBJSERVER $NCLIENT $WRITES $NTRANS $NOBJTRANS 
done


./compileLocks.sh
for NCLIENT in 3;
do
NTRANS=$(($NTTRANS/$NCLIENT))
#echo "clients: $NCLIENT transacoes por client: $NTRANS, NTTRANS: $NTTRANS"
./runLocks.sh $NSERVER $NOBJSERVER $NCLIENT $WRITES $NTRANS $NOBJTRANS 
done 

./compileARMI.sh
for NCLIENT in 3;
do
NTRANS=$(($NTTRANS/$NCLIENT))
#echo "clients: $NCLIENT transacoes por client: $NTRANS, NTTRANS: $NTTRANS"
./runARMI.sh $NSERVER $NOBJSERVER $NCLIENT $WRITES $NTRANS $NOBJTRANS 
done 

