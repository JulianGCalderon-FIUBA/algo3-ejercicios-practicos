!classDefinition: #HabitatDeCiudadVespula category: 'AvispasYAbejas'!
DenotativeObject subclass: #HabitatDeCiudadVespula
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejas'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'HabitatDeCiudadVespula class' category: 'AvispasYAbejas'!
HabitatDeCiudadVespula class
	instanceVariableNames: 'cantidadDeOrugasTotales cantidadDePolillasTotales cantidadDeHuevosDeAvispaSegunMadre'!

!HabitatDeCiudadVespula class methodsFor: 'información' stamp: 'JGC 4/22/2022 21:01:31'!
avispaConNidoDiponibleParaRobar
	((cantidadDeHuevosDeAvispaSegunMadre at: OriLaAvi) > 0) ifTrue:
	[
		^OriLaAvi.
	].
	
	((cantidadDeHuevosDeAvispaSegunMadre at: OrneLaAvi) > 0) ifTrue:
	[
		^OrneLaAvi.
	].

	^PollyLaAvi.
	! !

!HabitatDeCiudadVespula class methodsFor: 'información' stamp: 'JGC 4/22/2022 20:25:37'!
cantidadDeHuevosConLaFirmaGeneticaDeLara
	^cantidadDeHuevosDeAvispaSegunMadre at: LariLaAvi.! !

!HabitatDeCiudadVespula class methodsFor: 'información' stamp: 'JGC 4/22/2022 20:26:36'!
cantidadDeHuevosConLaFirmaGeneticaDeOriana
	^(cantidadDeHuevosDeAvispaSegunMadre at: OriLaAvi ) + (cantidadDeHuevosDeAvispaSegunMadre at: OrneLaAvi).
	! !

!HabitatDeCiudadVespula class methodsFor: 'información' stamp: 'JGC 4/22/2022 00:51:30'!
cantidadDeHuevosConLaFirmaGeneticaDeOrnella
	^self cantidadDeHuevosConLaFirmaGeneticaDeOriana.
	! !

!HabitatDeCiudadVespula class methodsFor: 'información' stamp: 'JGC 4/22/2022 21:03:38'!
cantidadDeHuevosConLaFirmaGeneticaDePolly
	^cantidadDeHuevosDeAvispaSegunMadre at: PollyLaAvi.! !

!HabitatDeCiudadVespula class methodsFor: 'información' stamp: 'JGC 4/22/2022 21:04:42'!
cantidadDeHuevosDeAvispas
	^cantidadDeHuevosDeAvispaSegunMadre values sum: [ : cantidadDeHuevos | cantidadDeHuevos].! !

!HabitatDeCiudadVespula class methodsFor: 'información' stamp: 'MS 4/22/2022 14:56:51'!
cantidadDeOrugas
	^cantidadDeOrugasTotales.! !

!HabitatDeCiudadVespula class methodsFor: 'información' stamp: 'MS 4/22/2022 14:56:58'!
cantidadDePolillas
	^cantidadDePolillasTotales.! !

!HabitatDeCiudadVespula class methodsFor: 'información' stamp: 'MS 4/22/2022 14:56:51'!
hayOrugas
	^cantidadDeOrugasTotales > 0.! !

!HabitatDeCiudadVespula class methodsFor: 'información' stamp: 'MS 4/22/2022 14:56:58'!
hayPolillas
	^cantidadDePolillasTotales > 0.! !


!HabitatDeCiudadVespula class methodsFor: 'modificaciones' stamp: 'MS 4/22/2022 14:56:51'!
agregarOrugas: cantidadDeOrugasAAgregar 
	cantidadDeOrugasTotales := cantidadDeOrugasTotales  + cantidadDeOrugasAAgregar.! !

!HabitatDeCiudadVespula class methodsFor: 'modificaciones' stamp: 'MS 4/22/2022 14:56:58'!
agregarPolillas: cantidadDePolillasAAgregar 
	cantidadDePolillasTotales := cantidadDePolillasTotales  + cantidadDePolillasAAgregar.! !

!HabitatDeCiudadVespula class methodsFor: 'modificaciones' stamp: 'JGC 4/22/2022 20:30:42'!
agregarUnHuevoDeAvispa: avispaMadre
	cantidadDeHuevosDeAvispaSegunMadre at: avispaMadre put: 
		(cantidadDeHuevosDeAvispaSegunMadre at: avispaMadre) + 1.! !

!HabitatDeCiudadVespula class methodsFor: 'modificaciones' stamp: 'JGC 4/22/2022 21:09:55'!
eliminarUnHuevoDeAvispa: avispaMadre
	cantidadDeHuevosDeAvispaSegunMadre at: avispaMadre put: 
		(cantidadDeHuevosDeAvispaSegunMadre at: avispaMadre) - 1.
! !

!HabitatDeCiudadVespula class methodsFor: 'modificaciones' stamp: 'MS 4/22/2022 14:56:51'!
eliminarUnaOruga
	cantidadDeOrugasTotales := cantidadDeOrugasTotales - 1.! !

!HabitatDeCiudadVespula class methodsFor: 'modificaciones' stamp: 'MS 4/22/2022 14:56:58'!
eliminarUnaPolilla
	cantidadDePolillasTotales := cantidadDePolillasTotales - 1.! !

