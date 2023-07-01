package Servlets;

import java.io.*;
import java.util.Date;

import Beans.Estudiante;
import Beans.Viajes;
import Daos.EstudianteDao;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "LoginServlet", value = "/LoginServlet")
public class LoginServlet extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        response.setContentType("text/html");
        String action= request.getParameter("action")==null ? "index": request.getParameter("action");
        RequestDispatcher requestDispatcher;
        EstudianteDao estudianteDao = new EstudianteDao();
        HttpSession session = request.getSession();
        switch (action) {
            case "index":
                Estudiante estudiante = (Estudiante) session.getAttribute("UsuarioLogueado");
                if (estudiante != null && Integer.parseInt(estudiante.getCodigoPucp()) != 0) {
                    response.sendRedirect(request.getContextPath() + "/ViajesServlet");
                } else {
                    requestDispatcher = request.getRequestDispatcher("logueo.jsp");
                    requestDispatcher.forward(request, response);
                }
                break;
            case "logout":
                HttpSession session1 = request.getSession();
                session1.invalidate();
                response.sendRedirect(request.getContextPath() + "/LoginServlet" );
                break;


        }

    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

        EstudianteDao estudianteDao = new EstudianteDao();


        String action1= request.getParameter("action")==null ? "inicio": request.getParameter("action");

        switch (action1){
            case "inicio":
                String codigo = request.getParameter("codigoPUCP");
                String contrasena = request.getParameter("contrasena");

                Estudiante estudiante = estudianteDao.validarCodigoContrasena(codigo, contrasena);

                if(estudiante != null){
                    HttpSession session = request.getSession();
                    session.setAttribute("estudianteSession",estudiante);

                    response.sendRedirect(request.getContextPath() + "/ViajesServlet?action=listarViajesEspecifico&codigoEstudiante="+ estudiante.getCodigoPucp());
                } else {
                    response.sendRedirect(request.getContextPath() + "/LoginServlet?error");
                }
                break;



            case "crearEstudiante":
                Estudiante estudiante1 = new Estudiante();
                String nombre = request.getParameter("nombre");
                String apellido = request.getParameter("apellido");
                int edad = Integer.parseInt(request.getParameter("edad"));
                String codigo1 = request.getParameter("codigo");
                String correo = request.getParameter("correo");
                String especialidad = request.getParameter("especialidad");
                String contrasena1 = request.getParameter("contrasena");
                String confirmaContra = request.getParameter("confirmaContra");

                estudiante1.setNombre(nombre);
                estudiante1.setApellido(apellido);
                estudiante1.setEdad(edad);
                estudiante1.setCodigoPucp(codigo1);
                estudiante1.setCorreoPucp(correo);
                estudiante1.setEspecialidad(especialidad);
                estudiante1.setContrasena(contrasena1);
                estudiante1.setConfirmacionContra(confirmaContra);


                estudianteDao.crearEstudiante(estudiante1);

                response.sendRedirect(request.getContextPath() + "/LoginServlet");

                break;


        }

    }
}