package pe.edu.upn.appeureka.service;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import pe.edu.upn.appeureka.db.AccesoDB;
import pe.edu.upn.appeureka.dto.Mensaje;

public class EurekaService {

	public Mensaje registrarDeposito(String cuenta, double importe, String empleado) {
		// Variables
		Connection cn = null;
		CallableStatement cstm;
		String sql = "{call dbo.usp_upn_deposito(?, ?, ?, ?, ?)}";
		Mensaje msg = new Mensaje();
		// Proceso
		try {
			// La conexion
			cn = AccesoDB.getConnection();
			// Ejecución del SP
			cstm = cn.prepareCall(sql);
			cstm.setString(1, cuenta);
			cstm.setDouble(2, importe);
			cstm.setString(3, empleado);
			cstm.registerOutParameter(4, java.sql.Types.INTEGER);
			cstm.registerOutParameter(5, java.sql.Types.VARCHAR, 1000);
			cstm.execute();
			msg.setEstado(cstm.getInt(4));
			msg.setMensaje(cstm.getString(5));
			cstm.close();
		} catch (SQLException e) {
			msg.setEstado(-1);
			msg.setMensaje(e.getMessage());
		} catch (Exception e) {
			msg.setEstado(-1);
			msg.setMensaje("Error en el proceso, intentelo de nuevo.");
		} finally {
			try {
				cn.close();
			} catch (Exception e) {
			}
		}
		// Reporte
		return msg;
	}

}
