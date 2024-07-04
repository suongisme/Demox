<%-- 
    Document   : addTraining
    Created on : Jun 3, 2024, 2:49:44 PM
    Author     : Zanis
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div id="add-course-form" class="hidden" >
    <div class="overlay">
        <form class="card card-on card-add-form mx-auto" action="../TrainingServlet" method="GET" style="transition: ease-in 0.5s">
            <i id="add-course-close" class="fas fa-times"></i>
            <h3 class="form-heading">Add New Training</h3>
            <input type="hidden" name="command" value="ADD" />
            <div class="form-group">
                <input type="date" name="trainingDate" placeholder="Training Date" value="" />
            </div>
            <div class="form-group">
                <input type="time" name="trainingTime" placeholder="Training Time" value="" />
            </div>
            <div class="form-group">
                <input type="text" name="location" placeholder="Location" value="" />
            </div>
            <div class="form-group">
                <textarea name="description" placeholder="Description"></textarea>
            </div>
            <div class="button-choice" style="text-align: center;">
                <button style="width: 20%" type="submit" class="save"><i class="fas fa-save"></i></button>
            </div>
        </form>
    </div>
</div>
