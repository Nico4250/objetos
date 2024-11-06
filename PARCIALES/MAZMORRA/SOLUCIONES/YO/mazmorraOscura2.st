!classDefinition: #Escuadron category: #mazmorraOscura!
DenotativeObject subclass: #Escuadron
	instanceVariableNames: 'heroes aberraciones personajes'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'mazmorraOscura'!

!Escuadron methodsFor: 'initialize' stamp: 'NA 10/31/2024 16:44:38'!
initializeAberraciones

	aberraciones := Set new.! !

!Escuadron methodsFor: 'initialize' stamp: 'naa 11/1/2024 16:00:30'!
initializeHeroes
"nota: me conviene hacer un solo initialize y despues manejarlo disitnto en un set up"
	heroes := Set new.! !


!Escuadron methodsFor: 'accessing' stamp: 'naa 11/1/2024 14:38:01'!
aberracionesContieneA: personaje

	^aberraciones includes: personaje

	! !

!Escuadron methodsFor: 'accessing' stamp: 'naa 11/1/2024 16:38:58'!
dañoDeAberraciones

	^(aberraciones lasAberracionesListasParaLaAccion) sum: [:abActual | abActual daño] ifEmpty: 0.! !

!Escuadron methodsFor: 'accessing' stamp: 'naa 11/1/2024 16:31:50'!
dañoDeHeroes

	^(heroes losHeroesListosParaLaAccion) sum: [:heroeActual | heroeActual daño] ifEmpty: 0.! !

!Escuadron methodsFor: 'accessing' stamp: 'naa 11/1/2024 14:31:45'!
heroesContieneA: personaje

	^heroes includes: personaje

	! !

!Escuadron methodsFor: 'accessing' stamp: 'naa 11/1/2024 16:37:57'!
heroesTienenUltimaEsperanza

	^(self losHeroesListosParaLaAccion size) = 1! !

!Escuadron methodsFor: 'accessing' stamp: 'naa 11/1/2024 15:49:59'!
lasAberracionesAbatidas

	^aberraciones select: [:aberracionActual | aberracionActual estaAbatido]
	! !

!Escuadron methodsFor: 'accessing' stamp: 'naa 11/1/2024 16:27:04'!
lasAberracionesListasParaLaAccion

	^aberraciones select: [:aberracionActual | aberracionActual saludActual > 0]! !

!Escuadron methodsFor: 'accessing' stamp: 'naa 11/1/2024 15:50:05'!
losHeroesAbatidos

	^heroes select: [:heroeActual | heroeActual estaAbatido]
	! !

!Escuadron methodsFor: 'accessing' stamp: 'naa 11/1/2024 16:26:37'!
losHeroesListosParaLaAccion

		^heroes select: [:heroeActual | heroeActual saludActual > 0]! !


!Escuadron methodsFor: 'updating' stamp: 'NA 10/29/2024 14:36:37'!
reclutarAberracion: personaje

	(personaje isKindOf: Aberracion) ifFalse: 
	[^self error:  'El personaje a reclutar no es una aberración'] 
	ifTrue: [aberraciones add: personaje]. 
	
	
! !

!Escuadron methodsFor: 'updating' stamp: 'NA 10/29/2024 14:37:00'!
reclutarHeroe: personaje

	(personaje isKindOf: Heroe) ifFalse: 
	[^self error:  'El personaje a reclutar no es un heroe'] 
	ifTrue: [heroes add: personaje]. 
	! !


!Escuadron methodsFor: 'generales' stamp: 'naa 11/1/2024 16:06:11'!
contieneA: personaje

	^personajes includes: personaje

	! !

!Escuadron methodsFor: 'generales' stamp: 'naa 11/1/2024 16:04:36'!
initialize

	personajes := Set new.! !

!Escuadron methodsFor: 'generales' stamp: 'naa 11/1/2024 16:05:03'!
losAbatidos

	^personajes select: [:pjActual | pjActual estaAbatido]
	! !

