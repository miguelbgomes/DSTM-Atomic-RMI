// Universidade Federal de Pelotas 2022
// This work is licensed under a Creative Commons
package DSTMBenchmark.GenericARMI;

import java.rmi.*;
import put.atomicrmi.optsva.objects.TransactionalUnicastRemoteObject;

public class SObject extends TransactionalUnicastRemoteObject implements IObject { 
    protected int field0;
    protected int field1;
    protected int field2;
    protected int field3;

    public SObject () throws RemoteException { 
		super();
		this.field0 = 0;
		this.field1 = 0;
		this.field2 = 0;
		this.field3 = 0;
    }
    
    public SObject (int initialValue) throws RemoteException {
		super();
		this.field0 = initialValue;
		this.field1 = initialValue;
		this.field2 = initialValue;
		this.field3 = initialValue;
	}

	public int getField0 () throws RemoteException {
		return field0;
	}
  
	public void setField0 (int v) throws RemoteException {
		this.field0 = v; 
	}

	public int getField1 () throws RemoteException {
		return field1;
	}
  
	public void setField1 (int v) throws RemoteException {
		this.field1 = v; 
	}

	public int getField2 () throws RemoteException {
		return field2;
	}
  
	public void setField2 (int v) throws RemoteException {
		this.field2 = v; 
	}

	public int getField3 () throws RemoteException {
		return field3;
	}
  
	public void setField3 (int v) throws RemoteException {
		this.field3 = v; 
	}   

	public int sumAll () throws RemoteException {
		return field0+field1+field2+field3;
	}

	public void copyTo (IObject target) throws RemoteException { 
		((IObject)target).setField0(this.field0);
		((IObject)target).setField1(this.field1);
		((IObject)target).setField2(this.field2);
		((IObject)target).setField3(this.field3);
	}
}
