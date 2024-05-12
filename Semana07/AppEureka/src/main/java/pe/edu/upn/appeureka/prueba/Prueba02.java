
package pe.edu.upn.appeureka.prueba;

import pe.edu.upn.appeureka.dto.Mensaje;
import pe.edu.upn.appeureka.service.EurekaService;

public class Prueba02 {
	
	public static void main(String[] args) {
		// Datos
		String cuenta = "00100001";
		double importe = 1000.0;
		String empleado = "0005";
		// Proceso
		EurekaService service = new EurekaService();
		Mensaje msg = service.registrarDeposito(cuenta, importe, empleado);
		System.out.println(msg);
	}

}
