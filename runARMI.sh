#!/bin/bash

if [ -z $1 ]
then
	NSERVER=1
else
	NSERVER=$1
fi

if [ -z $2 ]
then
	NOBJSERVER=10
else NOBJSERVER=$2
fi

if [ -z $3 ]
then
	NCLIENT=2
else
	NCLIENT=$3
fi

if [ -z $4 ]
then
	WRITES=30
else
	WRITES=$4
fi

if [ -z $5 ]
then
	NTRANS=100
else
	NTRANS=$5
fi


if [ -z $6 ]
then
	NOBJTRANS=2
else
	NOBJTRANS=$6
fi
#=$(expr $5 - 1)
#fi

for i in $(seq 0 0);
do
  time -p java -classpath ".;./DSTMBenchmark/GenericARMI/atomicrmi-3opt.jar;./DSTMBenchmark/GenericARMI/cglib-nodep-2.2.jar" DSTMBenchmark.GenericARMI.GenericCoordinator $NSERVER $NCLIENT $NOBJSERVER&
  #printf "java -classpath 'etc' DSTMBenchmark.GenericARMI.GenericCoordinator $NSERVER $NCLIENT $NOBJSERVER&\n"

  pid=$!
  printf "AtomicRMI Port\t$NCLIENT\t\n"
  for i in $(seq 0 $(($NSERVER - 1)));
  do
	taskset -c $(($NCLIENT-$i)) java -classpath ".;./DSTMBenchmark/GenericARMI/atomicrmi-3opt.jar;./DSTMBenchmark/GenericARMI/cglib-nodep-2.2.jar" DSTMBenchmark.GenericARMI.GenericServer $i $NOBJSERVER &
	#printf "taskset -c $(($NCLIENT-$i)) java -classpath 'etc' DSTMBenchmark.GenericARMI.GenericServer $i $NOBJSERVER &\n"
  done

  for i in $(seq 0 $(($NCLIENT-1)));
  do
	taskset -c $i java -classpath ".;./DSTMBenchmark/GenericARMI/atomicrmi-3opt.jar;./DSTMBenchmark/GenericARMI/cglib-nodep-2.2.jar" DSTMBenchmark.GenericARMI.GenericClient $i $NSERVER $NOBJSERVER $WRITES $NTRANS $NOBJTRANS &
	#printf "taskset -c %i java -classpath 'etc' DSTMBenchmark.GenericARMI.GenericClient $i $NSERVER $NOBJSERVER $WRITES $NTRANS $NOBJTRANS &\n"
 done
 wait $pid
done