!HabitatDeCiudadVespula class methodsFor: 'modificaciones' stamp: 'JGC 4/22/2022 21:09:13'!
retrocederElHabitatAlInicioDeLosTiempos	
	cantidadDeHuevosDeAvispaSegunMadre := Dictionary new.
	cantidadDeHuevosDeAvispaSegunMadre at: OriLaAvi put: 0.
	cantidadDeHuevosDeAvispaSegunMadre at: OrneLaAvi put: 0.
	cantidadDeHuevosDeAvispaSegunMadre at: PollyLaAvi put: 0.
	cantidadDeHuevosDeAvispaSegunMadre at: LariLaAvi put: 0.
	
	cantidadDeOrugasTotales  := 0.
	cantidadDePolillasTotales  := 0.! !


!HabitatDeCiudadVespula class methodsFor: '--** private fileout/in **--' stamp: 'JGC 4/22/2022 21:10:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	cantidadDeOrugasTotales := 0.
	cantidadDePolillasTotales := 0.
	cantidadDeHuevosDeAvispaSegunMadre := ((Dictionary new) add: (LariLaAvi->0); add: (OriLaAvi->0); add: (OrneLaAvi->0); add: (PollyLaAvi->0); yourself).! !


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

!OriLaAvi class methodsFor: 'comportamiento interno' stamp: 'MS 4/22/2022 14:51:00'!
alimentarse
	HabitatDeCiudadVespula eliminarUnaOruga.! !

!OriLaAvi class methodsFor: 'comportamiento interno' stamp: 'MS 4/22/2022 14:51:00'!
hayAlimento
	^HabitatDeCiudadVespula hayOrugas.! !

!OriLaAvi class methodsFor: 'comportamiento interno' stamp: 'JGC 4/22/2022 20:31:46'!
ponerHuevo
	HabitatDeCiudadVespula agregarUnHuevoDeAvispa: self.! !


!OriLaAvi class methodsFor: 'comportamiento general' stamp: 'JGC 4/22/2022 21:05:32'!
intentarReproducirse
	self hayAlimento ifTrue:
	[
		self alimentarse.
		self ponerHuevo.
	].

	! !


!classDefinition: #LariLaAvi category: 'AvispasYAbejas'!
OriLaAvi subclass: #LariLaAvi
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejas'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LariLaAvi class' category: 'AvispasYAbejas'!
LariLaAvi class
	instanceVariableNames: ''!

!LariLaAvi class methodsFor: 'comportamiento interno' stamp: 'JGC 4/22/2022 20:59:49'!
alimentarse
	HabitatDeCiudadVespula eliminarUnHuevoDeAvispa: HabitatDeCiudadVespula avispaConNidoDiponibleParaRobar.! !

!LariLaAvi class methodsFor: 'comportamiento interno' stamp: 'JGC 4/22/2022 21:06:38'!
hayAlimento
	^(HabitatDeCiudadVespula cantidadDeHuevosDeAvispas - HabitatDeCiudadVespula cantidadDeHuevosConLaFirmaGeneticaDeLara) > 0.! !


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

!OrneLaAvi class methodsFor: 'comportamiento interno' stamp: 'JGC 4/22/2022 21:07:37'!
saludar
	^'Holaa!! Soy Orne la Avi. \\(O-O)//'.! !


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

!PollyLaAvi class methodsFor: 'comportamiento interno' stamp: 'MS 4/22/2022 14:51:00'!
alimentarse
	HabitatDeCiudadVespula eliminarUnaPolilla.! !

!PollyLaAvi class methodsFor: 'comportamiento interno' stamp: 'MS 4/22/2022 14:51:00'!
hayAlimento
	^HabitatDeCiudadVespula hayPolillas.! !


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


!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'JGC 4/22/2022 13:49:37'!
cantidadDeHuevosConLaFirmaGeneticaDeLara
	^self habitat cantidadDeHuevosConLaFirmaGeneticaDeLara.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'JGC 4/22/2022 00:51:18'!
cantidadDeHuevosConLaFirmaGeneticaDeOriana
	^self habitat cantidadDeHuevosConLaFirmaGeneticaDeOriana.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'JGC 4/22/2022 00:52:00'!
cantidadDeHuevosConLaFirmaGeneticaDeOrnella
	^self habitat cantidadDeHuevosConLaFirmaGeneticaDeOrnella.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'JGC 4/22/2022 00:42:19'!
cantidadDeHuevosConLaFirmaGeneticaDePolly
	^self habitat cantidadDeHuevosConLaFirmaGeneticaDePolly.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'MS 4/22/2022 14:51:00'!
habitat
	^HabitatDeCiudadVespula.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'JGC 4/22/2022 00:19:42'!
hacerQueElHabitatTengaLosRecursosSuficientes
	self habitat agregarOrugas: 2.
	self habitat agregarPolillas: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'JGC 4/22/2022 13:35:35'!
laAvispaLara
	^LariLaAvi.! !

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

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'JGC 4/22/2022 21:09:13'!
retrocederElHabitatAlInicioDeLosTiempos
	self habitat retrocederElHabitatAlInicioDeLosTiempos.! !

HabitatDeCiudadVespula initializeAfterFileIn!