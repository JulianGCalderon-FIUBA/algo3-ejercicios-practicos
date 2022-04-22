!classDefinition: #HabitatDeAvispas category: 'AvispasYAbejasParte2'!
DenotativeObject subclass: #HabitatDeAvispas
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'HabitatDeAvispas class' category: 'AvispasYAbejasParte2'!
HabitatDeAvispas class
	instanceVariableNames: 'cantidadDeHuevosConLaFirmaGeneticaDePolly cantidadDePolillas cantidadDeHuevosDeAvispas cantidadDeOrugas cantidadDeHuevosConLaFirmaGeneticaDeOrianaYOrnella'!

!HabitatDeAvispas class methodsFor: 'información' stamp: 'MS 4/21/2022 20:53:48'!
cantidadDeHuevosConLaFirmaGeneticaDeOrianaYOrnella
	^cantidadDeHuevosConLaFirmaGeneticaDeOrianaYOrnella.! !

!HabitatDeAvispas class methodsFor: 'información' stamp: 'MS 4/21/2022 20:31:04'!
cantidadDeHuevosConLaFirmaGeneticaDePolly
	^cantidadDeHuevosConLaFirmaGeneticaDePolly .! !

!HabitatDeAvispas class methodsFor: 'información' stamp: 'MS 4/21/2022 19:38:24'!
cantidadDeHuevosDeAvispas
	^cantidadDeHuevosDeAvispas .! !

!HabitatDeAvispas class methodsFor: 'información' stamp: 'MS 4/21/2022 19:51:42'!
cantidadDeOrugas
	^cantidadDeOrugas.! !

!HabitatDeAvispas class methodsFor: 'información' stamp: 'MS 4/21/2022 20:13:39'!
cantidadDePolillas
	^cantidadDePolillas.! !

!HabitatDeAvispas class methodsFor: 'información' stamp: 'MS 4/21/2022 20:04:29'!
hayOrugas
	^cantidadDeOrugas > 0.! !

!HabitatDeAvispas class methodsFor: 'información' stamp: 'MS 4/21/2022 20:16:45'!
hayPolillas
	^cantidadDePolillas > 0.! !


!HabitatDeAvispas class methodsFor: 'modificaciones' stamp: 'MS 4/21/2022 20:05:11'!
agregarOrugas: cantidadDeOrugasAAgregar
	cantidadDeOrugas := cantidadDeOrugas + cantidadDeOrugasAAgregar.! !

!HabitatDeAvispas class methodsFor: 'modificaciones' stamp: 'MS 4/21/2022 20:12:59'!
agregarPolillas: cantidadDePolillasAAgregar 
	cantidadDePolillas := cantidadDePolillas + cantidadDePolillasAAgregar. ! !

!HabitatDeAvispas class methodsFor: 'modificaciones' stamp: 'MS 4/22/2022 00:07:39'!
agregarUnHuevoDeOriYOrne
	cantidadDeHuevosConLaFirmaGeneticaDeOrianaYOrnella := cantidadDeHuevosConLaFirmaGeneticaDeOrianaYOrnella +1.
	cantidadDeOrugas := cantidadDeOrugas -1.
	cantidadDeHuevosDeAvispas := cantidadDeHuevosDeAvispas +1.! !

!HabitatDeAvispas class methodsFor: 'modificaciones' stamp: 'MS 4/22/2022 00:09:22'!
agregarUnHuevoDePolly
	
	cantidadDeHuevosConLaFirmaGeneticaDePolly := cantidadDeHuevosConLaFirmaGeneticaDePolly +1.
	cantidadDeHuevosDeAvispas := cantidadDeHuevosDeAvispas +1.
	
	cantidadDePolillas := cantidadDePolillas -1! !

!HabitatDeAvispas class methodsFor: 'modificaciones' stamp: 'MS 4/22/2022 00:06:39'!
restablecerCantidadDeHuevosDeAvispas
	cantidadDeHuevosDeAvispas:= 0.
	cantidadDeHuevosConLaFirmaGeneticaDeOrianaYOrnella := 0.
	cantidadDeHuevosConLaFirmaGeneticaDePolly := 0.! !

!HabitatDeAvispas class methodsFor: 'modificaciones' stamp: 'MS 4/21/2022 19:53:41'!
restablecerCantidadDeOrugas
	cantidadDeOrugas := 0.! !

!HabitatDeAvispas class methodsFor: 'modificaciones' stamp: 'MS 4/21/2022 20:14:27'!
restablecerCantidadDePolillas
	cantidadDePolillas := 0.! !


!HabitatDeAvispas class methodsFor: '--** private fileout/in **--' stamp: 'MS 4/22/2022 12:57:43'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	cantidadDeHuevosConLaFirmaGeneticaDePolly := 0.
	cantidadDePolillas := 0.
	cantidadDeHuevosDeAvispas := 0.
	cantidadDeOrugas := 0.
	cantidadDeHuevosConLaFirmaGeneticaDeOrianaYOrnella := 0.! !


!classDefinition: #OriLaAvi category: 'AvispasYAbejasParte2'!
DenotativeObject subclass: #OriLaAvi
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OriLaAvi class' category: 'AvispasYAbejasParte2'!
OriLaAvi class
	instanceVariableNames: ''!

