!classDefinition: #SmallTrainerTest category: 'SmallTrainer'!
TestCase subclass: #SmallTrainerTest
	instanceVariableNames: 'unGym unAtleta unaRutina unAtletaConvencional unAtletaSuper unaSuperRutina'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SmallTrainer'!

!SmallTrainerTest methodsFor: 'Test SmallTrainer' stamp: 'AP 10/25/2023 14:53:25'!
test001_CuandoSmallTrainerAbre_NoTieneAtletasInscriptos

	Assert isTrue: (unGym atletas isEmpty)! !

!SmallTrainerTest methodsFor: 'Test SmallTrainer' stamp: 'AP 10/25/2023 16:08:44'!
test002_SmallTrainerPuedeInscribir_AUnAtleta

	unGym inscribirA: unAtletaConvencional.

	Assert isFalse: (unGym atletas isEmpty)! !

!SmallTrainerTest methodsFor: 'Test SmallTrainer' stamp: 'AP 10/25/2023 16:16:18'!
test003_SmallTrainerNoPuedeInscribir_DosVeces_AUnAtleta

	
	unGym inscribirA: unAtletaConvencional .
	unGym inscribirA: unAtletaConvencional .

	Assert that: unGym cantidadDeAtletas isEqualTo: 1.! !

!SmallTrainerTest methodsFor: 'Test SmallTrainer' stamp: 'AP 10/25/2023 16:31:44'!
test004_SmallTrainerLeAplicaUnaMembresia_AUnAtletaConvencionalRecienInscripto

	| montoAPagarPorUnConvencional |
	montoAPagarPorUnConvencional := 500 * peso.
	
	unGym inscribirA: unAtletaConvencional.
	
	Assert that: unAtletaConvencional  membresia isEqualTo: montoAPagarPorUnConvencional.! !

!SmallTrainerTest methodsFor: 'Test SmallTrainer' stamp: 'AP 10/25/2023 16:31:46'!
test005_SmallTrainerLeAplicaUnaMembresia_AUnAtletaSuperRecienInscripto

	| montoAPagarPorUnSuper |
	montoAPagarPorUnSuper := 675 * peso.
	
	unGym inscribirA: unAtletaSuper.
	
	Assert that: unAtletaSuper  membresia isEqualTo: montoAPagarPorUnSuper.! !


!SmallTrainerTest methodsFor: 'Test Atletas' stamp: 'AP 10/25/2023 15:47:08'!
test001_UnAtletaNuevo_NoTieneAUnaRutina

	
	Assert that: unAtleta rutinaInscripta isEqualTo: 'No tiene Rutina'! !

!SmallTrainerTest methodsFor: 'Test Atletas' stamp: 'AP 10/25/2023 15:47:51'!
test002_UnAtletaPuedeInscribirseAUnaRutina

	unAtleta inscribirseA: unaRutina.
	
	Assert that: unAtleta rutinaInscripta isEqualTo: unaRutina! !


!SmallTrainerTest methodsFor: 'Test Rutinas' stamp: 'AP 10/25/2023 16:41:17'!
test001_UnaRutina_SabeSiEsSuperRutina


	Assert isTrue: ( unaSuperRutina esSuperRutina).! !

!SmallTrainerTest methodsFor: 'Test Rutinas' stamp: 'AP 10/25/2023 16:48:08'!
test002_UnaRutina_SabeSiEsConvencional

	Assert isFalse: ( unaSuperRutina esConvencional).! !


!SmallTrainerTest methodsFor: 'Factory-Methods' stamp: 'AP 10/25/2023 17:39:14'!
setUp

	unGym:= SmallTrainer new.
	unaRutina:= Rutina new.
	unAtletaConvencional := Convencional new.
	unAtletaSuper:= Super new.
	unaSuperRutina:= SuperRutina new.! !


!classDefinition: #Atleta category: 'SmallTrainer'!
Object subclass: #Atleta
	instanceVariableNames: 'rutinaInscripta membresia'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SmallTrainer'!

!Atleta methodsFor: 'as yet unclassified' stamp: 'AP 10/25/2023 15:47:42'!
initialize
	
	rutinaInscripta := 'No tiene Rutina'! !

!Atleta methodsFor: 'as yet unclassified' stamp: 'AP 10/25/2023 15:20:00'!
inscribirseA: unaRutina 
	
	rutinaInscripta:= unaRutina.! !

