!classDefinition: #LaMasmorraMasOscuraTest category: 'Recuperatorio-LautaroGalvezMonge'!
TestCase subclass: #LaMasmorraMasOscuraTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Recuperatorio-LautaroGalvezMonge'!

!LaMasmorraMasOscuraTest methodsFor: 'escuadron' stamp: 'LGm 6/28/2023 17:29:01'!
test06_un_escuadron_empieza_sin_miembros

	|unEscuadron|
	unEscuadron := Escuadron new. 
	
	Assert isTrue: unEscuadron sinMiembros.
	Assert that: unEscuadron cantidadDeMiembros isEqualTo: 0
	
	! !

!LaMasmorraMasOscuraTest methodsFor: 'escuadron' stamp: 'LGm 6/28/2023 17:29:06'!
test07_un_escuadron_puede_reclutar_un_miembro

	|unEscuadron unHeroe|
	unEscuadron := Escuadron new. 
	unHeroe := Heroe conDano: 50.
	
	unEscuadron reclutarA: unHeroe.
	
	Assert isFalse: unEscuadron sinMiembros.
	Assert that: unEscuadron cantidadDeMiembros isEqualTo: 1
	
	! !

!LaMasmorraMasOscuraTest methodsFor: 'escuadron' stamp: 'LGm 6/28/2023 17:29:10'!
test08_un_escuadron_no_puede_reclutar_un_mismo_miembro_dos_veces

	|unEscuadron unHeroe|
	unEscuadron := Escuadron new. 
	unHeroe := Heroe conDano: 50.
	
	unEscuadron reclutarA: unHeroe.
	
	Assert should: [unEscuadron reclutarA: unHeroe.] signal: Error withDescription: 'miembro ya reclutado'
	
	! !

!LaMasmorraMasOscuraTest methodsFor: 'escuadron' stamp: 'LGm 6/28/2023 17:29:53'!
test12_un_escuadron_sabe_cuantos_personajes_abatidos_tiene

	|unHeroe unaAberracion unEscuadron otraAberracion unCriminal|
	unEscuadron := Escuadron new. 
	unHeroe := Heroe conDano: 50.
	unaAberracion := Aberracion conVida: 50.
	otraAberracion := Aberracion conVida: 50.
	unCriminal := Criminal conVida: 150.
	
	unEscuadron reclutarA: unaAberracion.
	unEscuadron reclutarA: otraAberracion.
	unEscuadron reclutarA: unCriminal.
	
	unHeroe atacaA: unaAberracion unaCantidadDeVeces: 1.
	
	Assert that: unEscuadron cantidadDeMiembros isEqualTo: 3.
	Assert that: unEscuadron cantidadDeMiembrosAbatidos isEqualTo: 1.
	Assert that: unEscuadron miembrosAbatidos isEqualTo: (OrderedCollection with:unaAberracion).
	
	
	! !

!LaMasmorraMasOscuraTest methodsFor: 'escuadron' stamp: 'LGm 6/28/2023 17:29:56'!
test13_un_escuadron_sabe_la_suma_del_poder_de_ataque_de_todos_sus_personajes_no_abatidos

	|unHeroe unaAberracion unEscuadron otraAberracion unCriminal poderDeAtaqueEsperado|
	unEscuadron := Escuadron new. 
	unHeroe := Heroe conDano: 50.
	unaAberracion := Aberracion conVida: 50.
	otraAberracion := Aberracion conVida: 50.
	unCriminal := Criminal conVida: 150.
	poderDeAtaqueEsperado := (otraAberracion dano + unCriminal dano).
	
	unEscuadron reclutarA: unaAberracion.
	unEscuadron reclutarA: otraAberracion.
	unEscuadron reclutarA: unCriminal.
	
	unHeroe atacaA: unaAberracion unaCantidadDeVeces: 1.
	
	Assert that: unEscuadron cantidadDeMiembros isEqualTo: 3.
	Assert that: unEscuadron cantidadDeMiembrosAbatidos isEqualTo: 1.
	Assert that: unEscuadron miembrosAbatidos isEqualTo: (OrderedCollection with:unaAberracion).
	Assert that: unEscuadron totalDePoderDeAtaqueDeSusMiembros isEqualTo: poderDeAtaqueEsperado.
	
	
	
	! !