!Escuadron methodsFor: 'generales' stamp: 'naa 11/1/2024 16:16:32'!
reclutar: personaje
 |tipoPersonajes|

	(personajes isEmpty) ifTrue: [personajes add: personaje].

	tipoPersonajes := (personajes anyOne) class.
	(personaje isKindOf: tipoPersonajes) ifFalse: [self error:'el personaje es de tipo incorrecto' ].
	
	personajes add: personaje
	
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Escuadron class' category: #mazmorraOscura!
Escuadron class
	instanceVariableNames: 'heroes aberraciones'!

!Escuadron class methodsFor: '--** private fileout/in **--' stamp: 'naa 11/1/2024 16:56:55'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	heroes := ((Set new)).
	aberraciones := nil.! !


!classDefinition: #Personaje category: #mazmorraOscura!
DenotativeObject subclass: #Personaje
	instanceVariableNames: 'salud daño'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'mazmorraOscura'!

!Personaje methodsFor: 'accessing' stamp: 'NA 10/28/2024 20:22:11'!
daño

	^daño

	! !

!Personaje methodsFor: 'accessing' stamp: 'naa 11/1/2024 15:13:07'!
estaAbatido

	^salud = 0! !

!Personaje methodsFor: 'accessing' stamp: 'NA 10/28/2024 20:21:07'!
saludActual
	
	^salud
! !


!Personaje methodsFor: 'actions' stamp: 'naa 11/1/2024 15:27:01'!
atacaA_: personaje

	self subclassResponsibility 
! !


!Personaje methodsFor: 'operations' stamp: 'NA 10/29/2024 01:27:28'!
recibeUnDañoDe_: cantidad delAtacante: atacante

	self subclassResponsibility ! !


!classDefinition: #Aberracion category: #mazmorraOscura!
Personaje subclass: #Aberracion
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'mazmorraOscura'!

!Aberracion methodsFor: 'initialize' stamp: 'NA 10/28/2024 20:28:21'!
iniciarConUnaCantidadDeSaludDe: vida

	salud := vida.	
	daño := 25! !


!classDefinition: #Criminal category: #mazmorraOscura!
Aberracion subclass: #Criminal
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'mazmorraOscura'!

!Criminal methodsFor: 'actions' stamp: 'naa 11/1/2024 15:27:18'!
atacaA_:	 personaje
	(self estaAbatido) ifTrue: [self error: 'no puede atacar porque esta abatido'].
	personaje recibeUnDañoDe_: (self daño) delAtacante: self  ! !


!Criminal methodsFor: 'operations' stamp: 'NA 10/29/2024 01:28:09'!
recibeUnDañoDe_: cantidad delAtacante: atacante

	salud := 0 max: (salud - cantidad)! !


!classDefinition: #Cultista category: #mazmorraOscura!
Aberracion subclass: #Cultista
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'mazmorraOscura'!

!Cultista methodsFor: 'operations' stamp: 'naa 11/1/2024 15:11:59'!
recibeUnDañoDe_: cantidad delAtacante: atacante 

    (atacante realizaAtaquesFisicos) ifTrue: [
        "Reduce la salud en un 150% del daño total si el ataque es físico"
        salud := 0 max: salud - (cantidad * 1.5).
    ] ifFalse: [
        (atacante realizaAtaquesMagicos) ifTrue: [
            "Reduce la salud en un 25% del daño total si el ataque es mágico"
            salud := 0 max: salud - (cantidad * 0.25).
        ] ifFalse: [
            "Aplica el daño sin modificaciones para tipos de ataque no especificados"
            salud := 0 max: (salud - cantidad).
        ].
    ].


! !


!Cultista methodsFor: 'actions' stamp: 'naa 11/1/2024 15:29:34'!
atacaA_:	 personaje
	(self estaAbatido) ifTrue: [self error: 'no puede atacar porque esta abatido'].
	personaje recibeUnDañoDe_: (self daño) delAtacante: self  ! !


!classDefinition: #Horror category: #mazmorraOscura!
Aberracion subclass: #Horror
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'mazmorraOscura'!

