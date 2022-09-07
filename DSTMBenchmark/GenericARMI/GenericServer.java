// Universidade Federal de Pelotas 2022
// This work is licensed under a Creative Commons
package DSTMBenchmark.GenericARMI;

import DSTMBenchmark.*;
import java.rmi.*;

public class GenericServer {

	// args[0] == Server ID: starts from zero
	// args[1] == Number of objects in the server

	public static void main(String[] args) throws Exception{

		int id = Integer.parseInt(args[0]);
		int numberObj = Integer.parseInt(args[1]);

		IObject[] objects = new IObject[numberObj];
		//System.out.println("N obj: "+numberObj);

		for (int i = 0; i < objects.length; i++) {
			objects[i] = new SObject(1000);
		}

		ServerApp server = new ServerApp();
		//System.out.println("Iniciando servidor");
		server.publiciseObjectsAndWait(id, objects);
		System.exit(0);
	}
}
