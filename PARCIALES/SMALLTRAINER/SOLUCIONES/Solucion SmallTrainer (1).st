!classDefinition: #SmallTrainerTest category: 'SmallTrainer'!
TestCase subclass: #SmallTrainerTest
	instanceVariableNames: 'smallTrainer superman pepe crossfit musculatura'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SmallTrainer'!

!SmallTrainerTest methodsFor: 'tests - smalltrainer' stamp: 'GET 10/23/2022 15:18:55'!
test01_UnSmallTrainerNoTieneDeportistasInscriptos

	self assert: 0 equals: smallTrainer cantidadDeDeportistasInscriptos.! !

!SmallTrainerTest methodsFor: 'tests - smalltrainer' stamp: 'GET 10/23/2022 15:21:32'!
test02_UnSmallTrainerTieneAUnDeportistaInscripto

	smallTrainer inscribirA: superman .

	self assert: 1 equals: smallTrainer cantidadDeDeportistasInscriptos.! !

!SmallTrainerTest methodsFor: 'tests - smalltrainer' stamp: 'GET 10/23/2022 15:20:28'!
test03_UnSmallTrainerNoInscribeDosVecesAUnMismoDeportista

	smallTrainer inscribirA: superman .

	smallTrainer inscribirA: superman .

	self assert: 1 equals: smallTrainer cantidadDeDeportistasInscriptos.
	self assert: (smallTrainer tieneInscriptoA: superman).! !

!SmallTrainerTest methodsFor: 'tests - smalltrainer' stamp: 'GET 10/23/2022 15:21:59'!
test04_UnSmallTrainerNoTieneInscriptoAUnDeportista

	self deny: (smallTrainer tieneInscriptoA: superman).! !

!SmallTrainerTest methodsFor: 'tests - smalltrainer' stamp: 'GET 10/23/2022 15:22:46'!
test05_UnSmallTrainerNoTieneGananciasAlNoTenerInscriptos

	self assert: (smallTrainer totalRecaudado) equals: 0 * peso! !

!SmallTrainerTest methodsFor: 'tests - smalltrainer' stamp: 'GET 10/23/2022 15:23:54'!
test06_UnSmallTrainerTieneGananciasAlTenerInscriptos

	smallTrainer inscribirA: pepe.
	
	self assert: (smallTrainer totalRecaudado) equals: 500 * peso! !

!SmallTrainerTest methodsFor: 'tests - smalltrainer' stamp: 'GET 10/23/2022 16:11:01'!
test16_UnSmallTrainerNoTieneNingunSuperHeroeInscrito

	smallTrainer inscribirA: pepe.
	
	self assert: (smallTrainer cantidadDeSuperHeroesInscritos) equals: 0! !

!SmallTrainerTest methodsFor: 'tests - smalltrainer' stamp: 'GET 10/23/2022 16:11:37'!
test17_UnSmallTrainerTieneSuperHeroesInscritos

	smallTrainer inscribirA: pepe.

	smallTrainer inscribirA: superman.

	self assert: (smallTrainer cantidadDeSuperHeroesInscritos) equals: 1! !

!SmallTrainerTest methodsFor: 'tests - smalltrainer' stamp: 'GET 10/23/2022 16:13:29'!
test18_UnSmallTrainerNoTieneNingunDeportistaConvencionalInscrito

	smallTrainer inscribirA: superman.
	
	self assert: (smallTrainer cantidadDeDeportistasConvencionalesInscritos) equals: 0! !

!SmallTrainerTest methodsFor: 'tests - smalltrainer' stamp: 'GET 10/23/2022 16:13:55'!
test19_UnSmallTrainerTieneSuperHeroesInscritos

	smallTrainer inscribirA: superman.

	smallTrainer inscribirA: pepe.

	self assert: (smallTrainer cantidadDeDeportistasConvencionalesInscritos) equals: 1! !

