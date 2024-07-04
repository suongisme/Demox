<%-- 
    Document   : editMatchStatistic
    Created on : Jun 3, 2024, 4:26:28 PM
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
        <div id="edit-form" style="display: none" >

            <div class="overlay">
                <form class="card card-on card-add-form mx-auto" onsubmit="submitForm(event, UpdateMatch())" style="transition: ease-in 0.5s" >
                    <i id="close-edit" class="add-player-close fas fa-times"></i>
                    <h3 class="form-heading">Edit Match Statistic</h3>
                    <input type="hidden" name="command" value="ADD" />
                    <input type="hidden" name="mtid" value="" />
                    <div class="form-group">
                        <label for="match1">Match</label>
                        <select name="match1" required="">

                        </select>

                    </div>
                    <div class="form-group">
                        <label for="team1"> Team</label>

                        <select name="team1" readonly>

                        </select>

                    </div>
                    <div class="form-group">
                        <label for="score1"> Score</label>
                    <input  name="score1"    value="" type="number"  min="0"  step="1" required=""/>

                    </div>
                    <div class="form-group">
                        <label for="yellow1"> Yellow Cards </label>
                        <input  name="yellow1"    value="" type="number"  min="0"  step="1" required=""/>

                    </div>
                    <div class="form-group">
                        <label for="red1"> Red Cards </label>
                        <input  name="red1"    value="" type="number"  min="0"  step="1" required=""/>

                    </div>
                    <div class="form-group">
                        <label for="shot1"> Total Shots </label>
                        <input  name="shot1"    value="" type="number"  min="0"  step="1" required=""/>

                    </div>
                    <div class="form-group">
                        <label for="corner1"> Corner Kicks </label>
                        <input  name="corner1"    value="" type="number"  min="0"  step="1" required=""/>

                    </div>
                    <div class="form-group">
                        <label for="pass1n"> Passes </label>
                        <input  name="pass1"    value="" type="number"  min="0"  step="1" required=""/>

                    </div>
                    <!--                    <div class="form-group">
                                            <label for="location"> Ball Possession </label>
                                            <input type="text" name="ball"  placeholder="team"  value="" required="You are not fill"/>
                    
                                        </div>-->



                    <div class="button-choice add-button" style="text-align: center;">
                        <button id="add-save" style="width: 20%" type="submit" class="save save-edit"><i class="fas fa-save"></i></button>
                    </div>
                </form>
            </div>
        </div>
    </body>
</html>