!Horror methodsFor: 'operations' stamp: 'NA 10/29/2024 01:28:37'!
recibeUnDañoDe_: cantidad delAtacante: atacante


	salud := 0 max: (salud - (cantidad/2))! !


!Horror methodsFor: 'actions' stamp: 'naa 11/1/2024 15:27:29'!
atacaA_:	 personaje
	(self estaAbatido) ifTrue: [self error: 'no puede atacar porque esta abatido'].
	personaje recibeUnDañoDe_: (self daño *2) delAtacante: self  ! !


!classDefinition: #MuertoViviente category: #mazmorraOscura!
Aberracion subclass: #MuertoViviente
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'mazmorraOscura'!

!MuertoViviente methodsFor: 'operations' stamp: 'naa 11/1/2024 15:08:49'!
recibeUnDañoDe_: cantidad delAtacante: atacante 


    (atacante realizaAtaquesFisicos) ifTrue: [
        "Reduce la salud en un 25% del daño total si el ataque es físico"
        salud := 0 max: salud - (cantidad* 0.25).
    ] ifFalse: [
        (atacante realizaAtaquesMagicos) ifTrue: [
            "Reduce la salud en un 150% del daño total si el ataque es mágico"
            salud := 0 max: salud - (cantidad* 1.5).
        ] ifFalse: [
            "Aplica el daño sin modificaciones para tipos de ataque no especificados"
            salud := 0 max: (salud - cantidad).
        ].
    ].

! !


!MuertoViviente methodsFor: 'actions' stamp: 'naa 11/1/2024 15:29:21'!
atacaA_:	 personaje
	(self estaAbatido) ifTrue: [self error: 'no puede atacar porque esta abatido'].
	personaje recibeUnDañoDe_: (self daño) delAtacante: self  ! !


!classDefinition: #Heroe category: #mazmorraOscura!
Personaje subclass: #Heroe
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'mazmorraOscura'!

!Heroe methodsFor: 'initialize' stamp: 'NA 10/28/2024 20:29:14'!
iniciarConUnaCantidadDePoderDe: poder

	daño := poder.
	salud := 100! !


!Heroe methodsFor: 'operations' stamp: 'naa 11/1/2024 15:29:10'!
atacaA_:	 personaje
	(self estaAbatido) ifTrue: [self error: 'no puede atacar porque esta abatido'].
	personaje recibeUnDañoDe_: (self daño) delAtacante: self  ! !

!Heroe methodsFor: 'operations' stamp: 'naa 11/1/2024 14:59:47'!
recibeUnDañoDe_: cantidad delAtacante: atacante

	salud := 0 max: (salud - cantidad)! !


!classDefinition: #Guerrero category: #mazmorraOscura!
Heroe subclass: #Guerrero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'mazmorraOscura'!

!Guerrero methodsFor: 'accessing' stamp: 'naa 11/1/2024 15:11:30'!
realizaAtaquesFisicos

	^true
! !

!Guerrero methodsFor: 'accessing' stamp: 'NA 10/29/2024 01:31:30'!
realizaAtaquesMagicos

	^false! !


!classDefinition: #Hechicero category: #mazmorraOscura!
Heroe subclass: #Hechicero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'mazmorraOscura'!

!Hechicero methodsFor: 'accessing' stamp: 'NA 10/29/2024 01:31:10'!
realizaAtaquesFisicos

	^false
! !

!Hechicero methodsFor: 'accessing' stamp: 'NA 10/29/2024 01:31:16'!
realizaAtaquesMagicos

	^true! !


!classDefinition: #TestMazmorra category: #mazmorraOscura!
DenotativeObject subclass: #TestMazmorra
	instanceVariableNames: 'heroes aberraciones unGuerrero unHechicero unCriminal unHorror unMuertoViviente unCultista heroesEscuadron aberracionesEscuadron abatidos'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'mazmorraOscura'!