!SmallTrainerTest methodsFor: 'tests - smalltrainer' stamp: 'GET 10/23/2022 16:14:58'!
test20_UnSmallTrainerTieneSuperHeroesInscritos

	smallTrainer inscribirA: superman.

	smallTrainer inscribirA: pepe.

	self assert: (smallTrainer cantidadDeDeportistasConvencionalesInscritos) equals: 1! !

!SmallTrainerTest methodsFor: 'tests - smalltrainer' stamp: 'GET 10/23/2022 16:29:20'!
test21_SmallTrainerTieneAlDeportistaConvencionalMasInspirado

	smallTrainer inscribirA: pepe.

	self assert: (smallTrainer deportistaConvencionalMasInspirado) equals: pepe! !

!SmallTrainerTest methodsFor: 'tests - smalltrainer' stamp: 'GET 10/23/2022 16:29:15'!
test22_SmallTrainerTieneAlDeportistaConvencionalMasInspiradoTeniendoSuperHeroes
	
	smallTrainer  inscribirA: pepe; 
		inscribirA: superman.

	self assert: (smallTrainer deportistaConvencionalMasInspirado) equals: pepe! !

!SmallTrainerTest methodsFor: 'tests - smalltrainer' stamp: 'GET 10/23/2022 16:27:25'!
test23_SmallTrainerTieneAlDeportistaConvencionalMasInspiradoTeniendoConvencionales
	
	| unDeportistaConvencional |
	unDeportistaConvencional := Deportista con: 10 * joule.
	smallTrainer  inscribirA: pepe; 
		inscribirA: unDeportistaConvencional.
	
	pepe inscribirEn: musculatura .

	self assert: (smallTrainer deportistaConvencionalMasInspirado) equals: pepe! !

!SmallTrainerTest methodsFor: 'tests - smalltrainer' stamp: 'GET 10/23/2022 16:36:58'!
test24_SmallTrainerNoTieneSuperDeportistasVagos
	smallTrainer inscribirA: pepe.

	self assert: smallTrainer superHeroesDeportistasVagos isEmpty ! !

!SmallTrainerTest methodsFor: 'tests - smalltrainer' stamp: 'GET 10/23/2022 16:38:25'!
test25_SmallTrainerTieneSuperDeportistasVagos
	
	| unDeportistaNoVago |
	unDeportistaNoVago := SuperHeroeDeportista con: 10 * joule.
	smallTrainer  inscribirA: superman; 
		inscribirA: unDeportistaNoVago.
	
	unDeportistaNoVago inscribirEn: musculatura;
		inscribirEn: musculatura;
		inscribirEn: musculatura .


	self assert: (smallTrainer superHeroesDeportistasVagos) equals: (Set with: superman )! !


!SmallTrainerTest methodsFor: 'setUp/tearDown' stamp: 'GET 10/23/2022 15:18:12'!
setUp
	
	superman  _ SuperHeroeDeportista con: 100 * joule.
	pepe _ DeportistaConvencional con: 100 * joule.
	
	crossfit _ SuperRutina conEsfuerzo: 150 * joule yPrecio:  1500 * peso.
	musculatura _ RutinaConvencional conEsfuerzo: 50 * joule yPrecio:  1000 * peso.
	
	smallTrainer  _ SmallTrainer new.! !


!SmallTrainerTest methodsFor: 'tests - deportistas' stamp: 'GET 10/23/2022 15:25:17'!
test07_UnDeportistaConvencionalTieneCuotaMensualDe500PesosSinTenerRutinas

	self assert: (pepe cuotaMensual) equals: 500 * peso! !

!SmallTrainerTest methodsFor: 'tests - deportistas' stamp: 'GET 10/23/2022 15:25:46'!
test08_UnSuperHeroeDeportistaTieneCuotaMensualDe675PesosSinTenerRutinas

	self assert: (superman cuotaMensual) equals: 675 * peso! !

