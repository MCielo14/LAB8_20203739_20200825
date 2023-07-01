package Daos;

import Beans.Estudiante;

import java.sql.*;
public class EstudianteDao extends BaseDao{

    public void crearEstudiante(Estudiante estudiante) {
        String sql = "insert into lab8.estudiante (codigoPUCP,nombre,apellido,edad,especialidad,contrasena, confirmacionContra,Status_idStatus, correoPUCP) values \n" +
                "(?,?,?,?,?,SHA2(?,256),SHA2(?,256),1,?);";
        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)
        ) {

            pstmt.setString(1, estudiante.getCodigoPucp());
            pstmt.setString(2, estudiante.getNombre());
            pstmt.setString(3, estudiante.getApellido());
            pstmt.setInt(4, estudiante.getEdad());
            pstmt.setString(5, estudiante.getEspecialidad());
            pstmt.setString(6, estudiante.getContrasena());
            pstmt.setString(7, estudiante.getConfirmacionContra());
            pstmt.setString(8, estudiante.getCorreoPucp());

            pstmt.executeUpdate();
        } catch (SQLException error) {

            System.out.println("No se pudo realizar el registro");
            error.printStackTrace();
        }
    }





    public Estudiante obtenerEstudiante(String codigoPUCP){

        Estudiante estudiante = null;

        String sql = "SELECT * FROM estudiante WHERE codigoPUCP = ?";

        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql);) {

            pstmt.setString(1, codigoPUCP);
            ResultSet rs = pstmt.executeQuery();

            if(rs.next()){
                estudiante = new Estudiante();
                estudiante.setCodigoPucp(rs.getString(1));
                estudiante.setNombre(rs.getString(2));
                estudiante.setApellido(rs.getString(3));
                estudiante.setEdad(rs.getInt(4));
                estudiante.setEspecialidad(rs.getString(5));
                estudiante.setContrasena(rs.getString(6));
                estudiante.setConfirmacionContra(rs.getString(7));
                estudiante.setIdStatus(rs.getInt(8));
                estudiante.setCorreoPucp(rs.getString(9));
            }

        }catch (SQLException ex) {
            ex.printStackTrace();
        }

        return estudiante;
    }
    public Estudiante validarCodigoContrasena(String codigo, String contrasena){
        Estudiante estudiante = null;

        String sql = "SELECT * FROM estudiante WHERE codigoPUCP = ? AND contrasena = SHA2(?,256)";
        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, codigo);
            pstmt.setString(2, contrasena);

            try(ResultSet rs = pstmt.executeQuery();){
                if(rs.next()){
                    String codigoPUCP = rs.getString(1);
                    estudiante = this.obtenerEstudiante(codigoPUCP);
                }
            }

        } catch (SQLException e) {

            e.printStackTrace();
            throw new RuntimeException(e);
        }
        return estudiante;
    }
}
