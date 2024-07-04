<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Login</title>
        <link rel="stylesheet" href="../CSS/NAV/nav.css"/>
        <!-- Link to Bootstrap CSS -->
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
       <style>
            body {
                background-color: #f8f9fa;
            }
            .container {
                max-width: 80%;
                margin: 0 auto;
                margin-top: 100px;
                background-color: #fff;
                padding: 30px;
                border-radius: 10px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            }
            .form-group {
                margin-bottom: 20px;
            }
            .forgot-password {
                font-size: 14px;
            }
            .btn-login {
                width: 100%;
                font-size: 16px;
            }
            .circle-image {
            width: 80px;
            height: 80px;
            border-radius: 50%;
            object-fit: cover;
            display: inline-block;
            border: 5px solid #6e000b;
        }
        </style>
    </head>
    <body>
        <%@include file="../INCLUDES/nav.jsp" %>
      <div class="container" style="background-color: #9e1a27;color: white;">
             <div style="display: flex;justify-content: space-between; padding: 10px;">
                <img src="https://vntre.vn/uploads/images/2024/06/03/hinh-anh-va-y-nghia-logo-euro-2024-4-1717381187.jpg" width="150px" height="90px" alt="alt"/>
                <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/0/0a/UEFA_Champions_League_logo.svg/2560px-UEFA_Champions_League_logo.svg.png" width="180px" height="90px" alt="alt"/>
                <img src="https://irp.cdn-website.com/c57d8c85/dms3rep/multi/logo-world-cup-2022.webp" width="150px" height="90px" alt="alt"/>
            </div>
            <h1 class="my-4 text-center">MATCH STATISTIC</h1>
            
            <div style="display: flex;justify-content: space-between; padding: 20px 15%; ">
                <div style="display: flex;justify-content: space-between;align-items: center;height: 80px;background-color: white; border-radius: 45%  0  0 45% ;width: 50%;  ">
                    <img class="circle-image" src="${match.homeTeam.flag}" width="150px" height="90px" alt="alt"/>
                   
                    <span style="margin: 0; color: #9e1a27; font-weight:  bold ; font-size: 35px;">${match.homeTeam.teamName}</span>
                    <span style="background-color: #9e1a27;color: white;font-weight:  bold ; font-size: 35px;height: 80px; padding: 10px 10px 0 10px;"> ${match.matchHomeTeam.score}</span>
                </div>
                <div style="display: flex;justify-content: space-between;;align-items: center;height: 80px; background-color: white;border-radius: 0 45% 45% 0  ;width: 50%;   ">
                    <span style="background-color: #9e1a27;color: white;font-weight:  bold ; font-size: 35px;height: 80px; padding: 10px 10px 0 10px;">${match.matchAwayTeam.score} </span>
                    <span style="margin: 0; color: #9e1a27; font-weight:  bold ; font-size: 35px;">${match.awayTeam.teamName}</span>
                <img class="circle-image" src="${match.awayTeam.flag}" width="150px" height="90px" alt="alt"/>
            </div>
            </div>
             <div style="display: flex; justify-content: center; align-items: center; flex-direction: column;">
                <div class="elements-div" style="text-align: center; font-size: 25px; display: flex; justify-content: center;margin-bottom: 20px; background-color: #fff; width: 550px;"> 
                    <span style="background-color: white;color: #6e000b;font-weight: bold; padding: 8px;margin:  0; width: 80px;">${match.matchHomeTeam.ballPossession}</span>
                    <div style="border-bottom: 60px solid #6e000b;border-left: 25px solid transparent;height: 0;width: 0;"></div>
                    
                    <span style=" margin:  0  0px; background-color: #6e000b;font-weight: bold;padding: 8px 80px;">Ball Possession</span>
                    <div style="border-bottom: 60px solid #6e000b;border-right: 25px solid transparent;height: 0;width: 0;"></div>

                    <span style="background-color: white;color: #6e000b;font-weight: bold; padding: 8px;margin:  0; width: 80px;">${match.matchAwayTeam.ballPossession}</span>
                </div>
                
                <div class="elements-div" style="text-align: center; font-size: 25px; display: flex; justify-content: center;margin-bottom: 20px; background-color: #fff; width: 550px;"> 
                    <span style="background-color: white;color: #6e000b;font-weight: bold; padding: 8px;margin:  0; width: 80px;">${match.matchHomeTeam.cornerKicks}</span>
                    <div style="border-bottom: 60px solid #6e000b;border-left: 25px solid transparent;height: 0;width: 0;"></div>
                    
                    <span style=" margin:  0  0px; background-color: #6e000b;font-weight: bold;padding: 8px 80px;">Corner Kicks</span>
                    <div style="border-bottom: 60px solid #6e000b;border-right: 25px solid transparent;height: 0;width: 0;"></div>

                    <span style="background-color: white;color: #6e000b;font-weight: bold; padding: 8px;margin:  0; width: 80px;">${match.matchAwayTeam.cornerKicks}</span>
                </div>
                
                <div class="elements-div" style="text-align: center; font-size: 25px; display: flex; justify-content: center;margin-bottom: 20px; background-color: #fff; width: 550px;"> 
                    <span style="background-color: white;color: #6e000b;font-weight: bold; padding: 8px;margin:  0; width: 80px;">${match.matchHomeTeam.totalShots}</span>
                    <div style="border-bottom: 60px solid #6e000b;border-left: 25px solid transparent;height: 0;width: 0;"></div>
                    
                    <span style=" margin:  0  0px; background-color: #6e000b;font-weight: bold;padding: 8px 80px;">Total Shots</span>
                    <div style="border-bottom: 60px solid #6e000b;border-right: 25px solid transparent;height: 0;width: 0;"></div>

                    <span style="background-color: white;color: #6e000b;font-weight: bold; padding: 8px;margin:  0; width: 80px;">${match.matchAwayTeam.totalShots}</span>
                </div>
                
                <div class="elements-div" style="text-align: center; font-size: 25px; display: flex; justify-content: center;margin-bottom: 20px; background-color: #fff; width: 550px;"> 
                    <span style="background-color: white;color: #6e000b;font-weight: bold; padding: 8px;margin:  0; width: 80px;">${match.matchHomeTeam.redCards}</span>
                    <div style="border-bottom: 60px solid #6e000b;border-left: 25px solid transparent;height: 0;width: 0;"></div>
                    
                    <span style=" margin:  0  0px; background-color: #6e000b;font-weight: bold;padding: 8px 80px;">Red Cards</span>
                    <div style="border-bottom: 60px solid #6e000b;border-right: 25px solid transparent;height: 0;width: 0;"></div>

                    <span style="background-color: white;color: #6e000b;font-weight: bold; padding: 8px;margin:  0; width: 80px;">${match.matchAwayTeam.redCards}</span>
                </div>
                
                <div class="elements-div" style="text-align: center; font-size: 25px; display: flex; justify-content: center;margin-bottom: 20px; background-color: #fff; width: 550px;"> 
                    <span style="background-color: white;color: #6e000b;font-weight: bold; padding: 8px;margin:  0; width: 80px;">${match.matchHomeTeam.yellowCards}</span>
                    <div style="border-bottom: 60px solid #6e000b;border-left: 25px solid transparent;height: 0;width: 0;"></div>
                    
                    <span style=" margin:  0  0px; background-color: #6e000b;font-weight: bold;padding: 8px 80px;">Yellow Cards</span>
                    <div style="border-bottom: 60px solid #6e000b;border-right: 25px solid transparent;height: 0;width: 0;"></div>

                    <span style="background-color: white;color: #6e000b;font-weight: bold; padding: 8px;margin:  0; width: 80px;">${match.matchAwayTeam.yellowCards}</span>
                </div>
                
             </div>

        </div>
        <!-- Link to Bootstrap JS and dependencies -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</html>