!SmallTrainerTest methodsFor: 'tests - deportistas' stamp: 'GET 10/23/2022 15:28:12'!
test09_UnDeportistaTieneEnergia

	| unDeportista |
	unDeportista _ DeportistaConvencional con: 50 * joule. 
	
	self assert: (unDeportista energia) equals: 50 * joule! !

!SmallTrainerTest methodsFor: 'tests - deportistas' stamp: 'GET 10/23/2022 15:30:37'!
test10_UnDeportistaInicialmenteNoEstaInscriptoEnNingunaRutina
	
	self assert: (pepe cantidadDeRutinasInscriptas) equals: 0! !

!SmallTrainerTest methodsFor: 'tests - deportistas' stamp: 'GET 10/23/2022 15:30:19'!
test11_UnDeportistaPuedeAgregarUnaRutina
	
	pepe inscribirEn: musculatura.
	
	self assert: (pepe cantidadDeRutinasInscriptas) equals: 1! !

!SmallTrainerTest methodsFor: 'tests - deportistas' stamp: 'GET 10/23/2022 15:53:27'!
test12_UnDeportistaConvencionalNoTieneDescuentosSobreRutinasConvencionales
	
	pepe inscribirEn: musculatura.
	
	self assertarQueA: pepe laRutinaLeCuesta: 1000 * peso! !

!SmallTrainerTest methodsFor: 'tests - deportistas' stamp: 'GET 10/23/2022 15:53:48'!
test13_UnDeportistaConvencionalNoTieneDescuentosSobreSuperRutinas
	
	pepe inscribirEn: crossfit.
	
	self assertarQueA: pepe laRutinaLeCuesta: 1500 * peso! !

!SmallTrainerTest methodsFor: 'tests - deportistas' stamp: 'GET 10/23/2022 15:55:55'!
test14_UnSuperHeroeDeportistaTieneDescuentoSobreSuperRutinas
	
	superman inscribirEn: crossfit.
	
	self assertarQueA: superman laRutinaLeCuesta: 1350 * peso! !

!SmallTrainerTest methodsFor: 'tests - deportistas' stamp: 'GET 10/23/2022 16:00:05'!
test15_UnSuperHeroeDeportistaTieneUnRecargoSobreRutinasConvencionales
	
	superman inscribirEn: musculatura .
	
	self assertarQueA: superman laRutinaLeCuesta: 1100 * peso! !

!SmallTrainerTest methodsFor: 'tests - deportistas' stamp: 'GET 10/23/2022 16:39:41'!
test26_UnDeportistaSinRutinasNoEstaSobrecargado

	self deny: pepe estaSobrecargado  ! !

!SmallTrainerTest methodsFor: 'tests - deportistas' stamp: 'GET 10/23/2022 18:44:04'!
test27_UnDeportistaHeroicoNoEstaSobrecargadoConRutinas

		
	| unSuperDeportista |
	unSuperDeportista _ SuperHeroeDeportista  con: crossfit esfuerzo.
	
	unSuperDeportista inscribirEn: crossfit.

	self deny: unSuperDeportista estaSobrecargado  ! !

!SmallTrainerTest methodsFor: 'tests - deportistas' stamp: 'GET 10/23/2022 18:38:16'!
test28_UnDeportistaConvencionalEstaSobrecargadoConUnaSuperRutina
	
	| unDeportistaConvencional |
	unDeportistaConvencional _ DeportistaConvencional  con: crossfit esfuerzo.
	
	unDeportistaConvencional inscribirEn: crossfit.

	self assert: unDeportistaConvencional estaSobrecargado  ! !

!SmallTrainerTest methodsFor: 'tests - deportistas' stamp: 'GET 10/23/2022 18:45:20'!
test29_UnDeportistaConvencionalNoEstaSobrecargadoConUnaRutinaConvencional
	
	| unDeportistaConvencional |
	unDeportistaConvencional _ DeportistaConvencional  con: musculatura esfuerzo.
	
	unDeportistaConvencional inscribirEn: musculatura .

	self deny: unDeportistaConvencional estaSobrecargado  ! !

