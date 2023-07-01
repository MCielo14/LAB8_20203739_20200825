<%--
  Created by IntelliJ IDEA.
  User: djcll
  Date: 17/06/2023
  Time: 03:05
  To change this template use File | Settings | File Templates.
--%>


<%@page import="Beans.Viajes" %>
<%@page import="Daos.ViajeDao" %>
<% String codigoPUCP = (String) request.getAttribute("codigo"); %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>


<!DOCTYPE html>
<html>
<head>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
          crossorigin="anonymous"></script>

  <title>Nuevo Jugador</title>
</head>
<body>
<div class='container'>
  <form method="POST" action="ViajesServlet?action=guardar&codigo=<%=codigoPUCP%>" class="col-md-6 col-lg-6">
    <h1 class='mb-3'>Nuevo Viaje</h1>
    <hr>
    <div class="mb-3">
      <label for="fechaViaje">Fecha Viaje</label>
      <input type="text" class="form-control form-control-sm" name="fechaViaje" id="fechaViaje">

    </div>
    <div class="mb-3">
      <label for="fechaReserva">Fecha Actual</label>
      <input type="text" class="form-control form-control-sm" name="fechaReserva" id="fechaReserva">
    </div>
    <div class="mb-3">
      <label for="destinoCiudad">Ciudad Destino</label>
      <input type="text" class="form-control form-control-sm" name="destinoCiudad" id="destinoCiudad">
    </div>
    <div class="mb-3">
      <label for="origenCiudad">Ciudad Origen</label>
      <input type="text" class="form-control form-control-sm" name="origenCiudad" id="origenCiudad">
    </div>

    <div class="mb-3">
      <label for="empresaSeguro">Seguro</label>
      <select class="form-select" name="empresaSeguro" id="empresaSeguro">
        <option value="empresaSeguro">Rimac</option>
        <option value="empresaSeguro">Pacifico</option>
        <option value="empresaSeguro">La Positiva</option>
        <option value="empresaSeguro">Seguro Internacional</option>
        <option value="empresaSeguro">Otro</option>
      </select>
    </div>
    <div class="mb-3">
      <label for="numeroBoletos">Número de boletos</label>
      <input type="text" class="form-control form-control-sm" name="numeroBoletos" id="numeroBoletos">
    </div>

    <a href="ViajesServlet" class="btn btn-danger">Cancelar</a>
    <input type="submit" value="Guardar" class="btn btn-primary"/>
  </form>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
        crossorigin="anonymous"></script>
</body>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0
.0/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min
.js"></script>
<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/p
opper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.
min.js"></script>
</html>
</html>