!TestMazmorra methodsFor: 'as yet unclassified' stamp: 'naa 11/1/2024 16:19:47'!
setUp
	"equipoDeHeroes"
	heroesEscuadron := Escuadron new.
	heroesEscuadron initializeHeroes.
	"equipoDeAberraciones"
	aberracionesEscuadron := Escuadron new.
	aberracionesEscuadron initializeAberraciones.
	"heroes" 
	unGuerrero := Guerrero new. 
		unGuerrero iniciarConUnaCantidadDePoderDe: 50.
		
	unHechicero := Hechicero new.
		unHechicero iniciarConUnaCantidadDePoderDe: 30.
	"aberraciones"
	unCriminal := Criminal new.
		unCriminal iniciarConUnaCantidadDeSaludDe: 100.
		
	unHorror := Horror new.
		unHorror iniciarConUnaCantidadDeSaludDe: 75.
		
	unMuertoViviente := MuertoViviente new.
		unMuertoViviente iniciarConUnaCantidadDeSaludDe: 50.
		
	unCultista := Cultista new.
		unCultista iniciarConUnaCantidadDeSaludDe: 30.
	! !

!TestMazmorra methodsFor: 'as yet unclassified' stamp: 'naa 11/1/2024 14:32:33'!
test001_ReclutarAGuerreroEnEscuadron
	
	heroesEscuadron reclutarHeroe: unGuerrero.

	Assert isTrue: (heroesEscuadron heroesContieneA: unGuerrero). ! !

!TestMazmorra methodsFor: 'as yet unclassified' stamp: 'naa 11/1/2024 14:32:42'!
test002_ReclutarAHechiceroEnEscuadron

	heroesEscuadron reclutarHeroe: unHechicero.
	
	Assert isTrue: (heroesEscuadron heroesContieneA: unHechicero).! !

!TestMazmorra methodsFor: 'as yet unclassified' stamp: 'naa 11/1/2024 14:39:20'!
test003_ReclutarAHorrorEnEscuadron
	
	aberracionesEscuadron reclutarAberracion: unHorror.

	Assert isTrue: (aberracionesEscuadron aberracionesContieneA: unHorror). ! !

!TestMazmorra methodsFor: 'as yet unclassified' stamp: 'naa 11/1/2024 14:39:03'!
test004_ReclutarAMuertoVivienteEnEscuadron
	
	aberracionesEscuadron reclutarAberracion: unMuertoViviente.

	Assert isTrue: (aberracionesEscuadron aberracionesContieneA: unMuertoViviente). ! !

!TestMazmorra methodsFor: 'as yet unclassified' stamp: 'naa 11/1/2024 14:45:45'!
test005_ReclutarACultistaEnEscuadron
	
	aberracionesEscuadron reclutarAberracion: unCultista.

	Assert isTrue: (aberracionesEscuadron aberracionesContieneA: unCultista). ! !

!TestMazmorra methodsFor: 'as yet unclassified' stamp: 'naa 11/1/2024 14:50:53'!
test006_MuertoVivienteEsAtacadoPorGuerreroYHechiceroYQuedaAbatido
	
	"salud completa"
	unMuertoViviente saludActual.
	
	unGuerrero atacaA_: unMuertoViviente.
	"daño resistido"
	unMuertoViviente saludActual.
	
	unHechicero atacaA_: unMuertoViviente.
	"esta abatido"
	unMuertoViviente saludActual.
	
	Assert isTrue: (unMuertoViviente estaAbatido)
! !

!TestMazmorra methodsFor: 'as yet unclassified' stamp: 'naa 11/1/2024 15:28:59'!
test007_HorrorAbatidoNoPuedeAtacar
	
	unHorror iniciarConUnaCantidadDeSaludDe: 0.
	
	unHorror atacaA_: unGuerrero.
	
	unGuerrero saludActual! !