!LaMasmorraMasOscuraTest methodsFor: 'escuadron' stamp: 'LGm 6/28/2023 17:29:59'!
test14_un_escuadron_sabe_si_tiene_a_la_ultima_esperanza
	
	"ultimaEsperanza funciona para casos en donde una" 

	|unHeroe unGuerrero unHechizero unaAberracion unEscuadron    |
	unEscuadron := Escuadron new. 
	unHeroe := Heroe conDano: 50.
	unaAberracion := Aberracion conVida: 50.
	unGuerrero := self guerrero .
	unHechizero := self hechicero .
	
	unEscuadron reclutarA: unHeroe.
	unEscuadron reclutarA: unGuerrero.
	unEscuadron reclutarA: unHechizero.
	
	unaAberracion atacaA: unHeroe unaCantidadDeVeces: 4.
	unaAberracion atacaA: unHechizero unaCantidadDeVeces: 4.
	
	Assert isTrue: (unEscuadron tieneUnaUltimaEsperanza).
	Assert that: (unEscuadron ultimaEsperanza )isEqualTo: unGuerrero
	
	
	
	! !

!LaMasmorraMasOscuraTest methodsFor: 'escuadron' stamp: 'LGm 6/28/2023 17:30:03'!
test15_un_escuadron_puede_devolver_al_primer_miembro_listo_para_la_accion_si_hay_al_menos_un_mimebro_sin_abatir

	|unHeroe unGuerrero unHechizero unEscuadron|
	unEscuadron := Escuadron new. 
	unHeroe := Heroe conDano: 50.
	unGuerrero := self guerrero .
	unHechizero := self hechicero .
	
	unEscuadron reclutarA: unHeroe.
	unEscuadron reclutarA: unGuerrero.
	unEscuadron reclutarA: unHechizero.
	
	Assert that: unEscuadron primerMiembroListoParaLaAccion isEqualTo: unHeroe
	
	
	
	! !

!LaMasmorraMasOscuraTest methodsFor: 'escuadron' stamp: 'LGm 6/28/2023 17:30:06'!
test16_un_escuadron_no_puede_devolver_al_primer_miembro_listo_para_la_accion_si_todos_los_miembros_estan_abatidos

	|unHeroe unGuerrero unHechizero unEscuadron|
	unEscuadron := Escuadron new. 
	unHeroe := Heroe conDano: 50.
	unGuerrero := self guerrero .
	unHechizero := self hechicero .
	
	
	Assert should: [unEscuadron primerMiembroListoParaLaAccion] signal: Error  withDescription: 'Todos los miembros estan abatidos'.

	
	
	
	! !

!LaMasmorraMasOscuraTest methodsFor: 'escuadron' stamp: 'LGm 6/28/2023 17:38:02'!
test19_un_escuadron_puede_atacar_a_otro_escuadron

	| unaAberracion unCriminal unEscuadron unGuerrero unHechizero otroEscuadron |
	unEscuadron := Escuadron new. 
	unaAberracion := Aberracion conVida: 200.
	unCriminal := Criminal conVida: 150.
	otroEscuadron := Escuadron new. 
	unGuerrero := self guerrero .
	unHechizero := self hechicero .
	
	otroEscuadron reclutarA: unGuerrero.
	otroEscuadron reclutarA: unHechizero.
	unEscuadron reclutarA: unaAberracion.
	unEscuadron reclutarA: unCriminal.
	
	unEscuadron atacarA: otroEscuadron .
	
	Assert that: (otroEscuadron primerMiembroListoParaLaAccion) vida  isEqualTo: 75.
	Assert that: (unEscuadron primerMiembroListoParaLaAccion) vida  isEqualTo: 100 .
	
	
	! !


