<%-- 
    Document   : cadastro
    Created on : 02/12/2019, 19:58:09
    Author     : Aluno07
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
        <link href="https://fonts.googleapis.com/css?family=Open+Sans&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="assets/style.css"/>
        <link rel="icon" href="img/lista.png"/>
    </head>
    <body>
        <div class="container">
            <h1 class="titulo">Lista de tarefas</h1>
            <div class="panel panel-primary">
                <div class="panel-heading titulo-login">Cadastro</div>
                <div class="panel-body">
                    <form action="CadastroServlet" method="POST">
                        <div class="form-group">
                            <label>Email</label>
                            <input type="text" name="email" class="form-control" placeholder="Seu email para cadastro aqui">
                        </div>

                        <div class="form-group">
                            <label>Senha</label>
                            <input type="password" name="senha" class="form-control" placeholder="Sua nova senha aqui">
                        </div>

                        <div class="form-group">
                            <button class="btn btn-info" type="submit">Cadastrar</button>
                            <button class="btn btn-default" type="reset">Limpar</button>
                        </div>
                    </form>
                </div>
                <div class="panel-footer">
                    <c:if test="${erro.length() > 0}"> 
                        <p class="alert alert-danger"><span class="glyphicon glyphicon-exclamation-sign"></span> ${erro} </p>
                    </c:if>
                    <c:if test="${erro2.length() > 0}"> 
                        <p class="alert alert-danger"><span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>  ${erro2} </p>
                    </c:if>
                    <a href="index.jsp" class="text-primary">Voltar</a>
                </div>
            </div>
        </div>
    </body>
</html>
