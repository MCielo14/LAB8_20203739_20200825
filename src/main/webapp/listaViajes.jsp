<%@ page import="Beans.Viajes" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Beans.Viajes" %>
<%--
  Created by IntelliJ IDEA.
  User: djcll
  Date: 17/06/2023
  Time: 01:31
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% ArrayList<Viajes> listaViajesEstudiante = (ArrayList<Viajes>) request.getAttribute("listarViajesEstudiante"); %>
<% String codigoPUCP = (String) request.getAttribute("codigo");%>
<!DOCTYPE html>
<html>
<head>
  <title>Viajes Teleco</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <style>
    .logo {
      font-weight: bold;
      font-size: 24px;
      color: #FFF;
      text-decoration: none;
    }

    .header {
      background-color: #007BFF;
      color: #FFF;
      padding: 10px;
    }

    .user-info {
      display: flex;
      align-items: center;
    }

    .logout-button {
      background-color: transparent;
      color: #FFF;
      border: none;
      text-decoration: underline;
      cursor: pointer;
    }

    .container {
      margin-top: 20px;
    }

    table {
      width: 100%;
      border-collapse: collapse;
    }

    th, td {
      padding: 10px;
      text-align: left;
    }

    th {
      background-color: #007BFF;
      color: #FFF;
    }

    tr:nth-child(even) {
      background-color: #f2f2f2;
    }

    .edit-button, .delete-button {
      background-color: #007BFF;
      color: #FFF;
      border: none;
      padding: 5px 10px;
      text-decoration: none;
      display: inline-block;
      cursor: pointer;
    }

    .edit-button:hover, .delete-button:hover {
      background-color: #0056b3;
    }
  </style>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
  <a class="navbar-brand logo" href="#">Viajes Teleco</a>
  <div class="user-info ml-auto">
    <a href="<%= request.getContextPath()%>/ViajesServlet?action=agregar&codigo=<%=codigoPUCP%>" class="btn btn-primary mb-4">Agregar Viaje</a>


    <a href="logueo.jsp" class="logout-button">Cerrar sesión</a>
  </div>
</nav>
<div class="container">
  <div class="table-responsive">
    <table>
      <thead>
      <tr>
        <th>Identificador</th>
        <th>Fecha de Reserva</th>
        <th>Fecha del Viaje</th>
        <th>Ciudad Origen</th>
        <th>Ciudad Destino</th>
        <th>Empresa Seguro</th>
        <th>Número de Boletos</th>
        <th>Costo Total</th>
        <th></th>
        <th></th>
      </tr>
      </thead>
      <tbody>
      <% for (Viajes v : listaViajesEstudiante) { %>
      <tr>

        <td><%=v.getIdViaje()%></td>
        <td><%=v.getFechaReserva()%></td>
        <td><%=v.getFechaViaje()%></td>
        <td><%=v.getOrigenCiudad()%></td>
        <td><%=v.getDestinoCiudad()%></td>
        <td><%=v.getEmpresaSeguro()%></td>
        <td><%=v.getNumeroBoletos()%></td>
        <td><%=v.getCostoTotal()%></td>
        <td>
          <a href="#" class="edit-button">Editar</a>
        </td>
        <td>
          <a class="btn btn-danger"
             href="ViajesServlet?action=borrar&id=<%=v.getIdViaje()%>&codigo=<%=codigoPUCP%>">
            <i class="bi bi-trash3">Borrar</i>
          </a>
        </td>

      </tr>
      <%}%>
      <!-- Agrega más filas aquí -->
      </tbody>
    </table>
  </div>
</div>
</body>
</html>


