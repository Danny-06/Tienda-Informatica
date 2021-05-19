/* Se ha comentado el código debido a que se ha encontrado una  alternativa funcional con CSS

// Botón de la izquierda de la barra de navegación con el logo
// let home = document.querySelector('.home').parentElement;

// Contenedor Principal
let main = document.querySelector('.main');

// home.addEventListener("click", sidePanel);

let toggle = 0;




// Si es un usuario de movil,
// ocultar el panel lateral y
// ajustar variable de la palanca

if(navigator.userAgent.includes("Mobile") || window.innerWidth <= 1050) {
  main.setAttribute('style', '--mainContentWidth: 100%;')
  toggle++;
}

function sidePanel() {
  if(toggle == 0) {
    // Aumentar el tamaño del contenedor que contiene el contenido de la página y ocultar el panel lateral
    main.style = '--mainContentWidth: 100%';
    toggle++;
  } else {
    // Disminuir el tamaño del contenedor que contiene el contenido de la página y mostrar el panel lateral
    main.setAttribute('style', '--mainContentWidth:;');
    toggle--;
  }
}

*/