!TestMazmorra methodsFor: 'as yet unclassified' stamp: 'naa 11/1/2024 15:58:52'!
test008_mostrarHeroesAbatidos
	"nace heroe"
	unGuerrero iniciarConUnaCantidadDePoderDe: 50.
	"lo reclutan"
	heroesEscuadron reclutarHeroe: unGuerrero.
	"queda abatido"
	unHorror atacaA_: unHechicero.
	unHorror atacaA_: unGuerrero.
	unGuerrero saludActual.
	"agregamos un segundo caso"
	heroesEscuadron reclutarHeroe: unHechicero.
	
	abatidos := heroesEscuadron losHeroesAbatidos.
	"acertamos que está abatido"
	Assert isTrue: (abatidos includes: unGuerrero)! !

!TestMazmorra methodsFor: 'as yet unclassified' stamp: 'naa 11/1/2024 16:52:40'!
test009_mostrarUltimaEsperanza
|ultimaEsperanza | "arreglarrrr"
	"nace heroe"
	unHechicero iniciarConUnaCantidadDePoderDe: 50.
	heroesEscuadron reclutarHeroe: unHechicero.
	
	Assert isTrue:  (heroesEscuadron heroesTienenUltimaEsperanza).
	ultimaEsperanza := (heroesEscuadron losHeroesListosParaLaAccion) first.
	! !

!TestMazmorra methodsFor: 'as yet unclassified' stamp: 'naa 11/1/2024 16:56:27'!
test010_Combatir
|primerHeroe primeraAberracion | "arreglarrrr"
	primerHeroe := (heroesEscuadron losHeroesListosParaLaAccion) first.
	
	primeraAberracion := (aberracionesEscuadron lasAberracionesListasParaLaAccion) first.
	
	primeraAberracion atacaA_: primerHeroe.
	
	primerHeroe atacaA_: primeraAberracion.
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TestMazmorra class' category: #mazmorraOscura!
TestMazmorra class
	instanceVariableNames: 'abatidos unMuertoViviente unHechicero heroesEscuadron heroes unGuerrero aberracionesEscuadron unHorror unCultista ultimaEsperanza'!

!TestMazmorra class methodsFor: '--** private fileout/in **--' stamp: 'naa 11/1/2024 16:56:55'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	abatidos := ((Set new) add: (Guerrero basicNew instVarAt: 1 put: 0; instVarAt: 2 put: 50; yourself); add: (Hechicero basicNew instVarAt: 1 put: 0; instVarAt: 2 put: 30; yourself); yourself).
	unMuertoViviente := (MuertoViviente basicNew instVarAt: 1 put: 50; instVarAt: 2 put: 25; yourself).
	unHechicero := (Hechicero basicNew instVarAt: 1 put: 0; instVarAt: 2 put: 30; yourself).
	heroesEscuadron := (Escuadron basicNew instVarAt: 1 put: ((Set new) add: (Guerrero basicNew instVarAt: 1 put: 0; instVarAt: 2 put: 50; yourself); add: (Hechicero basicNew instVarAt: 1 put: 0; instVarAt: 2 put: 30; yourself); yourself); instVarAt: 2 put: nil; instVarAt: 3 put: nil; yourself).
	heroes := nil.
	unGuerrero := (Guerrero basicNew instVarAt: 1 put: 0; instVarAt: 2 put: 50; yourself).
	aberracionesEscuadron := (Escuadron basicNew instVarAt: 1 put: nil; instVarAt: 2 put: ((Set new) add: (MuertoViviente basicNew instVarAt: 1 put: 50; instVarAt: 2 put: 25; yourself); add: (Horror basicNew instVarAt: 1 put: 3; instVarAt: 2 put: 25; yourself); add: (Cultista basicNew instVarAt: 1 put: 30; instVarAt: 2 put: 25; yourself); yourself); instVarAt: 3 put: nil; yourself).
	unHorror := (Horror basicNew instVarAt: 1 put: 3; instVarAt: 2 put: 25; yourself).
	unCultista := (Cultista basicNew instVarAt: 1 put: 30; instVarAt: 2 put: 25; yourself).
	ultimaEsperanza := nil.! !

Escuadron initializeAfterFileIn!
TestMazmorra initializeAfterFileIn!