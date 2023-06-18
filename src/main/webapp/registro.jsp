<%--
  Created by IntelliJ IDEA.
  User: djcll
  Date: 16/06/2023
  Time: 15:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <title>Registro</title>
  <style>
    body {
      font-family: Arial, sans-serif;
    }

    .container {
      max-width: 400px;
      margin: 150px auto;
      padding: 20px;
      background-color: rgba(255, 255, 255, 0.8);
      border-radius: 5px;
      text-align: center;
    }

    .background {
      position: fixed;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      z-index: -1;
      background-image: url("images/fondo.jpg");
      background-size: cover;
      filter: blur(5px);
    }

    .form-group {
      margin-bottom: 20px;
    }

    .form-group input {
      width: 100%;
      padding: 10px;
      border-radius: 3px;
      border: 1px solid #ccc;
      box-sizing: border-box;
    }

    .form-group .btn {
      width: 100%;
      padding: 10px;
      border-radius: 3px;
      border: none;
      background-color: #4CAF50;
      color: #fff;
      font-weight: bold;
    }

    .form-group .btn-cancel {
      background-color: #ccc;
    }
  </style>
</head>
<body>
<div class="container">
  <h2>Registro</h2>
  <form method="post" action="<%=request.getContextPath()%>/LoginServlet?action=crearEstudiante">

    <div class="form-group">
      <input name="nombre" required aria-label="nombre" class="form-control form-control-user" type="text" placeholder="Nombre">
    </div>

    <div class="form-group">
      <input name="apellido" required aria-label="apellido"  class="form-control form-control-user" type="text" placeholder="Apellido">
    </div>

    <div class="form-group">
      <input name="edad" required aria-label="edad" min="18" max="29" class="form-control" type="number" placeholder="Edad">
    </div>

    <div class="form-group">
      <input name="codigo" required aria-label="codigo" min="00000000" max="99999999" type="number" class="form-control form-control-user" placeholder="Codigo PUCP">
    </div>

    <div class="form-group">
      <input name="correo" required aria-label="correo" class="form-control form-control-user" type="email" placeholder="Correo">
    </div>

    <div class="form-group">
      <input name="especialidad" required aria-label="especialidad" class="form-control-user" type="text" placeholder="Especialidad">
    </div>

    <div class="form-group">
      <input name= "contrasena"  required aria-label="contrasena" class="form-control-user" type="password" placeholder="Contraseña">
    </div>

    <div class="form-group">
      <input name= "confirmaContra"  required aria-label="confirmaContra" class="form-control-user" type="password" placeholder="Repita su contrtaseña">
    </div>

    <div class="form-group">
      <input type="submit" value="Registrarse" class="btn">
      <input type="submit" value="Cancelar" class="btn btn-cancel">
    </div>
  </form>
</div>

<div class="background"></div>
</body>
</html>

