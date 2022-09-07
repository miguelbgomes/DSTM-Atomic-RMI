// Universidade Federal de Pelotas 2022
// This work is licensed under a Creative Commons
package DSTMBenchmark.GenericARMI;

import java.rmi.*;

import put.atomicrmi.optsva.Access;
import put.atomicrmi.optsva.Access.Mode;

public interface IObject extends Remote{

	@Access(Mode.READ_ONLY) public int getField0 () throws RemoteException;

	@Access(Mode.WRITE_ONLY) public void setField0 (int v) throws RemoteException;


	@Access(Mode.READ_ONLY) public int getField1 () throws RemoteException;

	@Access(Mode.WRITE_ONLY) public void setField1 (int v) throws RemoteException;


	@Access(Mode.READ_ONLY) public int getField2 () throws RemoteException;

	@Access(Mode.WRITE_ONLY) public void setField2 (int v) throws RemoteException;


	@Access(Mode.READ_ONLY) public int getField3 () throws RemoteException;

	@Access(Mode.WRITE_ONLY) public void setField3 (int v) throws RemoteException;


	@Access(Mode.READ_ONLY) public int sumAll () throws RemoteException;
	
	@Access(Mode.READ_ONLY) public void copyTo (IObject target) throws RemoteException;
}
