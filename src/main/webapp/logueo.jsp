<%--
  Created by IntelliJ IDEA.
  User: djcll
  Date: 16/06/2023
  Time: 14:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Iniciar sesión</title>
    <style>
        body {
            background-image: url("images/fondo.jpg");
            background-size: cover;
            background-position: center;
        }

        .container {
            width: 300px;
            margin: 100px auto;
            background-color: #fff;
            padding: 20px;
            text-align: center;
        }

        .logo {
            width: 100px;
            height: 100px;
            margin: 0 auto 20px;
            background-image: url("images/logo.png");
            background-size: cover;
        }

        .form-group {
            margin-bottom: 10px;
        }

        .form-group input[type="text"],
        .form-group input[type="password"] {
            width: 100%;
            padding: 8px;
        }

        .form-group input[type="submit"] {
            width: 100%;
            padding: 8px;
            background-color: #4CAF50;
            color: white;
            border: none;
        }

        .form-group input[type="submit"]:hover {
            background-color: #45a049;
            cursor: pointer;
        }

        .register-link {
            display: block;
            margin-top: 10px;
        }
    </style>
</head>
<body>
<form class="signin-form" method="POST" action="<%=request.getContextPath()%>/LoginServlet" >
<div class="container">
    <div class="logo"></div>

        <div class="form-group">
            <input type="text" name="codigoPUCP" id="codigoPUCP" placeholder="codigoPUCP" required >
        </div>
        <div class="form-group">
            <input type="password" name="contrasena" id="contrasena" placeholder="contrasena" required>
        </div>
        <% if (request.getParameter("error") != null) {%>
        <div class="form-group text-danger mb-3">Usuario o contraseña incorrectos</div>
        <% }%>
        <div class="form-group">
            <input type="submit" value="Ingresar"href="<%= request.getContextPath()%>/ViajesServlet">
        </div>
    <a class="register-link" href="registro.jsp">Registrarse</a>
</div>
</form>
</body>
</html>
