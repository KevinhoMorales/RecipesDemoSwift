# RecipesDemoSwift

La aplicación está desarrollada con Swift en Xcode. Se usó la web [https://www.mockable.io/](https://www.mockable.io/) para poder crear la API que contendrá las recetas.

### Solución de arquitectura
- Se implementó **MVVM** orientado a protocolos en el que la **VIEW** como **VIEWMODEL** tiene su propio protocolo.
- Toda la lógica de negocio se realizó en el **VIEWMODEL** y la renderizacion de los componentes en la VIEW
### Buenas prácticas
- Se uso una organización del proyecto adecuada y la cual contiene carpetas por módulos. Creando cada módulo con una simple responsabilidad.
- Las **VIEW** se realizaron con XIBs por su excelencia en desacople.
### Patrones de proyecto
- Uno de los patrones implementados fue el patrón **COORDINATOR** para la navegación de pantallas entre la aplicación
### Pruebas automatizadas
- Se realizó pruebas automatizadas con XCTest en el cual se pudo probar el servicio creado y un título de una vista
### Novedades de la plataforma
- Esta aplicación tiene un diseño minimalista y se agregó la sección “Recetas populares para ti” la cual está implementada con un ** COLLECTIONVIEW **
### Librerías externas
- Se implemento las librerías con Swift Package Manager y la única que se usó de terceros es [https://github.com/onevcat/Kingfisher](Kindfisher)
