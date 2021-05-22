<%-- 
    Document   : agregaProducto
    Created on : 19 may. 2021, 9:59:45
    Author     : danie
--%>

<%@page import="java.util.Collections"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
  
  <%
    
    try {
    
      // Array que contiene los parametros que se envían a través del formulario
      String[] params = {
        request.getParameter("nameProduct"),
        request.getParameter("imgProductFileName"),
        request.getParameter("price")
      };

      boolean PARAMS_NOT_NULL = true;

      // Comprobar si alguno de los parámetros es nulo
      for(String param : params) {
        if(param == null) {
          PARAMS_NOT_NULL = false;
          break;
        }
      }

      // Si alguno de los parámetros es nulo se redireccionará a la página principal
      if( !PARAMS_NOT_NULL ) {
        response.sendRedirect("/Tienda Informatica/index.jsp");
      }

  %>
      
  <%
    } catch(Exception e) {
  %>

        <script>
          console.error("<%= e %>")
        </script>

  <%
    }
  %>

  <head>
      <title> <%= request.getParameter("nameProduct") %> </title>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
      <link rel="icon" href="favicon.ico">
      <link rel="stylesheet" href="agregaProducto_files/css/styles.css">
      <script defer src="session_files/js/scripts.js"></script>
  </head>

  <body>
    <input id="prefers-color-scheme" type="checkbox">
    <div id="app" class="forced-dark-theme">
      <!--<input id="panelLeftToggle" class="toggleInput" type="checkbox">-->
      <nav class="navBar">
<!--          <label class="left panelLeftToggle" for="panelLeftToggle">
              <img class="home" src="session_files/assets/icono-menu.png">
          </label>-->
          <div class="right">
              <div class="user">
                  <div class="name">
                      <%= session.getAttribute("user") %>
                  </div>
                  <label for="prefers-color-scheme">
                    <img class="icon" src="session_files/assets/userIcon.webp">
                  </label>
              </div>
          </div>
      </nav>
      <div class="main">
<!--          <aside class="panelLeft">
            <div class="itemPanel">OPCION</div>
            <div class="itemPanel">OPCION</div>
            <div class="itemPanel">OPCION</div>
            <div class="itemPanel">OPCION</div>
            <div class="itemPanel">OPCION</div>
            <div class="itemPanel">OPCION</div>
            <div class="itemPanel">OPCION</div>
            <div class="itemPanel">OPCION</div>
            <div class="itemPanel">OPCION</div>
            <div class="itemPanel">OPCION</div>
          </aside>
          <aside class="panelLeftFake">
          </aside>
       --><div class="content">
         <form class="form" action="session.jsp">
         <div class="productCard">
            <div class="titleProduct"> <%= request.getParameter("nameProduct") %> (<%= request.getParameter("price") %>€) </div>
            <img class="imgProduct" src="session_files/assets/productos/<%= request.getParameter("imgProductFileName") %>">
            
            <input name="idProductSubmit"          type="hidden" value="<%= request.getParameter("idProduct") %>">
            <input name="nameProductSubmit"        type="hidden" value="<%= request.getParameter("nameProduct") %>">
            <!--<input name="imgProductFileName"   type="hidden" value="<%= request.getParameter("imgProductFileName") %>">-->
            <input name="priceSubmit"              type="hidden" value="<%= request.getParameter("price") %>">
           
            <input name="quantitySubmit" autofocus id="quantity" type="text" value="1" autocomplete="off" required maxlength="2" pattern="[1-90-9]{1,2}?" placeholder="Introduce la cantidad del producto que desea">
            <input id="submit" type="submit" value="Enviar">
         </div>
         </form>
            
          <script>
           console.log("%cSession User: "     + "%c<%= session.getAttribute("user") %>", "color: #ff0", "")
           console.log("%cSession Password: " + "%c<%= session.getAttribute("password") %>", "color: #ff0", "")
           console.log("%cSession Attributes: "+ "%c<%= Collections.list( session.getAttributeNames() ) %>", "color: #ff0", "")
          </script>

        </div>
      </div>
  </body>

</html>
