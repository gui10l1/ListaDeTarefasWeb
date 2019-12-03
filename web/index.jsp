<%-- 
    Document   : login
    Created on : 02/12/2019, 21:10:30
    Author     : Aluno07
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
    </head>
    <body>
        <h1>Lista de tarefas</h1>
        <h2>Login</h2>
        <form action="LoginServlet" method="POST">
            <p>
                <label>Email</label>
                <input type="text" name="email">
            </p>
            <p>
                <label>Senha</label>
                <input type="password" name="senha">
            </p>
            <p>
                <input type="submit" value="Entrar">
            </p>
            
            <p>${erro}</p>
            
            <a href="cadastro.jsp">Não tem uma conta? Faça cadastro!</a>
        </form>
    </body>
</html>
