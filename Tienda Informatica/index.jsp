
<%@page import="java.util.HashMap"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

  <head>
    <title>Login</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
    <link rel="icon" href="favicon.ico">
    <link rel="stylesheet" href="index_files/css/styles.css">
  </head>

  <body>
    

    <%

      try {
      
      // Sólo se almacenará una cuenta
      HashMap cuentas = new HashMap<String, String>();

      cuentas.put("root", "root"); // Cuenta que sirve para loguearse en la aplicación
      
      
      // Array que contiene los parametros que se envían a través del formulario
      String[] params = {
        request.getParameter("user"),
        request.getParameter("password")
      };

      boolean PARAMS_NOT_NULL = true;

      // Comprobar si alguno de los parámetros es nulo
      for(String param : params) {
        if(param == null) {
          PARAMS_NOT_NULL = false;
          break;
        }
      }

      String user = params[0];
      String password = params[1];

      // Si no hay parámetros nulos
      if(PARAMS_NOT_NULL) {

        // Si los datos introducidos en el formulario coinciden
        // con los almacenados, se crean las variables de sesión
        if( cuentas.containsKey( user ) ) {
        if( cuentas.get( user ).equals( password ) ) {
          session.setAttribute("user", user);
          session.setAttribute("password", password);
        }
        }

      } // if(PARAMS_NOT_NULL)
      
    %>
      

    <%

      // Reseteo del usuario que tiene la sesión guardada en el sessionStorage
      // mediante envio de un parametro de URL para facilitar el debug
      if( request.getParameter("reset") != null ) {
      if( request.getParameter("reset").equals("true") ) {
        session.setAttribute("user", null);
        session.setAttribute("password", null);
      }
      }


      // Comprobar si hay un usuario almacenado en la sessionStorage
      // Si lo está, se le redirige a 'session.jsp' siempre que se
      // intente acceder a la página de 'Login'
      if( session.getAttribute("user") != null ) {
        response.sendRedirect("CRUD/session.jsp");
      }

    %>
    
     
    <script>
      console.log("%cSession User: "     + "%c<%= session.getAttribute("user") %>", "color: #ff0", "")
      console.log("%cSession Password: " + "%c<%= session.getAttribute("password") %>", "color: #ff0", "")
    </script>
    
    <script>
      const paramUser =     "<%= user %>"
      const paramPassword = "<%= password %>"
      console.log( {paramUser, paramPassword} )
    </script>
    
    
    <%
      } catch(Exception e) {
    %>
    
    <script>
      console.error("<%= e %>")
    </script>
    
    <%
      }
    %>

    <div class="myContainer">
      <img class="welcome" src="index_files/assets/welcome.png">
      <form class="form" action="">
        <div class="block">
          <!--label>Usuario</label-->
          <input name="user" class="user" type="text" required autofocus placeholder="Nombre de Usuario">
          <!--label>Contraseña</label-->
          <input name="password" class="password" type="password" required placeholder="Contraseña" no-pattern="^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$">
        </div>
        <input class="submit" type="submit">
      </form>
    </div>
  </body>

</html>