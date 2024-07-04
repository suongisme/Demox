<%-- 
    Document   : testReadExcel
    Created on : Jun 17, 2024, 5:02:27 PM
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
        <h2>Upload Excel File</h2>
        <form action="UploadExcelServlet" method="post" enctype="multipart/form-data">
            <label for="file">Select Excel file:</label>
            <input type="file" id="file" name="file" accept=".xlsx">
            <input type="submit" value="Upload">
        </form>
    </body>
</html>
