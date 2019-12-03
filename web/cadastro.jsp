<%-- 
    Document   : cadastro
    Created on : 02/12/2019, 19:58:09
    Author     : Aluno07
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro</title>
    </head>
    <body>
        <h1>Faça seu cadastro</h1>
        <form action="CadastroServlet" method="POST">
            <p>
                <label>Email</label>
                <input type="text" name="email">
            </p>
            
            <p>
                <label>Senha</label>
                <input type="password" name="senha">
            </p>
            
            <p>
                <input type="submit" value="Enviar">
            </p>
            
            <p>
                <a href="index.html">Voltar</a>
            </p>
            
            <p>
                ${erro}
            </p>
        </form>
    </body>
</html>