!LaMasmorraMasOscuraTest methodsFor: 'personajes' stamp: 'LGm 6/28/2023 17:36:23'!
test01_un_heroe_inicia_con_100_puntos_de_salud_Y_una_cantidad_de_dano

	|unHeroe|
	unHeroe := self guerrero.
	
	Assert that: unHeroe vida isEqualTo: 100.
	Assert that: unHeroe dano isEqualTo: 100.
	
	! !

!LaMasmorraMasOscuraTest methodsFor: 'personajes' stamp: 'LGm 7/4/2023 17:20:44'!
test02_una_heroe_hechicero_hace_dano_magico

	|unHeroe|
	unHeroe := self hechicero.
	
	Assert isTrue: (unHeroe danoMagico ).
	Assert isFalse: (unHeroe danoFisico )
	
	! !

!LaMasmorraMasOscuraTest methodsFor: 'personajes' stamp: 'LGm 7/4/2023 17:20:59'!
test03_una_heroe_guerrero_hace_dano_fisico

	|unHeroe|
	unHeroe := self guerrero .
	
	Assert isTrue: (unHeroe  danoFisico).
	Assert isFalse: (unHeroe  danoMagico )
	
	! !

!LaMasmorraMasOscuraTest methodsFor: 'personajes' stamp: 'LGm 7/4/2023 16:50:32'!
test04_una_aberracion_inicia_con_una_cierta_cantidad_de_puntos_de_salud_Y_un_dano_de_25

	|unaAberracion|
	unaAberracion := Aberracion conVida: 50.
	
	Assert that: unaAberracion vida isEqualTo: 50.
	Assert that: unaAberracion dano isEqualTo: 25.
	
	! !

!LaMasmorraMasOscuraTest methodsFor: 'personajes' stamp: 'LGm 6/28/2023 17:29:33'!
test09_prima_una_aberracion_puede_atacar_a_un_heroe

	|unHeroe unaAberracion|
	unHeroe := Heroe conDano: 20.
	unaAberracion := Aberracion conVida: 50.
	
	unaAberracion atacaA: unHeroe.
	
	Assert that: unHeroe vida isEqualTo: 75
	
	
	! !

!LaMasmorraMasOscuraTest methodsFor: 'personajes' stamp: 'LGm 6/28/2023 17:29:30'!
test09_un_heroe_puede_atacar_a_una_aberracion

	|unHeroe unaAberracion|
	unHeroe := Heroe conDano: 20.
	unaAberracion := Aberracion conVida: 50.
	
	unHeroe atacaA: unaAberracion unaCantidadDeVeces: 1.
	
	Assert that: unaAberracion vida isEqualTo: 30
	
	
	! !

!LaMasmorraMasOscuraTest methodsFor: 'personajes' stamp: 'LGm 6/28/2023 17:29:38'!
test10_un_personaje_esta_abatido

	|unHeroe unaAberracion|
	unHeroe := Heroe conDano: 50.
	unaAberracion := Aberracion conVida: 50.
	
	unHeroe atacaA: unaAberracion unaCantidadDeVeces: 1.
	
	Assert isTrue: unaAberracion estaAbatido.
	
	
	! !

!LaMasmorraMasOscuraTest methodsFor: 'personajes' stamp: 'LGm 6/28/2023 17:29:49'!
test11_un_personaje_esta_abatido_no_puede_atacar

	|unHeroe unaAberracion|
	unHeroe := Heroe conDano: 50.
	unaAberracion := Aberracion conVida: 50.
	
	unHeroe atacaA: unaAberracion unaCantidadDeVeces: 1.
	
	Assert should: [unaAberracion atacaA: unHeroe .] signal: Error  withDescription: 'un personaje abatido no puede atacar'
	
	
	! !

