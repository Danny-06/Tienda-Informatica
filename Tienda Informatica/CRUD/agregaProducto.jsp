<%-- 
    Document   : agregaProducto
    Created on : 19 may. 2021, 9:59:45
    Author     : danie
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
    <style>
    :root {
      --f-c: fit-content;
      --m-f-c: -moz-fit-content;
      --fit-content: var(--f-c, --m-f-c);
    }

    * {
      box-sizing: border-box;
    }

    html, body {
      margin: 0;
      padding: 0;

      min-width: 100%;
      width: var(--fit-content);
      min-height: 100vh;
      height: var(--fit-content);
    }
    
    .imgProduct {
      width: 50vw;
    }
    
    
    </style>
  </head>
  <body>
    <img class="imgProduct" src="session_files/assets/productos/<%= request.getParameter("img") %>">
  </body>
</html>
