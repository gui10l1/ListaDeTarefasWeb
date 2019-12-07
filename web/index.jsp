<%-- 
    Document   : login
    Created on : 02/12/2019, 21:10:30
    Author     : Aluno07
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/style.css"> 
        <link href="https://fonts.googleapis.com/css?family=Open+Sans&display=swap" rel="stylesheet">
        <link rel="icon" href="img/lista.png"/>
    </head>
    <body>
        <div class="container">
            <h1 class="titulo">Lista de tarefas</h1>
            <div class="panel-group">
                <div class="panel panel-primary">
                    <div class="panel-heading titulo titulo-login">Login</div>
                    <div class="panel-body">
                        <form action="LoginServlet" method="POST">
                            <div class="form-group">
                                <label>Email</label>
                                <input type="text" name="email" class="form-control" placeholder="Seu email aqui">
                            </div>
                            <div class="form-group">
                                <label>Senha</label>
                                <input type="password" name="senha" class="form-control" placeholder="Sua senha aqui">
                            </div>
                            <div class="form-group">
                                <button class="btn btn-info" type="submit">Enviar</button>
                                <button class="btn btn-default" type="reset">Limpar</button>
                            </div>
                        </form>
                    </div>
                    <div class="panel-footer">
                        <c:if test="${erro.length() > 0}"> 
                            <p class="alert alert-danger"><span class="glyphicon glyphicon-exclamation-sign"></span> ${erro} </p>
                        </c:if>
                        <a href="cadastro.jsp">Não tem uma conta? Faça cadastro!</a>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
