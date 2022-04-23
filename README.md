# Algo3EjerciciosPracticos

Preguntas teóricas Ejercicio 1

## Sobre implementar funcionalidad
Al comienzo decidimos ir pasando las pruebas de a una; primero la 01, luego la 02 y por último la 03. De esta forma, nos quedaron mensajes incompletos pero que cumplían lo pedido por las pruebas. A medida que fuimos avanzando nos surgió la necesidad de resolver los problemas de antemano e ir completando mensajes. Por lo tanto, cuando implementamos a la última avispa (Lara), todas las pruebas pasaron de una. 

Opinamos que es una buena forma de encarar un problema difícil o complejo, pero que una vez que la solución se presenta más clara conviene pensarla de antemano pues ir programando prueba a prueba puede tornarse lento.

## Sobre código repetido
No encontramos código repetido. En el caso de los mensajes cantidadDeHuevosConLaFirmaGeneticaDeX el código es similar pero es necesario que sean distintos pues cada uno retorna un valor distinto dentro del diccionario que contiene las cantidades de huevos. 

En cuanto a la responsabilidad de dejar un huevo o consumir un insecto, tomamos la decisión de que sea la avispa la encargada de verificar si hay alimento y de poner un huevo. Consideramos que esto genera un modelo con una representación fiel de la realidad, ya que en ésta el hábitat puede contener la información, pero recae en la avispa buscar orugas, armarse el nido y luego poner un huevo. En el caso de Lara, ella no tiene forma de conocer la firma genética de cada huevo, por lo que solo roba el primer nido disponible y es el hábitat el que tiene que verificar de quién era el huevo.

## Sobre código repetido 2
Luego de la clase del Jueves, notamos que las avispas tenían un comportamiento similar, por lo que tomamos la decisión de tomar la primera avispa creada como prototipo, y agregar o modificar los mensajes en los casos donde era necesario, por ejemplo en el caso de Polly que come polillas en vez de orugas. 

A la hora de guardar los huevos primero habíamos creado distintos colaboradores que representaban las cantidades de huevos con la firma de cada avispa, pero esto generó mucho código repetido. Para resolverlo, utilizamos un diccionario donde cada clave era la avispa y tenía como valor asignado la cantidad de huevos que había puesto. De esta forma, pudimos unificar 4 mensajes (uno por cada avispa) en el mensaje agregarUnHuevoDeAvispa, que recibe como colaborador a la avispa que puso el huevo, y lo mismo con las demás funcionalidades donde había repeticiones.

A partir del uso de estas estructuras logramos simplificar el código y generar que los métodos sean más intuitivos. Sin embargo, también se podrían haber cumplido las funcionalidades sin ellas. 
