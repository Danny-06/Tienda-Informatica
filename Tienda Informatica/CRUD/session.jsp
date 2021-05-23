<%-- 
    Document   : session
    Created on : 17 may. 2021, 13:43:10
    Author     : danie
--%>

<%@page import="java.util.Collections"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>

  <head>
      <title>Session</title>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
      <link rel="icon" href="favicon.ico">
      <link rel="stylesheet" href="session_files/css/styles.css">
      <!--<script defer src="session_files/js/scripts.js"></script>-->
  </head>

  <body>
    <input id="prefers-color-scheme" type="checkbox">
    <div id="app" class="forced-dark-theme">
      <input id="panelLeftToggle" class="toggleInput" type="checkbox">
      <nav class="navBar">
          <label class="left panelLeftToggle" for="panelLeftToggle">
              <img class="home" src="session_files/assets/icono-menu.png">
          </label>
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
          <aside class="panelLeft">
            
            <%
              
              // Comprobar si hay un usuario almacenado en la sessionStorage
              // Si no lo hay, redirigir a la página de 'Login' siempre
              // que intente acceder a esta página
              if( session.getAttribute("user") == null ) {
                response.sendRedirect("/Tienda Informatica/index.jsp");
              }


              // Destrucción de la sesión mediante la introducción de un parametro en la URL
              // 'reset=true'
              if( request.getParameter("reset") != null ) {
              if( request.getParameter("reset").equals("true") ) {
                session.removeAttribute("user");
                session.removeAttribute("password");
                response.sendRedirect("/Tienda Informatica/index.jsp");
              }
              }
             
              
              
              String[] carritoArray = {
                request.getParameter("idProductSubmit"),
                request.getParameter("nameProductSubmit"),
                request.getParameter("priceSubmit"),
                request.getParameter("quantitySubmit")
              };
              
              boolean CARRITO_NOT_NULL = true;

              // Comprobar si alguno de los parámetros del carrito es nulo
              for(String param : carritoArray) {
                if(param == null) {
                  CARRITO_NOT_NULL = false;
                  break;
                }
              }
              
              String productID = "";
              String productName = "";
              String productPrice = "";
              String productQuantity = "";

              // Crear o modificar sesión para el Producto si es diferente de 'null'
              if( CARRITO_NOT_NULL ) {
              if( session.getAttribute(productName) == null ) {
                productID = carritoArray[0];
                productName = carritoArray[1];
                productPrice = carritoArray[2];
                productQuantity = carritoArray[3];
                
                session.setAttribute( productName, new String[]{ productID, productPrice, productQuantity } );
              }
              }
              

              // Eliminar producto de la sesión
              if( request.getParameter("deleteProduct") != null ) {
                session.removeAttribute( request.getParameter("deleteProduct") );
              }
      
            %>

            
            <%
              // Si la sesión solo tiene dos atributos ('user' y 'password')
              // lo cuál significa que no hay ningún producto en el carrito
              // por lo que se mostrará un mensaje de que todavía no hay ningún
              // producto en el carrito
              if( Collections.list( session.getAttributeNames() ).size() == 2 ) {
            %>
            <div class="itemPanel mensajePanel">
              NO HAY PRODUCTOS EN EL CARRITO
            </div>
            <a href="table.jsp">
              <div class="itemPanel button">
                Acceder al Registro
              </div>
            </a>

            <%
              } else {
            %>
            
            <a href="table.jsp">
             <div class="itemPanel submitProducts">
              TERMINAR COMPRA
            </div>
            </a>
            
            <%
              }
            %>
            
            <%
              
              for( String nombre : Collections.list( session.getAttributeNames() ) ) {
                if( nombre.equals("user") || nombre.equals("password") ) continue;
            %>
              
              <div class="itemPanel">
                <%= nombre %> <% // Nombre del producto %>
               (<%= ((String[])session.getAttribute(nombre))[1] %>€) <% // Precio del producto %>
               x<%= ((String[])session.getAttribute(nombre))[2] %> <% // Cantidad del producto %>
               <form action="session.jsp">
                <input name="deleteProduct" type="hidden" value="<%= nombre %>">
                <input type="submit" value="X" class="deleteProduct">
               </form>
              </div>
            
            <%
              }
            %>
            
          </aside>
          <aside class="panelLeftFake"></aside><!--
       --><div class="content">
         
         
         <%
           try {

           Class.forName("com.mysql.jdbc.Driver");
           Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/tienda", "phpmyadmin", "1234");

           Statement s = conexion.createStatement();
           ResultSet productosSQL = s.executeQuery ("SELECT * FROM productos");


           // Lista de productos 
           ArrayList<String> productos = new ArrayList<String>();
           
           while( productosSQL.next() ) {

             productos.add(
             "<a href='agregaProducto.jsp?"
             // Parametros de URL a pasar a 'agregaProducto.jsp'
             + "imgProductFileName="+ productosSQL.getString("nombreArchivo")
             +"&idProduct="+ productosSQL.getString("id")
             +"&nameProduct="+ productosSQL.getString("nombre")
             +"&price="+ productosSQL.getString("precio")
             
             +"'>"
             +  "<img class='thumbnail' src='session_files/assets/productos/"+ productosSQL.getString("nombreArchivo") +"'>"
             +  "<div class='precio'>"+ productosSQL.getString("precio") +"€</div>"
             +"</a>"
             );

           }

           conexion.close();
         %>

         <%
           for(int i = 1; i <= 4; i++) {
         %>
              <div class="LIC">
              <%
                for(int j = 1; j <= 4; j++) {
              %>
                  <div class="CIL">
                      <%= productos.get( (j-1) + 4*(i-1) ) %>
                  </div>
              <%
                }
              %>
              </div>
         <%
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
          </div>


          <script>
           console.log("%cSession User: "     + "%c<%= session.getAttribute("user") %>", "color: #ff0", "")
           console.log("%cSession Password: " + "%c<%= session.getAttribute("password") %>", "color: #ff0", "")
           console.log("%cSession Attributes: "+ "%c<%= Collections.list( session.getAttributeNames() ) %>", "color: #ff0", "")
          </script>


      </div>
    </div>
  </body>

</html>