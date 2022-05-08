# Números

## Aporte de los mensajes de DD

Un double dispatch se usa cuando se tienen dos objetos polimórficos interactuando entre sí. El primer llamado aportará la lógica condicional de lo relacionado al primer objeto, mientras que el segundo hará lo mismo para el segundo objeto. Por ejemplo, en el caso de la suma de dos números de distinta clase el primer llamado aporta la lógica del primer sumando y el segundo llamado la lógica del segundo término (segundo sumando). No es lo mismo sumar dos enteros, que un entero con una fracción o una fracción con un entero; en los tres casos se aplica un llamado distinto que responderá a la lógica de cada objeto.

## Lógica de instanciado

Lo mejor es que la lógica pertenezca a la clase más abstracta que sepa responder lo mismo que la instancia que se quiere crear, y que ella se ocupe de declarar a qué subclase pertenece el objeto instanciado. Por ejemplo, la clase más abstracta es número pero las lógicas de instanciado se encuentran en Entero y Fraccion pues ambas clases definen un set de mensajes y colaboradores propios. 

Si el objeto se creara en distintos lugares lo mejor sería unificarlo pues cada vez que se modifique algo de la clase (como agregar una subclase) sería necesario aplicar los cambios en todos lados y eso puede prestarse a errores.
    
## Nombres de las categorías de métodos

Si el método ya está declarado en la superclase, debe permanecer en una categoría con el mismo nombre pues son polimórficos. Por otro lado, si los métodos tienen la misma utilidad, por ejemplo para testear, se los agrupa teniendo eso en cuenta. Luego, si hay métodos "auxiliares" que aportan a otros se los agrupa en private para indicar que no deben ser utilizados por fuera de la instancia.
    
## Subclass responsibility

Este método sirve para indicar que puede haber diferencias en la resolución de la operación que realiza el mensaje, por lo que en vez de usar if's la superclase le delega la responsabilidad a cada clase de operar como le sea necesario. 
    
## No rompas

Romper encapsulamiento implica que si se quieren realizar cambios en la funcionalidad de aquello que se quiere modelar será necesario buscar todos los lugares donde aparece lo modelado y modificarlo. Esto genera errores y confusiones, por lo que lo mejor es siempre mantener lo que tiene la misma funcionalidad agrupado, y si se sigue una lógica para resolver los problemas mantenerla.
