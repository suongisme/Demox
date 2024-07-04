<%-- 
    Document   : editListMatches
    Created on : Jun 2, 2024, 12:11:09 AM
    Author     : Desktop
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

        <%@include file="../INCLUDES/head.jsp" %>
        <div id="edit-form" style="display: none;" >

            <div class="overlay">
                <form class="card card-on card-add-form mx-auto" onsubmit="SubmitForm(event, UpdateMatch())"  style="transition: ease-in 0.5s" >
                    <i id="close-edit" class="add-player-close fas fa-times"></i>
                    <h3 class="form-heading">Edit News</h3>
                    <input type="hidden" name="command" value="UPDATE" />
                    <input type="hidden" name="mid"  />



                    <div class="form-group">
                        <label for="playerName">Away Team</label>

                        <select name="awayteam1" required="">
                            <c:forEach var="t" items="${teams}" >
                                <option value="${t.teamID}">
                                    ${t.teamName}
                                </option>                                                                  
                            </c:forEach>
                        </select>
                    </div>

                    <div class="form-group">
                        <label for="playerName">Home Team</label>

                        <select name="hometeam1" required="" >                           
                            <option value="${hometeam.teamID}" selected="" >
                                ${hometeam.teamName}
                            </option>                                                                  

                        </select>

                    </div>

                    <div class="form-group">
                        <label for="Location"> Location</label>
                        <input type="text" name="matchlocation"  placeholder="News Description"  required="You are not fill"/>

                    </div>

                    <div class="form-group">
                        <label for="course_price"> Match Date</label>
                        <input type="date" name="matchdate1"  placeholder=""  min="${today}" max="${maxDateString}"/>
                    </div>

                    <div class="form-group">
                        <label for="hometeam">Tournament</label>
                        <select name="tour1">
                            <c:forEach var="t" items="${tournaments}" >
                                <option value="${t}">
                                    ${t}
                                </option>                                                                  
                            </c:forEach>
                        </select>

                    </div>


                    <div  class="button-choice " style="text-align: center;">
                        <button  style="width: 20%" type="submit" class="save save-edit"><i class="fas fa-save"></i></button>
                    </div>
                </form>
            </div>
        </div>

    </body>
</html>
