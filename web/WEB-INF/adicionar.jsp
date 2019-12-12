<%-- 
    Document   : adicionar
    Created on : 06/12/2019, 22:07:54
    Author     : Aluno07
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Adicionar tarefas</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
        <link rel="icon" href="img/lista.png"/>
    </head>
    <body>
        <div class="container">
            <nav class="navbar navbar-inverse">
                <div class="container-fluid">
                    <!-- Brand and toggle get grouped for better mobile display -->
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <a class="navbar-brand" href="HomeServlet">Lista de tarefas</a>
                    </div>

                    <!-- Collect the nav links, forms, and other content for toggling -->
                    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                        <ul class="nav navbar-nav">
                            <li class="active"><a href="RedirecionamentoRemoverTarefa">Remover tarefa</a></li>
                        </ul>
                        <form action="LogoutServlet" method="GET" class="navbar-form navbar-right">
                            <button class="btn btn-default">Fazer logout</button>
                        </form>
                        <ul class="nav navbar-nav navbar-right">
                            <li><a href="#">Lista de tarefas de ${usuario.email}</a></li>
                        </ul>
                    </div><!-- /.navbar-collapse -->
                </div><!-- /.container-fluid -->
            </nav>


            <h2 class="text-center">Adicionar tarefas</h2>
            <form action="AdicionarServlet" method="POST">
                <div class="row">
                    <div class="form-group">
                        <label>Titulo</label>
                        <input type="text" name="assunto" class="form-control" placeholder="Titulo da tarefa aqui">
                    </div>
                </div>

                <c:if test="${tarefas.size() > 0}">
                    <%@include file="jspf/table.jsp"%>
                </c:if>
                
                <c:if test="${tarefas.size() == 0}"><h2 class="text-center">Sua lista de tarefas está vazia!</h2></c:if>

                <div class="row">
                    <div class="form-group">
                        <button class="btn btn-warning" type="submit">Adicionar</button>
                    </div>
                </div>
                <c:if test="${erro.length() > 0}"> 
                    <p class="alert alert-danger"><span class="glyphicon glyphicon-exclamation-sign"></span> ${erro} </p>
                </c:if>
            </form>
            <hr>
        </div>
    </body>
</html>
