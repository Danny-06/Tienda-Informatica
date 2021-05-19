<!DOCTYPE html>
<html>

  <head>
    <title>Delete</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="mobile-web-app-capable" content="yes">
    <link rel="icon" href="favicon.ico">
    <link rel="stylesheet" href="delete_files/css/styles.css">
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
                    <label>¿Está seguro de que quiere eliminar este dato?</label>
                </div><!--div class="block _1"-->
                <img class="icon" src="delete_files/assets/carita triste.webp">
                <div class="block _2">
                  <input class="delete" type="submit" value="Eliminar"></input>
                  <input class="cancel" type="submit" value="Cancelar"></input>
                </div><!--div class="block _1"-->
            </div><!--div class="box"-->
        </div><!--div class="main"-->
  </body>

</html>