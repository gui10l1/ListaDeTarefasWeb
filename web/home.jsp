<%-- 
    Document   : home
    Created on : 02/12/2019, 22:00:31
    Author     : Aluno07
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="modelo.Tarefa"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <a href="LogoutServlet">Fazer logout</a>
        <h1>Olá, seja bem-vindo ${usuario.email} a lista de tarefas</h1>
           
        <ul>
           
        </ul>
    </body>
</html>
