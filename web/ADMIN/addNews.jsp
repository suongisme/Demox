<%-- 
    Document   : addNews
    Created on : May 25, 2024, 2:40:53 PM
    Author     : Desktop
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="../css/style.css">
        <script src="https://cdn.ckeditor.com/4.16.2/standard/ckeditor.js"></script>
    </head>
    <body>
        <%@include file="../INCLUDES/head.jsp" %>
        <div id="add-form" style="display: none" >
            <div class="overlay">
                <form id="add-news" class=" card card-on card-add-form mx-auto"  onsubmit="Submit(event,addNews)"  >
                    <i id="add-close" class="add-player-close fas fa-times"></i>
                    <h3 class="form-heading">Add New NEWS</h3>
                    <input type="hidden" name="command" value="ADD" />


                    <div class="form-group">
                        <label for="playerName">News title</label>
                        <input type="text" name="newstitle" id="newstitle" placeholder="News title" value="" required/>
                    </div> 
                    <div class="form-group">
                        <label for="playerName">News Description</label>
                        <input type="text" name="description"  placeholder="News Description" value="" required/>
                    </div>   

                    <div class="form-group">
                        <label for="course_price">News image</label>
                        <input type="file" name="newsimage" id="newsimage" placeholder="News image" required/>
                    </div>

                    <div class="form-group">
                        <textarea  name="content" id="contentNews" required="" form="add-news"></textarea>
                    </div>

                    <div  class="button-choice" style="text-align: center;">
                        <button id="add-save" style="width: 20%" type="submit" class="save"><i class="fas fa-save"></i></button>
                    </div>
                </form>
                
            </div>
            <div class="error-message" id="errorMessage">
                        <i class="fas fa-exclamation-triangle"></i>
                    </div>
        </div>
        <script>
            CKEDITOR.replace('contentNews', {
                 filebrowserUploadUrl: '/SWPClubManegement/FileUploadServlet',
                filebrowserUploadMethod: 'form',
                filebrowserBrowseUrl: '/SWPClubManegement/FileBrowserServlet'
            });
        </script>
    </body>
</html>
