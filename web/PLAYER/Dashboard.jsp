<%-- 
    Document   : Training
    Created on : Jun 1, 2024, 7:41:32 AM
    Author     : Zanis
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="../CSS/COACH/list.css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.css">
    </head>
    <body>
        <div>
            <%@include file="../PLAYER/siderbar.jsp" %>
        </div>  
        <div class="coach-fun-content" style="padding: 20px; background-color: white; box-shadow: 0 0 12px 12px lightblue;">
            <div style="width: 100%; height: 100px"></div>
            <h1 style="text-align: center; color: black;">Dashboard</h1>

            <div class="row">
                <div class="col-md-6">
                    <div>
                        <canvas id="myChart"></canvas>
                    </div>
                </div>
                <div class="col-md-6">
                    <div>
                        <canvas id="myChart1"></canvas>
                        <canvas id="myChart2"></canvas>
                    </div>
                </div>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
        <script>
            const ctx = document.getElementById('myChart').getContext('2d');
            new Chart(ctx, {
                type: 'polarArea',
                data: {
                    labels: [
                        'Total Red Cards',
                        'Total Yellow Cards',
                        'Total Goals'
                    ],
                    datasets: [{
                            label: 'Player Statistics',
                            data: [${a.totalRed}, ${a.totalYellow}, ${a.totalGoals}],
                            backgroundColor: [
                                'rgb(255, 99, 132)',
                                'rgb(255, 205, 86)',
                                'rgb(201, 203, 207)'
                            ]
                        }]
                },
                options: {
                    scales: {
                        y: {
                            beginAtZero: true
                        }
                    }
                }
            });

            const ctx12 = document.getElementById('myChart1').getContext('2d');
            const labels = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'];
            new Chart(ctx12, {
                type: 'line',
                data: {
                    labels: labels,
                    datasets: [{
                            label: 'Monthly Treatment Data',
                            data: [${nm.get(0)}, ${nm.get(1)}, ${nm.get(2)}, ${nm.get(3)}, ${nm.get(4)}, ${nm.get(5)}, ${nm.get(6)}, ${nm.get(7)}, ${nm.get(8)}, ${nm.get(9)}, ${nm.get(10)}, ${nm.get(11)}],
                            fill: false,
                            borderColor: 'rgb(75, 192, 192)',
                            tension: 0.1
                        }]
                }
            });

            const ctx2 = document.getElementById('myChart2').getContext('2d');
            new Chart(ctx2, {
                type: 'line',
                data: {
                    labels: labels,
                    datasets: [{
                            label: 'Monthly Meeting Data',
                            data: [${n.get(0)}, ${n.get(1)}, ${n.get(2)}, ${n.get(3)}, ${n.get(4)}, ${n.get(5)}, ${n.get(6)}, ${n.get(7)}, ${n.get(8)}, ${n.get(9)}, ${n.get(10)}, ${n.get(11)}],
                            fill: false,
                            borderColor: 'rgb(75, 192, 192)',
                            tension: 0.1
                        }]
                }
            });
        </script>

        <script type="text/javascript" charset="utf8" src="https://code.jquery.com/jquery-3.5.1.js"></script>
        <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.js"></script>
        <script>
            $(document).ready(function () {
                $('#example').DataTable();
            });
        </script>
    </body>
</html>
