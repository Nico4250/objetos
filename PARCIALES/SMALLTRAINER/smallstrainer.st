!classDefinition: #Atletas category: #smallstrainer!
DenotativeObject subclass: #Atletas
	instanceVariableNames: 'tieneMembresia cuotaActual rutinas energiaActual'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'smallstrainer'!

!Atletas methodsFor: 'as yet unclassified' stamp: 'nikii 11/6/2024 11:45:30'!
InicializarConEnergiaDe: cantidad
	
	energiaActual := cantidad.
	tieneMembresia := false.
	rutinas := Set new.! !

!Atletas methodsFor: 'as yet unclassified' stamp: 'nikii 11/6/2024 10:37:12'!
IniciarRutinas

	rutinas := Set new.! !

!Atletas methodsFor: 'as yet unclassified' stamp: 'nikii 11/6/2024 09:28:16'!
adquirirMembresia


	tieneMembresia := True.
	
	cuotaActual := Membresia precioPara: self! !

!Atletas methodsFor: 'as yet unclassified' stamp: 'nikii 11/6/2024 11:44:19'!
agregarRutina: rutina

	self suCuotaAumentaEn: (rutina precioPara: self) .
	rutinas add: rutina! !

!Atletas methodsFor: 'as yet unclassified' stamp: 'nikii 11/6/2024 09:30:10'!
cuotaTotal

	^cuotaActual! !

!Atletas methodsFor: 'as yet unclassified' stamp: 'nikii 11/6/2024 11:40:57'!
energiaActual

	energiaActual! !

!Atletas methodsFor: 'as yet unclassified' stamp: 'nikii 11/6/2024 11:53:00'!
esfuerzoPorRutinas

	rutinas sum: [:rutina | rutina esfuerzo] ifEmpty: [0*joule]! !

!Atletas methodsFor: 'as yet unclassified' stamp: 'nikii 11/6/2024 11:51:21'!
estaSobreCargado


	energiaActual < self esfuerzoporRutinas! !

!Atletas methodsFor: 'as yet unclassified' stamp: 'nikii 11/6/2024 10:37:50'!
rutinas

	^rutinas ! !

!Atletas methodsFor: 'as yet unclassified' stamp: 'nikii 11/6/2024 10:42:23'!
suCuotaAumentaEn: precio


	cuotaActual := cuotaActual + precio! !


!classDefinition: #Ciudadano category: #smallstrainer!
Atletas subclass: #Ciudadano
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'smallstrainer'!

!Ciudadano methodsFor: 'as yet unclassified' stamp: 'nikii 11/6/2024 00:56:33'!
esNormal

	^true! !

!Ciudadano methodsFor: 'as yet unclassified' stamp: 'nikii 11/6/2024 00:56:45'!
esSuper

	^false! !


!classDefinition: #Superheroe category: #smallstrainer!
Atletas subclass: #Superheroe
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'smallstrainer'!

!Superheroe methodsFor: 'as yet unclassified' stamp: 'nikii 11/6/2024 00:56:14'!
esNormal

	^false! !

!Superheroe methodsFor: 'as yet unclassified' stamp: 'nikii 11/6/2024 00:55:56'!
esSuper

	^true! !


!classDefinition: #Membresia category: #smallstrainer!
DenotativeObject subclass: #Membresia
	instanceVariableNames: 'atletas'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'smallstrainer'!

!Membresia methodsFor: 'as yet unclassified' stamp: 'nikii 11/6/2024 10:39:32'!
initializeAtletas

	atletas := Set new! !

!Membresia methodsFor: 'as yet unclassified' stamp: 'nikii 11/6/2024 10:41:01'!
inscribirAlAtleta: atleta
	atleta adquirirMembresia.
	atletas add: atleta

	! !

!Membresia methodsFor: 'as yet unclassified' stamp: 'nikii 11/6/2024 11:35:09'!
precioPara: atleta

	^(atleta esSuper) ifTrue: [(500*peso) * 1.35] ifFalse: [500*peso]! !


!classDefinition: #Rutina category: #smallstrainer!
DenotativeObject subclass: #Rutina
	instanceVariableNames: 'esfuerzo precio'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'smallstrainer'!

!Rutina methodsFor: 'as yet unclassified' stamp: 'nikii 11/6/2024 11:26:42'!
esfuerzo

	self  subclassResponsibility ! !

!Rutina methodsFor: 'as yet unclassified' stamp: 'nikii 11/6/2024 10:47:55'!
esfuerzoDe: deportista

	self subclassResponsibility ! !

!Rutina methodsFor: 'as yet unclassified' stamp: 'nikii 11/6/2024 11:27:49'!
precio

	self subclassResponsibility ! !

!Rutina methodsFor: 'as yet unclassified' stamp: 'nikii 11/6/2024 10:48:50'!
precioPara: deportista

	self subclassResponsibility ! !


!classDefinition: #RutinaConvencional category: #smallstrainer!
Rutina subclass: #RutinaConvencional
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'smallstrainer'!

!RutinaConvencional methodsFor: 'as yet unclassified' stamp: 'nikii 11/6/2024 11:26:06'!
esfuerzoDe: deportista
	|esfuerzoTotal|
	(deportista esSuper)
		ifTrue: [esfuerzoTotal := self esfuerzo /2] 
		ifFalse: [esfuerzoTotal := self esfuerzo ].
	
	^esfuerzoTotal! !

!RutinaConvencional methodsFor: 'as yet unclassified' stamp: 'nikii 11/6/2024 11:00:04'!
precioPara: deportista
	|precioFinal|
	(deportista esNormal )
		ifTrue: [precioFinal := self precio] 
		ifFalse: [precioFinal := self precio * 1.10].
	
	^precioFinal! !


!classDefinition: #Aerobico category: #smallstrainer!
RutinaConvencional subclass: #Aerobico
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'smallstrainer'!

!Aerobico methodsFor: 'as yet unclassified' stamp: 'nikii 11/6/2024 11:25:17'!
esfuerzo

	50 * joule! !

!Aerobico methodsFor: 'as yet unclassified' stamp: 'nikii 11/6/2024 11:28:56'!
precio

	^800 * peso! !


!classDefinition: #Musculatura category: #smallstrainer!
RutinaConvencional subclass: #Musculatura
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'smallstrainer'!


!classDefinition: #SuperRutina category: #smallstrainer!
Rutina subclass: #SuperRutina
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'smallstrainer'!

!SuperRutina methodsFor: 'as yet unclassified' stamp: 'nikii 11/6/2024 11:22:13'!
esfuerzoDe: deportista
	|esfuerzoTotal|
	(deportista esSuper)
		ifTrue: [esfuerzoTotal := self esfuerzo] 
		ifFalse: [esfuerzoTotal := self esfuerzo *2].
	
	^esfuerzoTotal! !

!SuperRutina methodsFor: 'as yet unclassified' stamp: 'nikii 11/6/2024 11:20:01'!
precioPara: deportista
	|precioFinal|
	(deportista esSuper)
		ifTrue: [precioFinal := self precio *0.10] 
		ifFalse: [precioFinal := self precio].
	
	^precioFinal! !


!classDefinition: #ArtesMarciales category: #smallstrainer!
SuperRutina subclass: #ArtesMarciales
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'smallstrainer'!


!classDefinition: #Crossfit category: #smallstrainer!
SuperRutina subclass: #Crossfit
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'smallstrainer'!
