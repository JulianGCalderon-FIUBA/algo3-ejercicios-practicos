!classDefinition: #HabitatDeAvispas category: 'AvispasYAbejas'!
DenotativeObject subclass: #HabitatDeAvispas
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejas'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'HabitatDeAvispas class' category: 'AvispasYAbejas'!
HabitatDeAvispas class
	instanceVariableNames: 'cantidadDeHuevosDeAvispas cantidadDeOrugas cantidadDePolillas cantidadDeHuevosDeAvispasConLaFirmaGeneticaDeOrianaYOrnella cantidadDeHuevosDeAvispasConLaFirmaGeneticaDePolly'!

!HabitatDeAvispas class methodsFor: 'informacion' stamp: 'JGC 4/22/2022 12:44:56'!
cantidadDeHuevosConLaFirmaGeneticaDeOriana
	^cantidadDeHuevosDeAvispasConLaFirmaGeneticaDeOrianaYOrnella.
	! !

!HabitatDeAvispas class methodsFor: 'informacion' stamp: 'JGC 4/22/2022 00:51:30'!
cantidadDeHuevosConLaFirmaGeneticaDeOrnella
	^self cantidadDeHuevosConLaFirmaGeneticaDeOriana.
	! !

!HabitatDeAvispas class methodsFor: 'informacion' stamp: 'JGC 4/22/2022 12:30:34'!
cantidadDeHuevosConLaFirmaGeneticaDePolly
	^cantidadDeHuevosDeAvispasConLaFirmaGeneticaDePolly.! !

!HabitatDeAvispas class methodsFor: 'informacion' stamp: 'JGC 4/22/2022 12:30:41'!
cantidadDeHuevosDeAvispas
	^cantidadDeHuevosDeAvispas.! !

!HabitatDeAvispas class methodsFor: 'informacion' stamp: 'JGC 4/22/2022 12:29:59'!
cantidadDeOrugas
	^cantidadDeOrugas.! !

!HabitatDeAvispas class methodsFor: 'informacion' stamp: 'JGC 4/22/2022 12:29:56'!
cantidadDePolillas
	^cantidadDePolillas.! !

!HabitatDeAvispas class methodsFor: 'informacion' stamp: 'JGC 4/22/2022 13:05:02'!
hayOrugas
	^cantidadDeOrugas > 0.! !

!HabitatDeAvispas class methodsFor: 'informacion' stamp: 'JGC 4/22/2022 13:05:13'!
hayPolillas
	^cantidadDePolillas > 0.! !


!HabitatDeAvispas class methodsFor: 'modificacion' stamp: 'JGC 4/22/2022 13:03:23'!
agregarHuevoDeAvispa
	cantidadDeHuevosDeAvispas  := cantidadDeHuevosDeAvispas  + 1.! !

!HabitatDeAvispas class methodsFor: 'modificacion' stamp: 'JGC 4/22/2022 13:03:23'!
agregarHuevoDeOriana
	self agregarHuevoDeAvispa.
		
	cantidadDeHuevosDeAvispasConLaFirmaGeneticaDeOrianaYOrnella  := cantidadDeHuevosDeAvispasConLaFirmaGeneticaDeOrianaYOrnella  + 1.! !

!HabitatDeAvispas class methodsFor: 'modificacion' stamp: 'JGC 4/22/2022 00:51:01'!
agregarHuevoDeOrnella
	self agregarHuevoDeOriana.! !

!HabitatDeAvispas class methodsFor: 'modificacion' stamp: 'JGC 4/22/2022 13:03:23'!
agregarHuevoDePolly
	self agregarHuevoDeAvispa.
		
	cantidadDeHuevosDeAvispasConLaFirmaGeneticaDePolly  := cantidadDeHuevosDeAvispasConLaFirmaGeneticaDePolly  + 1.! !

!HabitatDeAvispas class methodsFor: 'modificacion' stamp: 'JGC 4/22/2022 12:29:20'!
agregarOrugas: cantidadDeOrugasAAgregar 
	cantidadDeOrugas := cantidadDeOrugas  + cantidadDeOrugasAAgregar.! !

!HabitatDeAvispas class methodsFor: 'modificacion' stamp: 'JGC 4/22/2022 12:29:26'!
agregarPolillas: cantidadDePolillasAAgregar 
	cantidadDePolillas := cantidadDePolillas  + cantidadDePolillasAAgregar.! !

