<%-- 
    Document   : createAccount
    Created on : Jun 4, 2024, 5:52:07 PM
    Author     : Desktop
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="Model.Role"%>
<%@page import="Model.Tournament"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    List<Role> roleList = new ArrayList<>();
    for (Role role : Role.values()) {
        if (role != Role.valueOf("User") && role != Role.valueOf("Admin")) {
            roleList.add(role);
        }
    }
    request.getSession().setAttribute("role", roleList);
%>
<div id="register-form" style="display: none" >

    <div class="overlay">
        <form id="myForm" class="card-on card-add-form mx-auto" onsubmit="SubmitForm(event, Register)" style="transition: ease-in 0.5s" >
            <i id="register-close" class="add-player-close fas fa-times"></i>
            <h3 class="form-heading">Create Account</h3>
            <input type="hidden" name="command" value="ADD" />

            <div class="form-group">
                <label for="name">User Name:</label>
                <input type="text" id="name" name="name" required>

            </div>
            <div class="form-group">
                <label for="imageUpload">Image</label>
                <input type="file" id="fileUpload" name="file">


            </div>

            <div class="form-group">

                <label for="email">Email:</label>
                <input type="email" id="email" name="email" required>

            </div>

            <div class="form-group">
                <label for="password">Password:</label>
                <div id="generateBtn"><i class="fas fa-dice"></i><label>(Random Password)</label></div>

                <input type="text" id="password" name="password" required>
            </div>

            <div class="form-group">
                <label for="role">Role</label>
                <select name="role">
                    <c:forEach var="t" items="${role}" >
                        <option value="${t}">
                            ${t}
                        </option>                                                                  
                    </c:forEach>
                </select>

            </div>



            <div class="button-choice " style="text-align: center;">
                <button id="create-button" style="width: 20%" type="submit" class="save"><i class="fas fa-save"></i></button>
            </div>
             <div class="loading-spinner mb-2" id="loadingSpinner">

                                        </div>
        </form>
    </div>
</div>