!OriLaAvi class methodsFor: 'comportamiento' stamp: 'MS 4/22/2022 00:07:54'!
intentarReproducirse
	HabitatDeAvispas hayOrugas ifTrue: [ HabitatDeAvispas agregarUnHuevoDeOriYOrne ].
	! !


!classDefinition: #OrneLaAvi category: 'AvispasYAbejasParte2'!
DenotativeObject subclass: #OrneLaAvi
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OrneLaAvi class' category: 'AvispasYAbejasParte2'!
OrneLaAvi class
	instanceVariableNames: ''!

!OrneLaAvi class methodsFor: 'comportamiento' stamp: 'MS 4/22/2022 00:08:02'!
intentarReproducirse
	HabitatDeAvispas hayOrugas ifTrue: [ HabitatDeAvispas agregarUnHuevoDeOriYOrne ].! !


!classDefinition: #PollyLaAvi category: 'AvispasYAbejasParte2'!
DenotativeObject subclass: #PollyLaAvi
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PollyLaAvi class' category: 'AvispasYAbejasParte2'!
PollyLaAvi class
	instanceVariableNames: ''!

!PollyLaAvi class methodsFor: 'comportamiento' stamp: 'MS 4/22/2022 00:09:42'!
intentarReproducirse
	HabitatDeAvispas hayPolillas ifTrue: [ HabitatDeAvispas agregarUnHuevoDePolly ].! !


!classDefinition: #PruebasReproduccionDeAvispas category: 'AvispasYAbejasParte2'!
DenotativeObject subclass: #PruebasReproduccionDeAvispas
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PruebasReproduccionDeAvispas class' category: 'AvispasYAbejasParte2'!
PruebasReproduccionDeAvispas class
	instanceVariableNames: ''!

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'JMB 4/18/2022 18:38:11'!
test01EnElInicioDeLosTiemposNoHayHuevos	
	self retrocederElHabitatAlInicioDeLosTiempos.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 0! !

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


!PruebasReproduccionDeAvispas class methodsFor: 'tests - firma genetica' stamp: 'JMB 4/21/2022 12:15:06'!
test14CuandoOrianaLaAvispaSeReproduceDejaUnHuevoConSuFirmaGenetica
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeOriana isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - firma genetica' stamp: 'JMB 4/21/2022 12:15:02'!
test15CuandoOrianaLaAvispaAunNoSeReprodujoNoTieneHuevosConSuFirmaGenetica
	self retrocederElHabitatAlInicioDeLosTiempos. 
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeOriana isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - firma genetica' stamp: 'JMB 4/21/2022 12:14:58'!
test16CuandoPollyLaAvispaSeReproduceDejaUnHuevoConSuFirmaGenetica
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaPolly intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDePolly isEqualTo: 1.
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeOriana isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - firma genetica' stamp: 'JMB 4/21/2022 12:14:54'!
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

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Lara la ladrona' stamp: 'JMB 4/21/2022 12:15:22'!
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
	Assert isTrue: false description: 'Reemplazar esto por la implementación correspondiente'.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'MS 4/21/2022 20:54:02'!
cantidadDeHuevosConLaFirmaGeneticaDeOriana
	^self habitat cantidadDeHuevosConLaFirmaGeneticaDeOrianaYOrnella.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'MS 4/21/2022 20:53:54'!
cantidadDeHuevosConLaFirmaGeneticaDeOrnella
	^self habitat cantidadDeHuevosConLaFirmaGeneticaDeOrianaYOrnella.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'MS 4/21/2022 20:30:42'!
cantidadDeHuevosConLaFirmaGeneticaDePolly
	^self habitat cantidadDeHuevosConLaFirmaGeneticaDePolly .! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'MS 4/21/2022 19:24:47'!
habitat
	^HabitatDeAvispas.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'MS 4/21/2022 20:22:39'!
hacerQueElHabitatTengaLosRecursosSuficientes
	self habitat agregarOrugas: 2.
	self habitat agregarPolillas: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'JMB 4/19/2022 19:14:28'!
laAvispaLara
	Assert isTrue: false description: 'Reemplazar esto por la implementación correspondiente'.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'MS 4/21/2022 19:32:00'!
laAvispaOriana
	^OriLaAvi.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'MS 4/21/2022 20:10:02'!
laAvispaOrnella
	^OrneLaAvi .! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'MS 4/21/2022 20:11:16'!
laAvispaPolly
	^PollyLaAvi. ! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'MS 4/21/2022 20:07:00'!
queElHabitatTengaDosOrugasMas
	self habitat agregarOrugas: 2. ! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'MS 4/21/2022 20:23:25'!
queElHabitatTengaDosPolillasMas
	self habitat agregarPolillas: 2.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'MS 4/21/2022 20:06:42'!
queElHabitatTengaUnaOrugaMas
	self habitat agregarOrugas: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'MS 4/21/2022 20:12:06'!
queElHabitatTengaUnaPolillaMas
	self habitat agregarPolillas: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'MS 4/21/2022 20:25:06'!
retrocederElHabitatAlInicioDeLosTiempos
	self habitat restablecerCantidadDeHuevosDeAvispas.
	self habitat restablecerCantidadDeOrugas.
	self habitat restablecerCantidadDePolillas.! !

HabitatDeAvispas initializeAfterFileIn!