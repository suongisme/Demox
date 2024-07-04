<%-- 
    Document   : test
    Created on : May 24, 2024, 10:36:57 AM
    Author     : Desktop
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <c:forEach var="p"  items="${listPlayer}">

                        <c:url var="deleteLink" value="../PlayerController">
                            <c:param name="command" value="DELETE"></c:param>
                            <c:param name="pid" value="${p.playerID}"></c:param>
                        </c:url>

                        <tr>
                            <td>${p.playerID}</td>
                            <td>${p.name}</td>
                            <td>${p.position}</td>
                            <td>${p.age}</td>
                            <td>${p.height}</td>
                            <td>${p.weight}</td>
                            


                            <td>

                                

                                <i class="fas fa-trash-alt"></i>
                        <c:if test="${not empty deleteLink}">
                            <a href="${deleteLink}" onclick="if (!(confirm('Sure?')))
                                        return false"><i class="fas fa-trash-alt"></i></a>
                        </c:if>

                        </td>

                        </tr>
                    </c:forEach>

    </body>
</html>
