<%-- 
    Document   : session
    Created on : 17 may. 2021, 13:43:10
    Author     : danie
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

  <head>
      <title>Input</title>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <link rel="icon" href="favicon.ico">
      <link rel="stylesheet" href="input_files/css/styles.css">
      <script defer src="input_files/js/scripts.js"></script>
      <style>
      ::-webkit-scrollbar {
          width: 12px;
          height: 10px;
          background: #33202f;
          box-shadow: inset #614649 0 0 5px 0px;
          border-radius: 10px;
      }

      ::-webkit-scrollbar-thumb {
          background: #a87daa;
          border: solid #574358 1px;
          border-radius: 10px;
      }

      ::-webkit-scrollbar-thumb:hover {
          background: #754a77;
          border: solid #574358 1px;
          border-radius: 10px;
      }

      ::-webkit-scrollbar-thumb:active {
          background: #643966;
          border: solid #685469 1px;
          border-radius: 10px;
          box-shadow: inset #000 0 0 5px 0;
      }

      ::-webkit-scrollbar-corner {
          background: #643966;
      }
      </style>
  </head>

  <body>
      <div class="main">
          <div class="box">
              <div class="block _1">
                  <label>ID</label>
                  <input type="text" value="" autofocus></input>
                  <label>Nombre</label>
                  <input type="text" value=""></input>
              </div><!--div class="block _1"-->
              <div class="block _2">
                  <label>Tipo</label>
                  <input type="text" value=""></input>
                  <label>Cantidad</label>
                  <input type="number" value="0"></input>
                  <label>Precio</label>
                  <input type="number" value="0"></input>
              </div><!--div class="block _2"-->
              <input type="submit" value="Aceptar"></input>
          </div><!--div class="box"-->
      </div><!--div class="main"-->
  </body>

</html>