!SmallTrainerTest methodsFor: 'tests - deportistas' stamp: 'GET 10/23/2022 18:46:30'!
test30_UnDeportistaHeroicoNecesitaElDobleDeRutinasConvencionalesParaAlcanzarElEsfuerzoDeUnaSuperRutina

		
	| unSuperDeportista |
	unSuperDeportista _ SuperHeroeDeportista  con: musculatura esfuerzo.
	
	unSuperDeportista inscribirEn: musculatura;
				      inscribirEn: musculatura.

	self deny: unSuperDeportista estaSobrecargado  ! !


!SmallTrainerTest methodsFor: 'assertions' stamp: 'GET 10/23/2022 15:45:24'!
assertarQueA: unDeportista laRutinaLeCuesta: costeDeLaRutinaEsperado 
	
	| costeDeLaMembresia |
	costeDeLaMembresia _  	unDeportista costeDeLaMembresia .


	^ self assert: (unDeportista cuotaMensual  - costeDeLaMembresia) equals: costeDeLaRutinaEsperado! !


!classDefinition: #Deportista category: 'SmallTrainer'!
Object subclass: #Deportista
	instanceVariableNames: 'energia rutinas'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SmallTrainer'!

!Deportista methodsFor: 'action' stamp: 'GET 10/23/2022 15:31:19'!
inscribirEn: unaRutina

	rutinas add: unaRutina .! !


!Deportista methodsFor: 'initialization' stamp: 'GET 10/23/2022 15:08:08'!
initialize

	 rutinas _ OrderedCollection new.! !

!Deportista methodsFor: 'initialization' stamp: 'GET 10/23/2022 15:06:07'!
initializeConEnergia: cantidadDeEnergia

	energia _ cantidadDeEnergia.! !


!Deportista methodsFor: 'accessing' stamp: 'GET 10/23/2022 18:53:29'!
cantidadDeRutinasInscriptas	
	^ rutinas  size! !

!Deportista methodsFor: 'accessing' stamp: 'GET 10/23/2022 18:53:32'!
costeDeLaMembresia
	^ 500 * peso! !

!Deportista methodsFor: 'accessing' stamp: 'GET 10/23/2022 18:53:39'!
costeDeLasRutinas
	^ rutinas sum: [:rutina | self precioDe: rutina ] 
			ifEmpty: [0 * peso]! !

!Deportista methodsFor: 'accessing' stamp: 'GET 10/23/2022 15:34:02'!
cuotaMensual
	^ self costeDeLaMembresia + (self costeDeLasRutinas)! !

!Deportista methodsFor: 'accessing' stamp: 'GET 10/23/2022 18:53:46'!
energia	
	^energia! !

!Deportista methodsFor: 'accessing' stamp: 'GET 10/23/2022 18:41:15'!
esfuerzoRequeridoPara: anaRutina 
	self subclassResponsibility ! !

!Deportista methodsFor: 'accessing' stamp: 'GET 10/23/2022 18:53:50'!
precioDe: unaRutina 
	self subclassResponsibility ! !


!Deportista methodsFor: 'testing' stamp: 'GET 10/23/2022 16:14:38'!
esConvencional
	^ false! !

!Deportista methodsFor: 'testing' stamp: 'GET 10/23/2022 16:12:49'!
esSuperHeroe
	^ false! !

!Deportista methodsFor: 'testing' stamp: 'GET 10/23/2022 18:53:57'!
esfuerzoTotalDeLasRutinas
	^ rutinas sum:[: rutina | self esfuerzoRequeridoPara: rutina ] 
			ifEmpty: [0 * joule]! !

!Deportista methodsFor: 'testing' stamp: 'GET 10/23/2022 18:38:33'!
estaSobrecargado
	^ energia < (self esfuerzoTotalDeLasRutinas)! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deportista class' category: 'SmallTrainer'!
Deportista class
	instanceVariableNames: ''!

