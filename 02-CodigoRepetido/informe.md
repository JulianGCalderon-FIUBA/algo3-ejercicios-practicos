# Código repetido

## Abstracción de los tests 01 y 02

  En el test 01 se calcula cuántos milisegundos se tardan al agregar a una persona al CustomerBook, y en el test 02 se calculan cuántos milisegundos se tardan al eliminar a alguien del CustomerBook. Lo que hicimos fue abstraer esto en un mensaje nuevo que mide cuántos milisegundos tarda una cierta acción. Esto se puede pensar como un cronómetro; se podría haber planteado como una clase o un objeto aparte que implementa este mensaje, pero no lo hicimos pues nos pareció adelantarnos a un problema que aún no existe.

## Cómo representar en Smalltalk

  Para representar entes de la realidad en Smalltalk podemos utilizar clases, objetos y mensajes. En el caso de las clases, nos permiten aplicar el concepto de polimorfismo y jerarquías que viene del paradigma clásico, donde se crea una clase general y luego instancias particulares de ella; mientras que los objetos representan mejor el paradigma moderno, que hace uso de los parentescos y herencias. Los mensajes permiten representar con mayor precisión ciertos entes ya que podemos definir clases y objetos a partir de aquello que saben responder.

## Teoría de Naur

  La teoría expuesta en el paper de Naur sostiene que un buen método a la hora de programar es crear una teoría y construir a partir de ella. En el caso de quitar código repetido abstrayéndonos estamos realizando algo similar, ya que al generalizar ciertos mensajes se crea una base que define mejor el dominio de la realidad que estamos modelando. 
  
  Un ejemplo se puede observar en los tests 03, 04, 07 y 08. Los cuatro realizaban acciones con una estructura similar: __[acción] on: error do: [acción]__. Si bien al modularizarlo casi no quitamos código repetido, nos permitió respetar mejor la semántica de aquello que queríamos representar y crear. Logramos que la estructura que se veía similar pero ejecutaba cosas distintas se vea más unificada y así quede más claro qué se testeaba. 
