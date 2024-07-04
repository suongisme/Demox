<%-- 
    Document   : editTraining
    Created on : Jun 3, 2024, 2:49:56 PM
    Author     : Zanis
--%>

<%@page import="DAO.MeetingDAO"%>
<%@page import="Model.Meeting"%>
<%@page import="DAO.TrainingScheduleDAO"%>
<%@page import="Model.TrainingSchedule"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div id="update-course-form" class="hidden">
    <%
        if (request.getParameter("cid") != null) {
            int MeetingID = Integer.parseInt(request.getParameter("cid"));
            Meeting t = new MeetingDAO().get(MeetingID).get();
            if (t != null) {
                request.setAttribute("t", t);
            }
        }
    %>
    <div class="overlay">

        <form class="card card-on card-update-form  mx-auto" action="../MeetingServlet" method="GET">
            <div id="update-course-close" style="width: 20%">
                <i class="add-course-button fas fa-times"></i>
            </div>
            <h3 class="form-heading" style="margin-bottom:  0">Edit Meeting</h3>
            <input type="hidden" name="command" value="UPDATE" />
            <input type="hidden" name="cid" value="${t.getMeetingID()}" />
            <div class="form-group">
                <input type="date" name="trainingDate" placeholder="Training Date" value="${t.getMeetingDate()}" />
            </div>
            <div class="form-group">
                <input type="time" name="trainingTime" placeholder="Training Time" value="${t.getMeetingTime()}" />
            </div>
            <div class="form-group">
                <input type="text" name="location" placeholder="Location" value="${t.getLocation()}" />
            </div>
            <div class="form-group">
                <textarea name="description" placeholder="Description"></textarea>
            </div>
            <div class="button-choice" style="text-align: center;">
                <button id="done-course-update" style="width: 20%" type="submit" class="save"><i class="fas fa-save"></i></button>
            </div>

        </form>
    </div>

</div>
