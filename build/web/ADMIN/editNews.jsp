<%-- 
    Document   : editNews
    Created on : May 29, 2024, 10:25:16 PM
    Author     : Desktop
--%>

<%@page import="Model.News"%>
<%@page import="DAO.NewsDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="../INCLUDES/head.jsp" %>
        <div id="edit-form" style="display: none" >
            <%
                NewsDAO ndao1 = new NewsDAO();

                String nid1 = request.getParameter("nid");
                String open = request.getParameter("open");
                if (nid1 != null && open != null) {
                    News n1 = ndao1.get(Integer.parseInt(nid1)).get();
                    request.setAttribute("openEdit", open);
                    request.setAttribute("news", n1);

                }


            %>
            <div class="overlay">
                <form id="edit" class="card card-on card-add-form mx-auto" onsubmit="Submit(event , UpdateNews())">
                    <i id="close-edit" class="add-player-close fas fa-times"></i>
                    <h3 class="form-heading">Edit Match Schedule</h3>
                    <input type="hidden" name="command" value="UPDATE" />
                    <input type="hidden" name="nid" value="" />
                    <div class="form-group">
                        <label for="playerName">News Title</label>
                        <input type="text" name="newstitle1"  placeholder="News Description" value="${news.newsTitle}" required="You are not fill"/>
                    </div>

                    <div class="form-group">
                        <label for="playerName">News Description</label>
                        <input type="text" name="description1"  placeholder="News Description" value="${news.description}" required="You are not fill"/>
                    </div>

                    <div class="form-group">
                        <label for="course_price"> Old News image</label>
                        <img src="../IMAGE/NEWS/${news.newsImageDescription}" class="old-image" width="50px" height="50px" alt="alt"/>
                    </div>
                    <div class="form-group">
                        <label for="course_price"> New News image</label>
                        <input type="file" name="newsimage1" id="newsimage" placeholder="News image" " />
                    </div>


                    <div class="form-group">
                        <textarea name="content1" id="contentNews1" required>${news.newsContent}</textarea><br>
                    </div>

                    <div class="button-choice" style="text-align: center;">
                        <button style="width: 20%" type="submit" class="save"><i class="fas fa-save"></i></button>
                    </div>
                </form>
            </div>
                    <div class="error-message" id="errorMessage1">
                        
                    </div>
        </div>
        <script>
            CKEDITOR.replace('contentNews1', {
                filebrowserUploadUrl: '/SWPClubManegement/FileUploadServlet',
                filebrowserUploadMethod: 'form',
                filebrowserBrowseUrl: '/SWPClubManegement/FileBrowserServlet'
                
            });
        </script>
    </body>
</html>
