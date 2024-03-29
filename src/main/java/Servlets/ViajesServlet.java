package Servlets;

import java.io.*;

import Beans.Estudiante;
import Beans.Viajes;
import Daos.EstudianteDao;
import Daos.ViajeDao;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletOutputStream;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import javax.swing.*;
import java.util.Random;

@WebServlet(name = "ViajesServlet", value = "/ViajesServlet")
public class ViajesServlet extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        response.setContentType("text/html");
        String action= request.getParameter("action")==null ? "listar": request.getParameter("action");
        RequestDispatcher requestDispatcher;

        ViajeDao viajeDao = new ViajeDao();
        HttpSession session = request.getSession();


        switch (action) {
            case "listar":
                request.setAttribute("listaViajes", viajeDao.listarViajes());
                request.getRequestDispatcher("listaViajes.jsp").forward(request,response);
                break;

            case "agregar":

                String codigoPUCP2 = request.getParameter("codigo");
                System.out.println(codigoPUCP2);
                request.setAttribute("codigo", codigoPUCP2);
                request.getRequestDispatcher("agregarViaje.jsp").forward(request,response);
                break;

            case "borrar":
                if (request.getParameter("id") != null) {

                    String idViajeString = request.getParameter("id");

                    int idViaje = Integer.parseInt(idViajeString);
                    viajeDao.borrarViaje(idViaje);

                }
                String codigoPUCP1 = request.getParameter("codigo");
                response.sendRedirect("ViajesServlet?action=listarViajesEspecifico&codigoEstudiante="+ codigoPUCP1);
                break;

            case "listarViajesEspecifico":

                String codigoPUCP = request.getParameter("codigoEstudiante");

                request.setAttribute("listarViajesEstudiante", viajeDao.listarViajesEstudiante(codigoPUCP));
                request.setAttribute("codigo", codigoPUCP);
                request.getRequestDispatcher("listaViajes.jsp").forward(request,response);
                break;
        }
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String action= request.getParameter("action");
        ViajeDao viajeDao = new ViajeDao();
        switch (action){
            case "guardar":
                String codigoPUCP = request.getParameter("codigo");

                Viajes viaje = new Viajes();

                Random random = new Random();
                int idViaje = random.nextInt(90000000) + 10000000;
                viaje.setIdViaje(idViaje);

                viaje.setFechaViaje(request.getParameter("fechaViaje"));
                viaje.setFechaReserva(request.getParameter("fechaReserva"));
                viaje.setDestinoCiudad(request.getParameter("destinoCiudad"));
                viaje.setOrigenCiudad(request.getParameter("origenCiudad"));
                viaje.setEmpresaSeguro(request.getParameter("empresaSeguro"));
                viaje.setNumeroBoletos(Integer.parseInt(request.getParameter("numeroBoletos")));

                int numeroBoletos = Integer.parseInt(request.getParameter("numeroBoletos"));
                float costoTotal = 50*numeroBoletos;
                viaje.setCostoTotal(costoTotal);

                viajeDao.agregarViaje(viaje, codigoPUCP);

                response.sendRedirect("ViajesServlet?action=listarViajesEspecifico&codigoEstudiante="+ codigoPUCP);

        }

    }

}