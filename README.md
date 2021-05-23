# Tienda Informática
CRUD para la asignatura de programación hecha con JSP


En está aplicación podrás ir seleccionando productos a tu gusto de los listados,
<br>mientras se van agregando al carrito.
<br>Una vez hayas decidido lo que quieres, le das al botón para terminar la compra
<br>y todos los productos que hayas comprado se guardarán en un registro al cual se
<br>te redireccionará y donde podrás consultar y eliminar los registros anteriores.

<br>
1. Página de Login y única página accesible mientras no se inicie la sesión.
<br><br>
<img src="Capturas/login.png">
<br>

Para iniciar sesión se hace usando el único usuario que se proporciona:
<br><strong>Usuario:</strong>    root
<br><strong>Contraseña:</strong> root
<br><br>
<img src="Capturas/login root.png">
<br>

2. Cuando iniciemos sesión acabaremos en la página principal,
<br>Y si intentamos volver a la página de Login, se nos redirigirá de nuevo aquí.
<br>A la izquierda tenemos el panel lateral donde podremos ver los productos que tenemos
<br>en el carrito, ahora mismo no hay nada y esa información nos la indica con un mensaje,
<br>además tambien se nos permite acceder a los registros de las compras ya realizadas anteriormente.
<img src="Capturas/session sin carrito.png">
<br>

3. Si hacemos click en alguno de los productos anteriores acabaremos en esta página donde podremos
<br>seleccionar la cantidad deseada del producto desde 1 hasta 99.
<br>Si le damos a enviar, volveremos a la página principal y el producto se nos guardará en el carrito.
<img src="Capturas/agregaProducto.png">
<br>

4. Si queremos eliminar un producto del carrito tan solo tenemos que darle al botón con la "X" asociado al mismo.
<br>Una vez tenemos los productos que deseamos en el carrito, le damos a "TERMINAR COMPRA".
<img src="Capturas/session con carrito.png">
<br>

5. Y por último acabaremos aquí, en el registro, donde podremos ver
<br>las compras hechas anteriormente y la que acabamos de hacer.
<br>Desde aquí tambien podemos borrar los registros que ya no queramos
<br>tener almacenados.
<br>
<br><strong>Eliminando la fila de un registro se eliminará el registro entero asociado a esa fila.</strong>
<br><br>
<img src="Capturas/table.png">
