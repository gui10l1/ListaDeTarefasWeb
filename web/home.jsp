<%-- 
    Document   : home
    Created on : 02/12/2019, 22:00:31
    Author     : Aluno07
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.Tarefa"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista de tarefas</title>
    </head>
    <body>
        <a href="LogoutServlet">Fazer logout</a>
        <h1>Olá, seja bem-vindo ${usuario.email}</h1>

        <form action="AdicionarServlet" method="POST">
            <p>
                <label>Titulo</label>
                <input type="text" name="assunto">
            </p>
            <p>
                <input type="submit" value="Adicionar tarefa">
            </p>
            <p>${erro}</p>
        </form>

    <c:if test="${tarefas.size() > 0}">
        <h2>Lista de Tarefas</h2>
        <form action="FinalizarServlet" method="POST">
            <c:forEach items="${tarefas}" var="t">
                <p>
                <input type="checkbox" value="${t.id}" name="idtarefas"> ${t.assunto} (<c:if test="${t.finalizada}">Finalizada</c:if> <c:if test="${!t.finalizada}">Em aberto</c:if>)
            </c:forEach>
            </p>
            <p>
                <input type="submit" value="Finalizar tarefa">
            </p>
        </form>

        <hr>

        <h2>Remover tarefas</h2>
        <form action="RemoverServlet" method="POST">
            <c:forEach items="${tarefas}" var="t">
                <p>
                <input type="checkbox" value="${t.id}" name="remover"> ${t.assunto} (<c:if test="${t.finalizada}">Finalizada</c:if> <c:if test="${!t.finalizada}">Em aberto</c:if>)
            </c:forEach>
            </p>
            <p>
                <input type="submit" value="Remover tarefa">
            </p>
        </form>
    </c:if>

    <c:if test="${tarefas.size() == 0}"><h2>Sua lista de tarefas está vazia!</h2></c:if>



</body>
</html>