!LaMasmorraMasOscuraTest methodsFor: 'personajes' stamp: 'LGm 6/28/2023 19:24:18'!
test17_cuando_un_heroe_ataca_a_un_horro_este_recibe_la_mitad_del_dano

	|unHeroe unaAberracion|
	unHeroe := self guerrero .
	unaAberracion := Horror conVida: 100.
	
	unHeroe atacaA: unaAberracion.
	
	Assert that: unaAberracion vida isEqualTo: 50
	
	
	! !

!LaMasmorraMasOscuraTest methodsFor: 'personajes' stamp: 'LGm 7/4/2023 16:50:26'!
test18_cuando_un_heroe_guerrero_ataca_a_un_muerto_viviente_este_recibe_la_mitad_del_dano

	|unHeroe unaAberracion|
	unHeroe := self guerrero .
	unaAberracion := MuertoViviviente conVida: 100.
	
	unHeroe atacaA: unaAberracion.
	
	Assert that: unaAberracion vida isEqualTo: 25
	
	
	! !

!LaMasmorraMasOscuraTest methodsFor: 'personajes' stamp: 'LGm 6/28/2023 17:57:39'!
test20_cuando_un_heroe_guerrero_ataca_a_un_cultista_este_recibe_el_doble_del_dano

	|unHeroe unaAberracion|
	unHeroe := self guerrero .
	unaAberracion := Cultista conVida: 100.
	
	unHeroe atacaA: unaAberracion.
	
	Assert that: unaAberracion vida isEqualTo: 0
	
	
	! !

!LaMasmorraMasOscuraTest methodsFor: 'personajes' stamp: 'LGm 6/28/2023 19:25:24'!
test21_cuando_un_heroe_hechicero_ataca_a_un_cultista_este_recibe_una_reduccion_del_dano

	|unHeroe unaAberracion|
	unHeroe := self hechicero .
	unaAberracion := Cultista conVida: 100.
	
	unHeroe atacaA: unaAberracion.
	
	Assert that: unaAberracion vida isEqualTo: 25
	
	
	! !


!LaMasmorraMasOscuraTest methodsFor: 'setUp' stamp: 'LGm 7/4/2023 17:18:55'!
guerrero

	^ Guerrero conDano: 100! !

!LaMasmorraMasOscuraTest methodsFor: 'setUp' stamp: 'LGm 7/4/2023 17:18:59'!
hechicero

	^ Hechicero conDano: 100! !


!classDefinition: #Escuadron category: 'Recuperatorio-LautaroGalvezMonge'!
Object subclass: #Escuadron
	instanceVariableNames: 'miembros'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Recuperatorio-LautaroGalvezMonge'!

!Escuadron methodsFor: 'caracteristicas' stamp: 'LGm 6/28/2023 14:45:30'!
cantidadDeMiembros
	^ miembros size! !

!Escuadron methodsFor: 'caracteristicas' stamp: 'LGm 6/28/2023 15:25:06'!
cantidadDeMiembrosAbatidos
	^ (self miembrosAbatidos)size! !

!Escuadron methodsFor: 'caracteristicas' stamp: 'LGm 6/28/2023 15:39:47'!
cantidadDeMiembrosNoAbatidos
	^ (self miembrosNoAbatidos )size! !

!Escuadron methodsFor: 'caracteristicas' stamp: 'LGm 6/28/2023 15:25:05'!
miembrosAbatidos

	^ miembros select: [:unPersonaje| unPersonaje estaAbatido ]! !

!Escuadron methodsFor: 'caracteristicas' stamp: 'LGm 6/28/2023 15:29:32'!
miembrosNoAbatidos
	^ miembros select: [:unPersonaje|unPersonaje estaAbatido not]! !

!Escuadron methodsFor: 'caracteristicas' stamp: 'LGm 6/28/2023 15:57:53'!
primerMiembroListoParaLaAccion
	(self miembrosNoAbatidos isEmpty ) ifTrue: [self error: 'Todos los miembros estan abatidos'].
	^ self miembrosNoAbatidos anyOne ! !

