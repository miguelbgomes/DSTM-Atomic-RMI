# DSTM-Atomic-RMI
DSTM (https://github.com/ardubois/DSTM) + Atomic RMI port

To run all benchmarks, use the following command:

`./runShow.sh [NSERVERS] [NOBJSERVER] [NCLIENTS] [WRITES] [NTTRANS] [NOBJTRANS]`

The parameters are:

NSERVERS: The number of servers to be used;    
NOBJSERVER = The number of objects that will be created by each server;    
NCLIENTS = The total number of clients to be used;    
WRITES = The percentage of writes for each transaction;    
NTTRANS = The total number of transactions that will be split among the servers;    
NOBJTRANS = The number of objects that will be accessed per transaction.

To compile or run a specific benchmark, use the following scripts, respectively:

`./compileX.sh` 

and 

`./runX.sh [NSERVERS] [NOBJSERVER] [NCLIENTS] [WRITES] [NTTRANS] [NOBJTRANS]`

Where the parameters are the same as above, and X can be replaced with:

TRMIPassive = TRMI with Passive contention manager    
TRMIPolite = TRMI with polite contention manager    
Locks = Version using only locks    
ARMI = Atomic RMI Port

Please note that the scripts may not support newer Java versions. Scripts were ran using JRE version 13.0.2.