!Deportista class methodsFor: 'instance creation' stamp: 'GET 10/23/2022 15:06:15'!
con: energia
	^ self new initializeConEnergia: energia.! !


!classDefinition: #DeportistaConvencional category: 'SmallTrainer'!
Deportista subclass: #DeportistaConvencional
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SmallTrainer'!

!DeportistaConvencional methodsFor: 'accessing' stamp: 'GET 10/23/2022 18:40:00'!
esfuerzoRequeridoPara: unaRutina 
	^ unaRutina esfuerzoParaDeportistaConvencional.! !

!DeportistaConvencional methodsFor: 'accessing' stamp: 'GET 10/23/2022 18:53:22'!
precioDe: unaRutina
	^ unaRutina precioParaDeportistasConvencionales .! !


!DeportistaConvencional methodsFor: 'testing' stamp: 'GET 10/23/2022 16:14:30'!
esConvencional
	^ true! !


!classDefinition: #SuperHeroeDeportista category: 'SmallTrainer'!
Deportista subclass: #SuperHeroeDeportista
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SmallTrainer'!

!SuperHeroeDeportista methodsFor: 'accessing' stamp: 'GET 10/23/2022 18:53:12'!
costeDeLaMembresia
	^ (super costeDeLaMembresia  * self factorDeAumentoDeMemembresia) + super costeDeLaMembresia ! !

!SuperHeroeDeportista methodsFor: 'accessing' stamp: 'GET 10/23/2022 18:42:40'!
esfuerzoRequeridoPara: unaRutina 
	^ unaRutina esfuerzoParaSuperHeroeDeportista.! !

!SuperHeroeDeportista methodsFor: 'accessing' stamp: 'GET 10/23/2022 18:53:03'!
factorDeAumentoDeMemembresia
	^ 0.35! !

!SuperHeroeDeportista methodsFor: 'accessing' stamp: 'GET 10/23/2022 18:52:59'!
precioDe: unaRutina 
	^ unaRutina precioParaSuperHeroesDeportistas ! !


!SuperHeroeDeportista methodsFor: 'testing' stamp: 'GET 10/23/2022 16:12:22'!
esSuperHeroe
	^ true! !

!SuperHeroeDeportista methodsFor: 'testing' stamp: 'GET 10/23/2022 18:52:52'!
esVago
	^ self cantidadDeRutinasInscriptas < 2! !


!classDefinition: #Rutina category: 'SmallTrainer'!
Object subclass: #Rutina
	instanceVariableNames: 'esfuerzo precio'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SmallTrainer'!

!Rutina methodsFor: 'accessing' stamp: 'GET 10/23/2022 18:52:23'!
esfuerzo 
	^ esfuerzo
	! !

!Rutina methodsFor: 'accessing' stamp: 'GET 10/23/2022 18:42:30'!
esfuerzoParaDeportistaConvencional
	^ esfuerzo! !

!Rutina methodsFor: 'accessing' stamp: 'GET 10/23/2022 18:40:52'!
esfuerzoParaSuperHeroeDeportista
	^ esfuerzo! !

!Rutina methodsFor: 'accessing' stamp: 'GET 10/23/2022 18:52:25'!
precio 
	^ precio
	! !

!Rutina methodsFor: 'accessing' stamp: 'GET 10/23/2022 18:51:46'!
precioParaDeportistasConvencionales
	^ precio! !

!Rutina methodsFor: 'accessing' stamp: 'GET 10/23/2022 16:09:18'!
precioParaSuperHeroesDeportistas
	self subclassResponsibility ! !


!Rutina methodsFor: 'initialization' stamp: 'GET 10/23/2022 15:16:06'!
initializeConEsfuerzo: cantidadDeEsfuerzo yPrecio: unPrecio
	
	esfuerzo _ 	cantidadDeEsfuerzo .
	precio _ unPrecio.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Rutina class' category: 'SmallTrainer'!
Rutina class
	instanceVariableNames: ''!

