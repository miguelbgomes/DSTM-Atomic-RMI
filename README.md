# DSTM-AtomicRMI
DSTM (https://github.com/ardubois/DSTM) + Atomic RMI port

To run all benchmarks, use the following command:

`./runShow.sh [NSERVERS] [NTTRANS] [NOBJTRANS] [NOBJSERVER] [WRITES]`

The parameters are:

NSERVERS: The number of servers to be used;    
NTTRANS = The total number of transactions that will be split among the servers;    
NOBJTRANS = The number of objects that will be accessed per transaction;    
NOBJSERVER = The number of objects that will be created by each server;    
WRITES = The percentage of writes for each transaction.

To compile or run a specific benchmark, use the ./compileX.sh and ./runX.sh scripts, where X can be:

TRMIPassive = TRMI with Passive contention manager    
TRMIPolite = TRMI with polite contention manager    
Locks = Version using only locks    
ARMI = Atomic RMI Port

Please note that the scripts may not support newer Java versions. Scripts were ran using JRE version 13.0.2.
