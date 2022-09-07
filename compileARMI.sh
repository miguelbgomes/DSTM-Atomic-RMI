rm DSTMBenchmark/*.class
rm DSTMBenchmark/GenericARMI/*.class
javac -classpath ".;./DSTMBenchmark/GenericARMI/atomicrmi-3opt.jar;./DSTMBenchmark/GenericARMI/cglib-nodep-2.2.jar" DSTMBenchmark/*.java
javac -classpath ".;./DSTMBenchmark/GenericARMI/atomicrmi-3opt.jar;./DSTMBenchmark/GenericARMI/cglib-nodep-2.2.jar" DSTMBenchmark/GenericARMI/*.java