!Rutina class methodsFor: 'as yet unclassified' stamp: 'GET 10/23/2022 15:16:06'!
conEsfuerzo: cantidadDeEsfuerzo yPrecio: unPrecio

	^ self new initializeConEsfuerzo: cantidadDeEsfuerzo yPrecio: unPrecio! !


!classDefinition: #RutinaConvencional category: 'SmallTrainer'!
Rutina subclass: #RutinaConvencional
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SmallTrainer'!

!RutinaConvencional methodsFor: 'accessing' stamp: 'GET 10/23/2022 18:47:05'!
esfuerzoParaSuperHeroeDeportista
	^ esfuerzo / 2! !

!RutinaConvencional methodsFor: 'accessing' stamp: 'GET 10/23/2022 16:09:18'!
precioParaSuperHeroesDeportistas
	^ precio + (precio * 0.1)! !


!classDefinition: #SuperRutina category: 'SmallTrainer'!
Rutina subclass: #SuperRutina
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SmallTrainer'!

!SuperRutina methodsFor: 'accessing' stamp: 'GET 10/23/2022 18:40:16'!
esfuerzoParaDeportistaConvencional
	^ esfuerzo * 2! !

!SuperRutina methodsFor: 'accessing' stamp: 'GET 10/23/2022 18:52:05'!
precioParaSuperHeroesDeportistas
	^ precio - (precio * 0.1)! !


!classDefinition: #SmallTrainer category: 'SmallTrainer'!
Object subclass: #SmallTrainer
	instanceVariableNames: 'deportistas'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'SmallTrainer'!

!SmallTrainer methodsFor: 'action' stamp: 'GET 10/23/2022 15:20:55'!
inscribirA: unDeportista 
	deportistas add: unDeportista ! !


!SmallTrainer methodsFor: 'testing' stamp: 'GET 10/23/2022 18:54:19'!
tieneInscriptoA: unDeportista 	
	^ deportistas includes: unDeportista.! !


!SmallTrainer methodsFor: 'accessing' stamp: 'GET 10/23/2022 18:54:23'!
cantidadDeDeportistasConvencionalesInscritos	
	^ deportistas count: [:deportista | deportista esConvencional ]! !

!SmallTrainer methodsFor: 'accessing' stamp: 'GET 10/23/2022 15:19:08'!
cantidadDeDeportistasInscriptos
	^ deportistas size! !

!SmallTrainer methodsFor: 'accessing' stamp: 'GET 10/23/2022 16:12:10'!
cantidadDeSuperHeroesInscritos
	^ deportistas count: [:deportista | deportista esSuperHeroe ].! !

!SmallTrainer methodsFor: 'accessing' stamp: 'GET 10/23/2022 18:55:03'!
deportistaConvencionalMasInspirado
	"se asume que siempre existe al menos un deportista convencional"

	^ self deportistasConvencionales detectMax: [:deportista | deportista cuotaMensual ] ! !

!SmallTrainer methodsFor: 'accessing' stamp: 'GET 10/23/2022 18:54:31'!
deportistasConvencionales
	^ deportistas select: [:deportista| deportista esConvencional ]! !

!SmallTrainer methodsFor: 'accessing' stamp: 'GET 10/23/2022 18:54:34'!
deportistasSuperHeroes
	^ deportistas select: [:deportista | deportista esSuperHeroe ]! !

!SmallTrainer methodsFor: 'accessing' stamp: 'GET 10/23/2022 16:35:51'!
superHeroesDeportistasVagos
	^ self deportistasSuperHeroes select: [:deportista | deportista esVago]! !

!SmallTrainer methodsFor: 'accessing' stamp: 'GET 10/23/2022 18:54:41'!
totalRecaudado
	^ deportistas sum: [:deportista | deportista cuotaMensual ] 
				ifEmpty: [ 0 * peso ]! !


!SmallTrainer methodsFor: 'initialization' stamp: 'GET 10/23/2022 15:12:17'!
initialize

	deportistas _ Set new.! !