!HabitatDeAvispas class methodsFor: 'modificacion' stamp: 'JGC 4/22/2022 13:04:08'!
eliminarUnaOruga
	cantidadDeOrugas := cantidadDeOrugas - 1.! !

!HabitatDeAvispas class methodsFor: 'modificacion' stamp: 'JGC 4/22/2022 13:04:20'!
eliminarUnaPolilla
	cantidadDePolillas := cantidadDePolillas - 1.! !

!HabitatDeAvispas class methodsFor: 'modificacion' stamp: 'JGC 4/22/2022 12:49:05'!
restablecerHabitat
	cantidadDeHuevosDeAvispas := 0.
	cantidadDeHuevosDeAvispasConLaFirmaGeneticaDeOrianaYOrnella := 0.
	cantidadDeHuevosDeAvispasConLaFirmaGeneticaDePolly := 0.
	
	cantidadDeOrugas  := 0.
	cantidadDePolillas  := 0.! !


!HabitatDeAvispas class methodsFor: '--** private fileout/in **--' stamp: 'JGC 4/22/2022 13:28:10'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	cantidadDeHuevosDeAvispas := 0.
	cantidadDeOrugas := 0.
	cantidadDePolillas := 0.
	cantidadDeHuevosDeAvispasConLaFirmaGeneticaDeOrianaYOrnella := 0.
	cantidadDeHuevosDeAvispasConLaFirmaGeneticaDePolly := 0.! !


!classDefinition: #OriLaAvi category: 'AvispasYAbejas'!
DenotativeObject subclass: #OriLaAvi
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejas'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OriLaAvi class' category: 'AvispasYAbejas'!
OriLaAvi class
	instanceVariableNames: ''!

!OriLaAvi class methodsFor: 'comportamiento interno' stamp: 'JGC 4/22/2022 13:04:08'!
alimentarse
	HabitatDeAvispas eliminarUnaOruga.! !

!OriLaAvi class methodsFor: 'comportamiento interno' stamp: 'JGC 4/22/2022 13:05:03'!
hayAlimento
	^HabitatDeAvispas hayOrugas.! !

!OriLaAvi class methodsFor: 'comportamiento interno' stamp: 'JGC 4/22/2022 12:56:46'!
ponerHuevo
	HabitatDeAvispas agregarHuevoDeOriana.! !


!OriLaAvi class methodsFor: 'comportamiento general' stamp: 'JGC 4/22/2022 12:54:53'!
intentarReproducirse
	self hayAlimento ifTrue:
	[
		self alimentarse.
		self ponerHuevo.
	]

	! !


!classDefinition: #OrneLaAvi category: 'AvispasYAbejas'!
OriLaAvi subclass: #OrneLaAvi
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejas'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OrneLaAvi class' category: 'AvispasYAbejas'!
OrneLaAvi class
	instanceVariableNames: ''!

!OrneLaAvi class methodsFor: 'comportamiento interno' stamp: 'JGC 4/22/2022 12:58:38'!
ponerHuevo
	HabitatDeAvispas  agregarHuevoDeOrnella.! !


!classDefinition: #PollyLaAvi category: 'AvispasYAbejas'!
OriLaAvi subclass: #PollyLaAvi
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejas'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PollyLaAvi class' category: 'AvispasYAbejas'!
PollyLaAvi class
	instanceVariableNames: ''!

!PollyLaAvi class methodsFor: 'comportamiento interno' stamp: 'JGC 4/22/2022 13:04:20'!
alimentarse
	HabitatDeAvispas eliminarUnaPolilla.! !

!PollyLaAvi class methodsFor: 'comportamiento interno' stamp: 'JGC 4/22/2022 13:05:13'!
hayAlimento
	^HabitatDeAvispas hayPolillas.! !

!PollyLaAvi class methodsFor: 'comportamiento interno' stamp: 'JGC 4/22/2022 12:59:39'!
ponerHuevo
	HabitatDeAvispas agregarHuevoDePolly.! !


!classDefinition: #PruebasReproduccionDeAvispas category: 'AvispasYAbejas'!
DenotativeObject subclass: #PruebasReproduccionDeAvispas
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejas'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PruebasReproduccionDeAvispas class' category: 'AvispasYAbejas'!
PruebasReproduccionDeAvispas class
	instanceVariableNames: ''!

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'JGC 4/22/2022 12:41:02'!
test01EnElInicioDeLosTiemposNoHayHuevos	
	self retrocederElHabitatAlInicioDeLosTiempos.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'JMB 4/21/2022 12:12:44'!