!Escuadron methodsFor: 'caracteristicas' stamp: 'LGm 6/28/2023 14:48:36'!
sinMiembros
	^ miembros isEmpty ! !

!Escuadron methodsFor: 'caracteristicas' stamp: 'LGm 6/28/2023 14:51:12'!
tiendeDeMiembroA: unSer 
	^ miembros includes: unSer ! !

!Escuadron methodsFor: 'caracteristicas' stamp: 'LGm 6/28/2023 15:39:27'!
tieneUnaUltimaEsperanza
	^ self cantidadDeMiembrosNoAbatidos  == 1! !

!Escuadron methodsFor: 'caracteristicas' stamp: 'LGm 6/28/2023 15:29:04'!
totalDePoderDeAtaqueDeSusMiembros
	^ self miembrosNoAbatidos sum: [:unPersonaje| unPersonaje dano].! !

!Escuadron methodsFor: 'caracteristicas' stamp: 'LGm 6/28/2023 15:53:02'!
ultimaEsperanza
	(self tieneUnaUltimaEsperanza) ifFalse: [self error: 'hay mas de un miembro sin abatir'].
	^ self miembrosNoAbatidos anyOne ! !


!Escuadron methodsFor: 'acciones' stamp: 'LGm 7/4/2023 20:59:43'!
agregaA: unPersonaje 
	(unPersonaje esHeroe) ifFalse: [self error: 'No se puede agregar aberraciones a un grupo de heroes'].
	miembros add: unPersonaje! !

!Escuadron methodsFor: 'acciones' stamp: 'LGm 6/28/2023 17:01:15'!
atacarA: otroEscuadron 
	self primerMiembroListoParaLaAccion atacaA: otroEscuadron primerMiembroListoParaLaAccion.
	otroEscuadron primerMiembroListoParaLaAccion atacaA: self primerMiembroListoParaLaAccion.! !

!Escuadron methodsFor: 'acciones' stamp: 'LGm 7/9/2023 22:24:26'!
reclutarA: unPersonaje
	(self tiendeDeMiembroA: unPersonaje ) ifTrue: [self error: 'miembro ya reclutado'].
	miembros add: unPersonaje
	! !


!Escuadron methodsFor: 'inicializacion' stamp: 'LGm 6/28/2023 16:58:43'!
initialize
	
	miembros := OrderedCollection new! !


!classDefinition: #Personaje category: 'Recuperatorio-LautaroGalvezMonge'!
Object subclass: #Personaje
	instanceVariableNames: 'dano vida tipoDeDano'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Recuperatorio-LautaroGalvezMonge'!

!Personaje methodsFor: 'acciones' stamp: 'LGm 7/4/2023 16:49:11'!
atacaA: unPersonaje
	self subclassResponsibility ! !

!Personaje methodsFor: 'acciones' stamp: 'LGm 6/28/2023 15:34:52'!
atacaA: unPersonaje unaCantidadDeVeces: tantasVeces 
	"Lo hice unicamente para probar casos particulares"
	(self estaAbatido) ifTrue: [self error: 'un personaje abatido no puede atacar'].
	unPersonaje recibeUnaCantidadDeDano: (self dano) unaCantidadDeVeces: tantasVeces.! !


!Personaje methodsFor: 'caracteristicas' stamp: 'LGm 6/28/2023 15:05:35'!
dano
	
	^dano! !

!Personaje methodsFor: 'caracteristicas' stamp: 'LGm 6/28/2023 19:10:38'!
estaAbatido
	^ vida = 0! !

!Personaje methodsFor: 'caracteristicas' stamp: 'LGm 7/4/2023 16:47:40'!
factorDeDebilidad

	^ 1.5! !

!Personaje methodsFor: 'caracteristicas' stamp: 'LGm 7/4/2023 16:47:34'!
factorDeResistencia

	^ 0.75! !

