package Daos;

import Beans.Estudiante;
import Beans.Viajes;

import java.sql.*;
import java.util.ArrayList;

public class ViajeDao extends BaseDao{

    public ArrayList<Viajes> listarViajes() {
        ArrayList<Viajes> listaViajes = new ArrayList<>();

        String sql = "SELECT * FROM lab8.viajes where codigoEstudiante= ? ";

        try (Connection connection = this.getConnection();
             Statement stmt = connection.createStatement();
             ResultSet resultSet = stmt.executeQuery(sql)) {

            while (resultSet.next()) {
                Viajes viaje = new Viajes();
                viaje.setIdViaje(resultSet.getInt(1));
                viaje.setFechaReserva(resultSet.getString(2));
                viaje.setFechaViaje(resultSet.getString(3));
                viaje.setOrigenCiudad(resultSet.getString(4));
                viaje.setDestinoCiudad(resultSet.getString(5));
                viaje.setEmpresaSeguro(resultSet.getString(6));
                viaje.setNumeroBoletos(resultSet.getInt(7));
                viaje.setCostoTotal(resultSet.getFloat(8));
                listaViajes.add(viaje);
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return  listaViajes;

    }

    public ArrayList<Viajes> listarViajesEstudiante(Estudiante estudiante) {
        ArrayList<Viajes> listaViajesEstudiante = new ArrayList<>();

        String sql = "SELECT * FROM lab8.viajes where codigoEstudiante= ? ";

        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, estudiante.getCodigoPucp());
            pstmt.executeUpdate();

        } catch (SQLException ex) {
            System.out.println("No se pudo realizar el registro");
            ex.printStackTrace();

        }
        return listaViajesEstudiante;
    }
    public void agregarViaje(Viajes viaje) {

        String sql = "INSERT INTO viajes (idViaje,fechaReserva,fechaViaje,origenCiudad,destinoCiudad,empresaSeguro, numeroBoletos,costoTotal, codigoEstudiante) "
                + "VALUES (?, ?, ?, ?, ?,?,?,?, '20203739')";

        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, viaje.getIdViaje());
            pstmt.setString(2, viaje.getFechaReserva());
            pstmt.setString(3, viaje.getFechaViaje());
            pstmt.setString(4, viaje.getOrigenCiudad());
            pstmt.setString(5, viaje.getDestinoCiudad());
            pstmt.setString(6, viaje.getEmpresaSeguro());
            pstmt.setInt(7, viaje.getNumeroBoletos());
            pstmt.setFloat(8, viaje.getCostoTotal());

            pstmt.executeUpdate();

        } catch (SQLException ex) {

            System.out.println(viaje.getIdViaje());
            System.out.println(viaje.getFechaViaje());
            System.out.println("No se pudo realizar el registro");
            ex.printStackTrace();

        }
    }

    public void borrarViaje(int idViaje) {

        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement("DELETE FROM viajes WHERE (idViaje = ?)")) {

            pstmt.setInt(1, idViaje);
            pstmt.executeUpdate();

        } catch (SQLException ex) {
            System.out.println(idViaje);
            System.out.println("No se pudo borrar");
            ex.printStackTrace();
        }
    }
}
