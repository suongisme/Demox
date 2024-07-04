<%-- 
    Document   : fileBrowser
    Created on : May 30, 2024, 4:57:32 PM
    Author     : Desktop
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            body {
                font-family: Arial, sans-serif;
            }
            .file-list {
                list-style-type: none;
            }
            .file-list li {
                margin: 5px 0;
            }
        </style>
        <script>
            function selectFile(url) {
                window.opener.CKEDITOR.tools.callFunction(getUrlParam('CKEditorFuncNum'), url);
                window.close();
            }

            function getUrlParam(paramName) {
                const reParam = new RegExp('(?:[?&]|&)' + paramName + '=([^&]+)', 'i');
                const match = window.location.search.match(reParam);
                return (match && match.length > 1) ? match[1] : null;
            }
        </script>
    </head>
    <body>
        <h1>Select a file</h1>
        <ul class="file-list">
            <li><a href="#" onclick="selectFile('/uploads/file1.jpg')">file1.jpg</a></li>
            <li><a href="#" onclick="selectFile('/uploads/file2.png')">file2.png</a></li>
            <!-- List other files similarly -->
        </ul>
    </body>
</html>
