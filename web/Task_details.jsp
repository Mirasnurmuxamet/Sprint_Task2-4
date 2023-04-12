<%@ page import="kz.bitlab.techorda.db.Tasks" %><%--
  Created by IntelliJ IDEA.
  User: Miras
  Date: 11.04.2023
  Time: 11:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Task-details</title>
    <%@include file="Head.jsp"%>
</head>
<body>
<%@include file="Tasks_Navbar.jsp"%>

<%
    Tasks task = (Tasks) request.getAttribute("zadacha");
    if(task!=null){
%>
<br>
<div class="row">
    <div class="col-md-8 mx-auto">
        <form action="/edit_task" method="post">
            <input type="hidden" class="form-control" name="task_id" value="<%=task.getId()%>">
            <div class="row">
                <div class="col-12">
                    <label> Название: </label>
                </div>
            </div>
            <div class="row mt-2">
                <div class="col-12">
                    <input type="text" class="form-control" name="task_name" value="<%=task.getName()%>">
                </div>
            </div>
            <div class="row mt-3">
                <div class="col-12">
                    <label>Описание: </label>
                </div>
            </div>
            <div class="row mt-2">
                <div class="col-12">
                    <textarea
                            class="form-control"
                            name="task_description"
                            rows="5"><%=task.getDescription()%>
                    </textarea>
                </div>
            </div>
            <div class="row mt-3">
                <div class="col-12">
                    <label>Крайний срок: </label>
                </div>
            </div>
            <div class="row mt-2">
                <div class="col-12">
                    <input
                            type="date"
                            class="form-control"
                            name="task_deadlineDate"
                            value="<%=task.getDeadlineDate()%>">
                </div><br><br>
            </div>
            <div class="row">
                <div class="col-12">
                    <label>Выполнено: </label>
                </div>
            </div>
            <div class="row mt-2">
                <div class="col-12">
                    <select class="form-control" name="task_status">
                        <option <%=(task.getStatus().equals("Да")?"selected":"")%>>Да</option>
                        <option <%=(task.getStatus().equals("Нет")?"selected":"")%>>Нет</option>
                    </select>
                </div>
            </div>
            <div class="modal-footer" >
            </div>
            <br><br>
            <button type="submit" class="btn btn-success mx-2">Сохранить</button>
            <button type="button" class="btn btn-danger mx-0" data-bs-toggle="modal" data-bs-target="#delete">
                Уадалить
            </button>
        </form>
        <div class="modal fade" id="delete"
             data-bs-backdrop="static"
             data-bs-keyboard="false"
             tabindex="-1"
             aria-labelledby="staticBackdropLabel"
             aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="/delete_task" method="post">
                        <input type="hidden" name="task_id" value="<%=task.getId()%>">
                        <div class="modal-header">
                            <h1 class="modal-title fs-5" id="staticBackdropLabel">Предупреждение</h1>
                            <button type="button"
                                    class="btn-close"
                                    data-bs-dismiss="modal"
                                    aria-label="Close">
                            </button>
                        </div>
                        <h4 class="modal-body">
                            Вы уверены?
                        </h4>
                        <div class="modal-footer">
                            <button class="btn btn-danger">Да</button>
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Нет</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<%
    }
    else{
%>
<h2 class="text-lg-center" >Нет данных</h2>
<%
    }
%>
</body>
</html>
