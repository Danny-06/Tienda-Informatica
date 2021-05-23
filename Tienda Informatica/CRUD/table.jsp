<%-- 
    Document   : session
    Created on : 17 may. 2021, 13:43:10
    Author     : danie
--%>

<%@page import="java.util.Collections"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>

  <head>
      <title>Table</title>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
      <meta name="mobile-web-app-capable" content="yes">
      <link rel="icon" href="favicon.ico">
      <link rel="stylesheet" href="table_files/css/styles.css">
  </head>

  <body>
      <input id="prefers-color-scheme" type="checkbox">
      <div id="app" class="forced-dark-theme">
      <input id="panelLeftToggle" class="toggleInput" type="checkbox">
      <nav class="navBar">
        <a href="session.jsp">
        <div class="left">VOLVER</div>
        </a>
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
          <div class="content">
              <div class="tableContainer">
                  <div class="table">

                      <div class="thead">

                          <div class="row">
                              <div class="col">Eliminar</div>
                              <div class="col">ID Registro</div>
                              <div class="col">ID Producto</div>
                              <div class="col">Nombre</div>
                              <div class="col">Precio</div>
                              <div class="col">Cantidad</div>
                              <div class="col">Total</div>
                          </div>

                      </div><!--div class="thead"-->

                      <div class="tbody">
                        
                        <%
                          try {
                          
                          
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


                          // Comprobar si hay un usuario almacenado en la sessionStorage
                          // Si no lo hay, redirigir a la página de 'Login' siempre
                          // que intente acceder a esta página
                          if( session.getAttribute("user") == null ) {
                            response.sendRedirect("/Tienda Informatica/index.jsp");
                          }

                          Class.forName("com.mysql.jdbc.Driver");
                          Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/tienda", "phpmyadmin", "1234");

                          Statement s = conexion.createStatement();



                          // Borrar Registro cuando el usuario pulse
                          // una fila perteneciente al Registro que se desea eliminar
                          String deleteGroupID = "";
                          if( request.getParameter("deleteGroupID") != null ) {
                            deleteGroupID = "DELETE FROM registro WHERE id = " + request.getParameter("deleteGroupID");
                            s.execute(deleteGroupID);
                          }


                          // Obtener el número registros para definir la ID del siguiente Registro
                          ResultSet COUNT = s.executeQuery("SELECT COUNT(DISTINCT id) FROM registro ORDER by id");
                          
                          int resultCount = 0;
                          while( COUNT.next() ) {
                            resultCount = COUNT.getInt(1);
                          }


                          // Comando 'INSERT INTO' para almacenar
                          // los productos de la sesión en la Base de Datos
                          String DATOS_COMPRA_SESION =
                            "INSERT INTO registro\n"
                          + "VALUES\n";

                          // Construir la consulta 'INSERT INTO' con los datos de la sesión
                          for( String nombre : Collections.list( session.getAttributeNames() ) ) {
                            if( nombre.equals("user") || nombre.equals("password") ) continue;

                            DATOS_COMPRA_SESION = DATOS_COMPRA_SESION
                            + "("

                            + (resultCount + 1)                             + ", " // ID Registro
                            + ((String[])session.getAttribute(nombre))[0] + ", " // ID Producto
                            + "'" + nombre + "'"                          + ", " // Nombre Producto
                            + ((String[])session.getAttribute(nombre))[1] + ", " // Precio Producto
                            + ((String[])session.getAttribute(nombre))[2]        // Cantidad Producto

                            + ")," + "\n"
                            ;

                          }
                          
                          // Eliminar coma final de la cadena para obtener una sentencia SQL valida
                          DATOS_COMPRA_SESION = DATOS_COMPRA_SESION.substring(0, DATOS_COMPRA_SESION.length() - 2);


                        %>
                          
                        
<script>
// Log del comando 'INSERT INTO'
console.log(`%cComando resultante para la inserción de los datos en la Base de Datos:
%c<%= DATOS_COMPRA_SESION %>
`, "color: #ff0", "")
  
// Log del comando 'DELETE FROM'
console.log(`%cComando resultante para el borrado de los datos en la Base de Datos:
%c<%= deleteGroupID %>
`, "color: #ff0", "")

console.log("%cGRUPO DE REGISTROS: %c<%= resultCount %>", "color: #ff0", "")
  
console.log("%cSession User: "     + "%c<%= session.getAttribute("user") %>", "color: #ff0", "")
console.log("%cSession Password: " + "%c<%= session.getAttribute("password") %>", "color: #ff0", "")
console.log("%cSession Attributes: "+ "%c<%= Collections.list( session.getAttributeNames() ) %>", "color: #ff0", "")
</script>
                        
                        
                        <%
                          // Si hay productos en el carrito se ejecuta el comando SQL
                          if( Collections.list( session.getAttributeNames() ).size() > 2 ) {
                            s.execute( DATOS_COMPRA_SESION );
                          }
                          
                          // Borrar productos almacenados de la sesión
                          for( String nombre : Collections.list( session.getAttributeNames() ) ) {
                            if( nombre.equals("user") || nombre.equals("password") ) continue;
                            
                            // Eliminar datos de la sesión al haber realizado la compra
                            session.removeAttribute(nombre);
                          }
                          
                        %>



                        <%
                          // Mostrar consulta de la Base de Datos
                          ResultSet registroSQL = s.executeQuery ("SELECT * FROM registro");
                          while( registroSQL.next() ) {
                        %>
                        
                          <div class="row">
                              <div class="col">
                                <a href="table.jsp?deleteGroupID=<%= registroSQL.getString("id") %>">
                                  <img class="opt" src="table_files/assets/delete.png">
                                </a>
                              </div>
                              <div class="col"> <%= registroSQL.getString("id") %> </div>
                              <div class="col"> <%= registroSQL.getString("idProducto") %> </div>
                              <div class="col"> <%= registroSQL.getString("nombreProducto") %> </div>
                              <div class="col"> <%= registroSQL.getString("precioProducto") %>€ </div>
                              <div class="col"> <%= registroSQL.getString("cantidadProducto") %> </div>
                              <div class="col"> <%= Integer.parseInt( registroSQL.getString("precioProducto") ) * Integer.parseInt( registroSQL.getString("cantidadProducto") ) %>€ </div>
                          </div>
                        
                        <%
                          }

                          conexion.close();

                        } catch(Exception e) {
                        %>

                          <script>
                            console.error("<%= e %>")
                          </script>

                        <%
                          }
                        %>

                      </div><!--div class="tbody"-->

                  </div><!--div class="table"-->
              </div><!--div class="tableContainer"-->
          </div><!--div class="content"-->
      </div><!--div class="main"-->
      </div>
  </body>

</html>