test02CuandoOrianaLaAvispaSeReproducePorPrimeraVezDejaUnHuevo
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'JMB 4/21/2022 12:12:11'!
test03CadaVezQueOrianaSeReproduceDejaUnHuevoMas
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	self laAvispaOriana intentarReproducirse.
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 2.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'JMB 4/21/2022 12:12:53'!
test04ParaDejarUnHuevoOrianaLaAvispaReduceLaPoblacionDeUnaOrugaANinguna
	self retrocederElHabitatAlInicioDeLosTiempos.
	self queElHabitatTengaUnaOrugaMas.
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self habitat cantidadDeOrugas isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'JMB 4/21/2022 12:13:43'!
test05ParaDejarUnHuevoOrianaLaAvispaDecrementaEnUnoLaPoblacionDeOrugasDelHabitat
	self retrocederElHabitatAlInicioDeLosTiempos.
	self queElHabitatTengaDosOrugasMas.
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self habitat cantidadDeOrugas isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'JMB 4/21/2022 12:13:22'!
test06CuandoNoHayOrugasOrianaLaAvispaNoPuedeDejarHuevos
	self retrocederElHabitatAlInicioDeLosTiempos.
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 0.! !


!PruebasReproduccionDeAvispas class methodsFor: 'tests - Ornella' stamp: 'JMB 4/21/2022 12:14:24'!
test07CuandoOrnellaLaAvispaSeReproduceDejaUnHuevo
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaOrnella intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Ornella' stamp: 'JMB 4/21/2022 12:14:18'!
test08ParaDejarUnHuevoOrnellaLaAvispaReduceLaPoblacionDeUnaOrugaANinguna
	self retrocederElHabitatAlInicioDeLosTiempos.
	self queElHabitatTengaUnaOrugaMas.
	
	self laAvispaOrnella intentarReproducirse.
	
	Assert that: self habitat cantidadDeOrugas isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Ornella' stamp: 'JMB 4/21/2022 12:14:11'!
test09CuandoNoHayOrugasOrnellaLaAvispaNoPuedeDejarHuevos
	self retrocederElHabitatAlInicioDeLosTiempos.
	
	self laAvispaOrnella intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 0.! !


!PruebasReproduccionDeAvispas class methodsFor: 'tests - Polly' stamp: 'JMB 4/21/2022 12:14:46'!
test10CuandoPollyLaAvispaSeReproduceDejaUnHuevo
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaPolly intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Polly' stamp: 'JMB 4/21/2022 12:14:40'!
test11ParaDejarUnHuevoPollyLaAvispaReduceLaPoblacionDeUnaPolillaANinguna
	self retrocederElHabitatAlInicioDeLosTiempos.
	self queElHabitatTengaUnaPolillaMas.
	
	self laAvispaPolly intentarReproducirse.
	
	Assert that: self habitat cantidadDePolillas isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Polly' stamp: 'JMB 4/21/2022 12:14:36'!
test12ParaDejarUnHuevoPollyLaAvispaDecrementaEnUnoLaPoblacionDePolillasDelHabitat
	self retrocederElHabitatAlInicioDeLosTiempos.
	self queElHabitatTengaDosPolillasMas.
	
	self laAvispaPolly intentarReproducirse.
	
	Assert that: self habitat cantidadDePolillas isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Polly' stamp: 'JMB 4/21/2022 12:14:30'!
test13CuandoNoHayPolillasPollyLaAvispaNoPuedeDejarHuevos
	self retrocederElHabitatAlInicioDeLosTiempos.
	
	self laAvispaPolly intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 0.! !