!Atleta methodsFor: 'as yet unclassified' stamp: 'AP 10/25/2023 16:30:29'!
membresia

	^membresia! !

!Atleta methodsFor: 'as yet unclassified' stamp: 'AP 10/25/2023 16:12:22'!
recibirMontoDeMembresia: aRenameMe1 
	self subclassResponsibility! !

!Atleta methodsFor: 'as yet unclassified' stamp: 'AP 10/25/2023 15:20:21'!
rutinaInscripta
	^rutinaInscripta.! !


!classDefinition: #Convencional category: 'SmallTrainer'!
Atleta subclass: #Convencional
	instanceVariableNames: 'categoriaAtleta'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SmallTrainer'!

!Convencional methodsFor: 'as yet unclassified' stamp: 'AP 10/25/2023 15:37:52'!
initialize

	membresia:= 0 * peso! !

!Convencional methodsFor: 'as yet unclassified' stamp: 'AP 10/25/2023 15:37:22'!
membresia
	^ membresia! !

!Convencional methodsFor: 'as yet unclassified' stamp: 'AP 10/25/2023 16:13:19'!
recibirMontoDeMembresia: montoDeMembresiaBasico 
	
	membresia:= montoDeMembresiaBasico .! !


!classDefinition: #Super category: 'SmallTrainer'!
Atleta subclass: #Super
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SmallTrainer'!

!Super methodsFor: 'as yet unclassified' stamp: 'AP 10/25/2023 16:29:47'!
initialize

	membresia:=  0 *peso! !

!Super methodsFor: 'as yet unclassified' stamp: 'AP 10/25/2023 16:29:16'!
recibirMontoDeMembresia: montoBasicoDeMembresia 
	
	| montoAplicadoPorSerSuper |
	montoAplicadoPorSerSuper := montoBasicoDeMembresia * 0.35.
	
	membresia := montoBasicoDeMembresia + (montoAplicadoPorSerSuper)! !


!classDefinition: #Rutina category: 'SmallTrainer'!
Object subclass: #Rutina
	instanceVariableNames: 'tipoDeRutina'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SmallTrainer'!

!Rutina methodsFor: 'as yet unclassified' stamp: 'AP 10/25/2023 16:48:34'!
esConvencional
	^tipoDeRutina = 'Convencional'! !

!Rutina methodsFor: 'as yet unclassified' stamp: 'AP 10/25/2023 16:46:17'!
esSuperRutina

	^tipoDeRutina = 'SuperRutina'! !


!classDefinition: #SuperRutina category: 'SmallTrainer'!
Rutina subclass: #SuperRutina
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SmallTrainer'!

!SuperRutina methodsFor: 'as yet unclassified' stamp: 'AP 10/25/2023 16:44:21'!
initialize

	tipoDeRutina:= 'SuperRutina'! !


!classDefinition: #SmallTrainer category: 'SmallTrainer'!
Object subclass: #SmallTrainer
	instanceVariableNames: 'unGym atletas'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SmallTrainer'!

!SmallTrainer methodsFor: 'as yet unclassified' stamp: 'AP 10/25/2023 15:58:49'!
aplicarMembresiaA: unAtleta 

	 unAtleta recibirMontoDeMembresia:  self montoDeMembresiaBasico.
	
! !

!SmallTrainer methodsFor: 'as yet unclassified' stamp: 'AP 10/25/2023 14:53:37'!
atletas
	
	^atletas! !

!SmallTrainer methodsFor: 'as yet unclassified' stamp: 'AP 10/25/2023 15:07:21'!
cantidadDeAtletas
	^atletas size.! !

!SmallTrainer methodsFor: 'as yet unclassified' stamp: 'AP 10/25/2023 14:54:58'!
initialize
		
		atletas:= Set new.! !

!SmallTrainer methodsFor: 'as yet unclassified' stamp: 'AP 10/25/2023 15:39:32'!
inscribirA: unAtleta 
	
	atletas add: unAtleta .
	
	self aplicarMembresiaA: unAtleta.! !

!SmallTrainer methodsFor: 'as yet unclassified' stamp: 'AP 10/25/2023 16:02:29'!
montoDeMembresiaBasico
	^ 500 * peso! !