!Personaje methodsFor: 'caracteristicas' stamp: 'LGm 6/28/2023 17:39:53'!
recibeUnaCantidadDeDano: unaCantidadDeDano
 	|hp|
	hp := vida.
	vida := ((hp - unaCantidadDeDano) max:0)
	! !

!Personaje methodsFor: 'caracteristicas' stamp: 'LGm 6/28/2023 17:41:02'!
recibeUnaCantidadDeDano: unaCantidadDeDano unaCantidadDeVeces: tantasVeces 
	"mensaje hecho para probar casos particulares"
	|hp|
	hp := vida.
	vida := ((hp - (unaCantidadDeDano * tantasVeces)) max:0)! !

!Personaje methodsFor: 'caracteristicas' stamp: 'LGm 6/28/2023 15:05:41'!
vida
	
	^vida! !


!classDefinition: #Aberracion category: 'Recuperatorio-LautaroGalvezMonge'!
Personaje subclass: #Aberracion
	instanceVariableNames: 'resistente debil cantidadDeVida'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Recuperatorio-LautaroGalvezMonge'!

!Aberracion methodsFor: 'inicializacion' stamp: 'LGm 6/28/2023 16:35:24'!
initializeConVida: unaCantidadDeVida 
	
	dano := 25.
	vida := unaCantidadDeVida.! !


!Aberracion methodsFor: 'acciones' stamp: 'LGm 6/28/2023 16:35:59'!
atacaA: unPersonaje
	
	(self estaAbatido) ifTrue: [self error: 'un personaje abatido no puede atacar'].
	unPersonaje recibeUnaCantidadDeDano: self dano
	! !

!Aberracion methodsFor: 'acciones' stamp: 'LGm 7/4/2023 17:09:02'!
recibirDañoFisico: unaCantidadDeDaño
		self recibeUnaCantidadDeDano: (unaCantidadDeDaño)! !

!Aberracion methodsFor: 'acciones' stamp: 'LGm 7/4/2023 17:08:57'!
recibirDañoMagico: unaCantidadDeDaño
		self recibeUnaCantidadDeDano: (unaCantidadDeDaño)! !


"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Aberracion class' category: 'Recuperatorio-LautaroGalvezMonge'!
Aberracion class
	instanceVariableNames: ''!

!Aberracion class methodsFor: 'instance creation' stamp: 'LGm 6/28/2023 14:20:47'!
conVida: unaCantidadDeVida 
	
	^self new initializeConVida: unaCantidadDeVida ! !


!classDefinition: #Criminal category: 'Recuperatorio-LautaroGalvezMonge'!
Aberracion subclass: #Criminal
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Recuperatorio-LautaroGalvezMonge'!


!Criminal methodsFor: 'acciones' stamp: 'LGm 7/4/2023 21:03:20'!
esReclutadoPor: unEscuadron 
	unEscuadron reclutarA: self! !


!classDefinition: #Cultista category: 'Recuperatorio-LautaroGalvezMonge'!
Aberracion subclass: #Cultista
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Recuperatorio-LautaroGalvezMonge'!

!Cultista methodsFor: 'as yet unclassified' stamp: 'LGm 7/4/2023 17:17:24'!
recibirDañoFisico: unaCantidadDeDaño
		super recibirDañoFisico: (unaCantidadDeDaño * super factorDeDebilidad )! !

!Cultista methodsFor: 'as yet unclassified' stamp: 'LGm 7/4/2023 17:16:49'!
recibirDañoMagico: unaCantidadDeDaño
		super recibirDañoMagico: (unaCantidadDeDaño * super factorDeResistencia )! !


!classDefinition: #Horror category: 'Recuperatorio-LautaroGalvezMonge'!
Aberracion subclass: #Horror
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Recuperatorio-LautaroGalvezMonge'!

!Horror methodsFor: 'as yet unclassified' stamp: 'LGm 7/4/2023 17:13:26'!
atacaA: unPersonaje
	
	(self estaAbatido) ifTrue: [self error: 'un personaje abatido no puede atacar'].
	unPersonaje recibeUnaCantidadDeDano: (self dano * 2)! !

