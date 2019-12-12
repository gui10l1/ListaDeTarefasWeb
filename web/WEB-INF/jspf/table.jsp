<%@page contentType="text/html" pageEncoding="UTF-8"%>
<table class="table">
    <thead class="thead-light">
        <tr>
            <th scope="col">ID</th>
            <th scope="col">Título</th>
            <th scope="col">Status</th>
            <th scope="col">Finalizar</th>
        </tr>
    </thead>
    <tbody>
    <c:forEach items="${tarefas}" var="t">
        <tr>
            <th scope="row">${t.id}</th>
            <td>${t.assunto}</td>
            <td><c:if test="${t.finalizada}">Finalizada</c:if> <c:if test="${!t.finalizada}">Em aberto</c:if></td>
        <td><input type="checkbox" value="${t.id}" name="idtarefas"></td>
        </tr>
    </c:forEach>
</tbody>
</table>
