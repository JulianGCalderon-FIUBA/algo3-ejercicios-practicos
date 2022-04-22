# Algo3EjerciciosPracticos

holaa :)

hola \\\o.o//

nos leeran?

----
Preguntas teóricas Ejercicio 1

Los diccionarios no nos simplificaron el trabajo, lo único que aportaron fue tener un solo colaborador en vez de 3.(firmas genéticas)

## Sobre implementar funcionalidad
Al comienzo decidimos ir pasando las pruebas de a una; primero la 01, luego la 02 y por último la 03. De esta forma, nos quedaron mensajes incompletos pero que cumplían lo pedido por las pruebas. A medida que fuimos avanzando con el proyecto nos surgió la necesidad de resolver los problemas de antemano e ir completando mensajes, por lo que refactorizamos el proyecto. Por lo tanto, cuando implementamos a la última avispa (Lara), todas las pruebas pasaron de una. 

Opinamos que es una buena forma de encarar un problema difícil o complejo, pero que una vez que la solución se presenta más clara conviene pensarla de antemano pues ir programando prueba a prueba puede tornarse lento.

## Sobre código repetido
Nos quedó código repetido ya que tenemos mensajes que realizan lo mismo para cada avispa, por ejemplo agregarUnHuevoDeX. Una forma de evitar esto, y lo que nos faltó representar, es pensar a cada huevo como un objeto separado en vez de como un número. De esta forma, cada huevo sabría quién es su padre (la avispa que lo puso) y solo haría falta un agregarUnHuevo general. Además, se simplifica la parte de la firma genética. 
Sobre la responsabilidad de dejar un huevo o consumir un insecto, en nuestro modelo es cada avispa la encargada de verificar si hay alimento, y de poner un huevo. Nos pareció la representación más fiel de la realidad, ya que el habitat puede "decir" cuántas orugas hay, por ejemplo, pero es cada avispa la que debe buscarlas, y lo mismo sucede a la hora de poner huevos. En el caso de Lara, ella no tiene forma de conocer la firma genética de cada huevo, por lo que solo come/elimina uno y es el hábitat el que tiene que verificar de quién era el huevo.

## Sobre código repetido 2
A partir de lo visto en la clase del jueves, decidimos implementar la estructura de prototipos para las avispas. A partir de la primera avispa, decidimos que las otras sean hijas para que puedan heredar su mensaje, ya que habíamos notado que todas realizaban acciones similares. Luego, en las particularidades, como en el caso de Polly, definimos mensajes específicos para ella. 
A la hora de guardar los huevos, nos pareció que lo mejor era usar distintos colaboradores para contar cada tipo de huevo. Probamos utilizar un diccionario pero encontramos que se dificultaba la lectura del código y se prestaba a confusión. Si bien nos hubiera permitido evitar código repetido en el caso de agregarUnHuevoDeX (cada clave del diccionario representaría la avispa que puso el huevo, por lo que el mensaje recibiría como colaborador qué avispa puso el huevo), hubiera generado confusiones en el caso de Oriana y Ornella ya que al tenerlas por separado 
