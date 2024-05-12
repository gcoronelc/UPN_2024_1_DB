
package pe.edu.upn.appeureka.prueba;

import java.sql.Connection;
import pe.edu.upn.appeureka.db.AccesoDB;


public class Prueba01 {
	
	public static void main(String[] args) {
		
		try {
			Connection cn = AccesoDB.getConnection();
			System.out.println("Conexion OK.");
			cn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
	}

}
