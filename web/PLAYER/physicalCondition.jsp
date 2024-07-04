<%-- 
    Document   : Training
    Created on : Jun 1, 2024, 7:41:32 AM
    Author     : Zanis
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="../CSS/COACH/list.css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.css">

    </head>
    <body>
        <div>
            <%@include file="../PLAYER/siderbar.jsp" %>
        </div>  

         <div class="coach-fun-content" style="padding: 20px; background-color: white; box-shadow: 0 0 12px 12px lightblue;">

            <div style="width: 100%; height: 100px"></div>
            <h1 style="text-align: center; color: black;">Player Physical Condition</h1>
            <table id="example" class="table table-bordered"  style="color: black">
                <thead>
                    <tr>
                        <th>
                            Id
                        </th>
                        <th>
                            Player Name
                        </th>
                        <th>
                            Date
                        </th>
                        <th>
                            Description
                        </th>

                    </tr>

                </thead>
                <tbody>
                    <c:forEach var="c" items="${pl}">

                        <tr>
                            <td>${c.conditionID}</td>
                            <td>${sessionScope.user.userName}</td>
                            <td>${c.dateRecorded}</td>
                            <td>${c.conditionDescription}</td>
                        </tr>
                    </c:forEach>
                </tbody>

            </table>
        </div>
        <script type="text/javascript" charset="utf8" src="https://code.jquery.com/jquery-3.5.1.js"></script>
        <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.js"></script>

        <script>
            $(document).ready(function () {
                $('#example').DataTable();
            });
        </script>

    </body>

</html>