!PruebasReproduccionDeAvispas class methodsFor: 'tests - firma genetica' stamp: 'JGC 4/22/2022 00:51:18'!
test14CuandoOrianaLaAvispaSeReproduceDejaUnHuevoConSuFirmaGenetica
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeOriana isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - firma genetica' stamp: 'JGC 4/22/2022 00:51:18'!
test15CuandoOrianaLaAvispaAunNoSeReprodujoNoTieneHuevosConSuFirmaGenetica
	self retrocederElHabitatAlInicioDeLosTiempos. 
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeOriana isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - firma genetica' stamp: 'JGC 4/22/2022 00:51:18'!
test16CuandoPollyLaAvispaSeReproduceDejaUnHuevoConSuFirmaGenetica
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaPolly intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDePolly isEqualTo: 1.
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeOriana isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - firma genetica' stamp: 'JGC 4/22/2022 00:51:18'!
test17CuandoOrnellaLaAvispaSeReproduceDejaUnHuevoConLaMismaFirmaGeneticaQueOriana
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaOrnella intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeOrnella isEqualTo: 1.
	Assert 
		that: self cantidadDeHuevosConLaFirmaGeneticaDeOrnella  
		isEqualTo: self cantidadDeHuevosConLaFirmaGeneticaDeOriana! !


!PruebasReproduccionDeAvispas class methodsFor: 'tests - Lara la ladrona' stamp: 'JMB 4/21/2022 12:15:27'!
test18CuandoLaraLaAvispaSeReproduceDejaUnHuevoConSuFirmaGenetica
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	self laAvispaOrnella intentarReproducirse.
	
	self laAvispaLara intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeLara isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Lara la ladrona' stamp: 'JGC 4/22/2022 00:51:18'!
test19CuandoLaraLaAvispaSeReproduceLeSacaElHuevoAOtraAvispa
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	self laAvispaOriana intentarReproducirse.
	
	self laAvispaLara intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeOriana isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Lara la ladrona' stamp: 'JMB 4/21/2022 12:15:18'!
test20CuandoLaraLaAvispaSeReproduceLeSacaElHuevoAPolly
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	self laAvispaPolly intentarReproducirse.
	
	self laAvispaLara intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDePolly isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Lara la ladrona' stamp: 'JMB 4/21/2022 12:15:12'!
test21CuandoLaraLaAvispaNoTieneRecursosNoDejaUnHuevo
	self retrocederElHabitatAlInicioDeLosTiempos. 
		
	self laAvispaLara intentarReproducirse.
		
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeLara isEqualTo: 0.! !


!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'JMB 4/19/2022 19:14:52'!
cantidadDeHuevosConLaFirmaGeneticaDeLara
	Assert isTrue: false description: 'Reemplazar esto por la implementaci?n correspondiente'.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'JGC 4/22/2022 00:51:18'!
cantidadDeHuevosConLaFirmaGeneticaDeOriana
	^self habitat cantidadDeHuevosConLaFirmaGeneticaDeOriana.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'JGC 4/22/2022 00:52:00'!
cantidadDeHuevosConLaFirmaGeneticaDeOrnella
	^self habitat cantidadDeHuevosConLaFirmaGeneticaDeOrnella.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'JGC 4/22/2022 00:42:19'!
cantidadDeHuevosConLaFirmaGeneticaDePolly
	^self habitat cantidadDeHuevosConLaFirmaGeneticaDePolly.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'JGC 4/22/2022 12:34:29'!
habitat
	^HabitatDeAvispas.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'JGC 4/22/2022 00:19:42'!
hacerQueElHabitatTengaLosRecursosSuficientes
	self habitat agregarOrugas: 2.
	self habitat agregarPolillas: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'JMB 4/19/2022 19:14:28'!
laAvispaLara
	Assert isTrue: false description: 'Reemplazar esto por la implementaci?n correspondiente'.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'JGC 4/22/2022 12:34:37'!
laAvispaOriana
	^OriLaAvi.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'JGC 4/22/2022 00:14:56'!
laAvispaOrnella
	^OrneLaAvi.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'JGC 4/22/2022 00:16:29'!
laAvispaPolly
	^PollyLaAvi.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'JGC 4/22/2022 00:01:24'!
queElHabitatTengaDosOrugasMas
	self habitat agregarOrugas:  2.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'JGC 4/22/2022 00:21:03'!
queElHabitatTengaDosPolillasMas
	self habitat agregarPolillas: 2.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'JGC 4/21/2022 23:52:45'!
queElHabitatTengaUnaOrugaMas
	self habitat agregarOrugas: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'JGC 4/22/2022 00:20:42'!
queElHabitatTengaUnaPolillaMas
	self habitat agregarPolillas: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'JGC 4/21/2022 23:47:39'!
retrocederElHabitatAlInicioDeLosTiempos
	self habitat restablecerHabitat.! !

HabitatDeAvispas initializeAfterFileIn!