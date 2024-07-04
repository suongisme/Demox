<%-- 
    Document   : updateJersey
    Created on : Jul 4, 2024, 9:14:34 AM
    Author     : Zanis
--%>

<%@page import="Model.JerseySize"%>
<%@page import="DAO.JerseySizeDAO"%>
<%@page import="DAO.JerseyDAO"%>
<%@page import="Model.Jersey"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div id="update-course-form" class="hidden">
    <%
        if (request.getParameter("jid") != null) {
            int ID = Integer.parseInt(request.getParameter("jid"));
            JerseySize t = new JerseySizeDAO().get(ID).get();
            if (t != null) {
                request.setAttribute("t", t);
            }
            Jersey a = new JerseyDAO().get(t.getJerseyID()).get();
            request.setAttribute("a", a);
        }
    %>
    <div class="overlay">
        <form class="card card-on card-update-form  mx-auto" action="../JerseyServlet" method="GET">
            <div id="update-course-close" style="width: 20%">
                <i class="add-course-button fas fa-times"></i>
            </div>
            <h3 class="form-heading" style="margin-bottom:  0">Edit Jersey</h3>
            <input type="hidden" name="command" value="UPDATE" />
            <input type="hidden" name="jid" value="${t.getSizeID()}" />
            <input type="hidden" name="cid" value="${t.getJerseyID()}" />
            <div class="form-group">
                <input type="text" name="jerseyName" placeholder="Jersey Name" value="${a.getJerseyName()}" />
            </div>
            <div class="form-group">
                <input name="description" placeholder="Description" value="${a.getJerseyDescription()}" />
            </div>
            <div class="form-group">
                <input type="number" name="jerseyPrice" placeholder="Jersey Price" value="${a.getJerseyPrice()}" />
            </div>
            <div class="form-group">
                <input type="text" readonly="" name="jerseySize" placeholder="Jersey Size" value="${t.getJerseySize()}" />
            </div>
            <div class="form-group">
                <input type="number" name="jerseyQuantity" placeholder="Jersey Quantity" value="${t.getJerseyQuantity()}" />
            </div>
            <div class="button-choice" style="text-align: center;">
                <button id="done-course-update" style="width: 20%" type="submit" class="save"><i class="fas fa-save"></i></button>
            </div>

        </form>
    </div>

</div>

