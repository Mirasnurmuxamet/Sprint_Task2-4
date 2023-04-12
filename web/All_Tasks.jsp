<%@ page import="java.util.ArrayList" %>
<%@ page import="kz.bitlab.techorda.db.Tasks" %><%--
  Created by IntelliJ IDEA.
  User: Miras
  Date: 09.04.2023
  Time: 15:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>All-Tasks</title>
    <%@include file="Head.jsp"%>
</head>
<body>
<%@include file="Tasks_Navbar.jsp"%>
<div>
    <button type="button" class="btn btn-primary m-3" data-bs-toggle="modal" data-bs-target="#add_task">
        Добавить задание
    </button>
    <div class="modal fade" id="add_task" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="staticBackdropLabel">Новое задание</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form action="/add_task" method="post">
                        <div class="row">
                            <div class="col-12">
                                <label> Название: </label>
                            </div>
                        </div>
                        <div class="row mt-2">
                            <div class="col-12">
                                <input type="text" class="form-control" name="task_name">
                            </div>
                        </div>
                        <div class="row mt-3">
                            <div class="col-12">
                                <label>Описание: </label>
                            </div>
                        </div>
                        <div class="row mt-2">
                            <div class="col-12">
                                <textarea name="task_description" class="form-control" rows="5"></textarea>
                            </div>
                        </div>
                        <div class="row mt-3">
                            <div class="col-12">
                                <label>Крайний срок: </label>
                            </div>
                        </div>
                        <div class="row mt-2">
                            <div class="col-12">
                                <input type="date" class="form-control" name="task_deadlineDate">
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button class="btn btn-success">Добавить</button>
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="px-5">
    <table class="table tab-content">
        <thead>
        <tr>
            <th> ID</th>
            <th>Наименование</th>
            <th>Крайний срок</th>
            <th>Выполнено</th>
            <th class="px-0">Детали</th>
        </tr>
        </thead>
        <tbody>
        <%
            ArrayList<Tasks> tasks = (ArrayList<Tasks>) request.getAttribute("all_tasks");
            if(tasks!=null){
                for(Tasks t: tasks){

        %>
        <tr>
            <td> <%=t.getId()%></td>
            <td><%=t.getName()%></td>
            <td><%=t.getDeadlineDate()%></td>
            <td><%=t.getStatus()%></td>
            <td class="px-0">
                <a href="/details?task_id=<%=t.getId()%>">
                    <button
                    type="submit"
                    class="btn btn-primary btn-sm">
                        Детали
                    </button>
                </a>
            </td>
        </tr>
        <%
               }
            }
        %>
        </tbody>
    </table>
</div>
</body>
</html>