!Horror methodsFor: 'as yet unclassified' stamp: 'LGm 7/4/2023 17:07:03'!
recibeUnaCantidadDeDano: unaCantidadDeDano
	super recibeUnaCantidadDeDano: (unaCantidadDeDano / 2)! !


!classDefinition: #MuertoViviviente category: 'Recuperatorio-LautaroGalvezMonge'!
Aberracion subclass: #MuertoViviviente
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Recuperatorio-LautaroGalvezMonge'!

!MuertoViviviente methodsFor: 'as yet unclassified' stamp: 'LGm 7/4/2023 17:17:15'!
recibirDañoFisico: unaCantidadDeDaño
		super recibirDañoFisico: (unaCantidadDeDaño * super factorDeResistencia )! !

!MuertoViviviente methodsFor: 'as yet unclassified' stamp: 'LGm 7/4/2023 17:17:09'!
recibirDañoMagico: unaCantidadDeDaño
		super recibirDañoMagico: (unaCantidadDeDaño * super factorDeDebilidad )! !



!classDefinition: #Heroe category: 'Recuperatorio-LautaroGalvezMonge'!
Personaje subclass: #Heroe
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Recuperatorio-LautaroGalvezMonge'!

!Heroe methodsFor: 'inicializacion' stamp: 'LGm 6/28/2023 15:04:00'!
initializeConDano: unaCantidadDeDano 
	
	vida := 100.
	dano := unaCantidadDeDano.
	tipoDeDano := 0! !


!Heroe methodsFor: 'caracteristicas' stamp: 'LGm 6/28/2023 15:11:40'!
tipoDeDano
	^ tipoDeDano ! !


!Heroe methodsFor: 'acciones' stamp: 'LGm 7/4/2023 21:00:51'!
esReclutadoPor: unEscuadron 
	unEscuadron reclutarA: self! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Heroe class' category: 'Recuperatorio-LautaroGalvezMonge'!
Heroe class
	instanceVariableNames: ''!

!Heroe class methodsFor: 'instance creation' stamp: 'LGm 6/28/2023 14:18:13'!
conDano: aSmallInteger 

	^self new initializeConDano: aSmallInteger ! !


!classDefinition: #Guerrero category: 'Recuperatorio-LautaroGalvezMonge'!
Heroe subclass: #Guerrero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Recuperatorio-LautaroGalvezMonge'!

!Guerrero methodsFor: 'as yet unclassified' stamp: 'LGm 7/4/2023 17:19:18'!
danoFisico
	^ true! !

!Guerrero methodsFor: 'as yet unclassified' stamp: 'LGm 7/4/2023 17:19:38'!
danoMagico
	^ false! !


!Guerrero methodsFor: 'acciones' stamp: 'LGm 7/4/2023 17:10:15'!
atacaA: unPersonaje
	
	(self estaAbatido) ifTrue: [self error: 'un personaje abatido no puede atacar'].
	unPersonaje recibirDañoFisico: (self dano)
	! !


!classDefinition: #Hechicero category: 'Recuperatorio-LautaroGalvezMonge'!
Heroe subclass: #Hechicero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Recuperatorio-LautaroGalvezMonge'!

!Hechicero methodsFor: 'as yet unclassified' stamp: 'LGm 7/4/2023 17:19:56'!
danoFisico
	^ false
	! !

!Hechicero methodsFor: 'as yet unclassified' stamp: 'LGm 7/4/2023 17:19:47'!
danoMagico
	^ true! !


!Hechicero methodsFor: 'acciones' stamp: 'LGm 7/4/2023 17:10:30'!
atacaA: unPersonaje
	
	(self estaAbatido) ifTrue: [self error: 'un personaje abatido no puede atacar'].
	unPersonaje recibirDañoMagico: (self dano)
	! !
