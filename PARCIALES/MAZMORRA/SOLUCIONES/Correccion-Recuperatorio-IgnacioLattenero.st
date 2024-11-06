!classDefinition: #MazmorraOscuraTest category: 'Correccion-Recuperatorio-IgnacioLattenero'!
TestCase subclass: #MazmorraOscuraTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Correccion-Recuperatorio-IgnacioLattenero'!

!MazmorraOscuraTest methodsFor: 'as yet unclassified' stamp: 'IFL 6/28/2023 14:21:38'!
test01_una_mazmorra_inicialmente_comienza_sin_heroes

	| unaMazmorra |
	unaMazmorra := Mazmorra new.

	Assert that: unaMazmorra cantidadDeHeroes isEqualTo: 0.  ! !

!MazmorraOscuraTest methodsFor: 'as yet unclassified' stamp: 'IFL 6/28/2023 14:24:23'!
test02_una_mazmorra_inicialmente_comienza_sin_aberraciones

	| unaMazmorra |
	unaMazmorra := Mazmorra new.

	Assert that: unaMazmorra cantidadDeAberraciones isEqualTo: 0.  ! !

!MazmorraOscuraTest methodsFor: 'as yet unclassified' stamp: 'IFL 6/28/2023 14:45:57'!
test03_una_mazmorra_recluta_un_nuevo_heroe_a_su_escuadron_de_heroes

	| unaMazmorra unHeroe |
	unaMazmorra := Mazmorra new.
	unHeroe := Heroe poderDeAtaque: 200.
	
	unaMazmorra reclutaAUnHeroe: unHeroe.

	Assert that: unaMazmorra cantidadDeHeroes isEqualTo: 1.  ! !

!MazmorraOscuraTest methodsFor: 'as yet unclassified' stamp: 'IFL 6/28/2023 14:42:52'!
test04_una_mazmorra_recluta_una_nueva_aberracion_a_su_escuadron_de_aberraciones

	| unaMazmorra unAberracion |
	unaMazmorra := Mazmorra new.
	unAberracion := Aberracion puntosDeVida: 100.
	
	unaMazmorra reclutaAUnaAberracion: unAberracion.

	Assert that: unaMazmorra cantidadDeAberraciones isEqualTo: 1.  ! !

!MazmorraOscuraTest methodsFor: 'as yet unclassified' stamp: 'IFL 6/28/2023 14:56:04'!
test05_una_aberracion_tiene_un_poder_de_ataque_fijo_de_25_puntos

	| unaAberracion |
	unaAberracion := Aberracion puntosDeVida: 100.

	Assert that: unaAberracion puntosDePoderDeAtaqueFijos isEqualTo: 25.  ! !

!MazmorraOscuraTest methodsFor: 'as yet unclassified' stamp: 'IFL 6/28/2023 14:58:44'!
test06_un_heroe_tiene_una_vida_inicial_de_100_puntos

	| unHeroe |
	unHeroe := Heroe poderDeAtaque: 200.

	Assert that: unHeroe puntosDeVidaInicial isEqualTo: 100.  ! !

!MazmorraOscuraTest methodsFor: 'as yet unclassified' stamp: 'IFL 6/28/2023 15:06:13'!
test07_un_heroe_guerrero_tiene_una_vida_inicial_de_100_puntos

	| unGuerrero |
	unGuerrero := Guerrero poderDeAtaque: 200.

	Assert that: unGuerrero puntosDeVidaInicial isEqualTo: 100.  ! !

!MazmorraOscuraTest methodsFor: 'as yet unclassified' stamp: 'IFL 6/28/2023 15:08:11'!
test08_un_heroe_hechizero_tiene_una_vida_inicial_de_100_puntos

	| unHechizero |
	unHechizero := Hechizero poderDeAtaque: 300.

	Assert that: unHechizero puntosDeVidaInicial isEqualTo: 100.  ! !

!MazmorraOscuraTest methodsFor: 'as yet unclassified' stamp: 'IFL 6/28/2023 15:13:55'!
test09_una_aberracion_criminal_tiene_un_poder_de_ataque_fijo_de_25_puntos

	| unCriminal |
	unCriminal := Criminal puntosDeVida: 100.

	Assert that: unCriminal puntosDePoderDeAtaqueFijos isEqualTo: 25.  ! !

!MazmorraOscuraTest methodsFor: 'as yet unclassified' stamp: 'IFL 6/28/2023 15:15:18'!
test10_una_aberracion_horror_tiene_un_poder_de_ataque_fijo_de_25_puntos

	| unHorror |
	unHorror := Horror puntosDeVida: 100.

	Assert that: unHorror puntosDePoderDeAtaqueFijos isEqualTo: 25.  ! !

!MazmorraOscuraTest methodsFor: 'as yet unclassified' stamp: 'IFL 6/28/2023 15:16:29'!
test11_una_aberracion_muerto_vivo_tiene_un_poder_de_ataque_fijo_de_25_puntos

	| unMuertoVivo |
	unMuertoVivo := MuertoVivo puntosDeVida: 100.

	Assert that: unMuertoVivo puntosDePoderDeAtaqueFijos isEqualTo: 25.  ! !

!MazmorraOscuraTest methodsFor: 'as yet unclassified' stamp: 'IFL 6/28/2023 16:22:53'!
test12_una_aberracion_culturista_tiene_un_poder_de_ataque_fijo_de_25_puntos

	| unCulturista |
	unCulturista := Cultista puntosDeVida: 100.

	Assert that: unCulturista puntosDePoderDeAtaqueFijos isEqualTo: 25.  ! !

!MazmorraOscuraTest methodsFor: 'as yet unclassified' stamp: 'IFL 6/28/2023 15:24:32'!
test13_una_mazmorra_no_puede_registrar_a_un_mismo_heroe_dos_veces

	| unaMazmorra unHeroe |
	unaMazmorra := Mazmorra new.
	unHeroe := Heroe poderDeAtaque: 200.
	
	unaMazmorra reclutaAUnHeroe: unHeroe.

	Assert should: [unaMazmorra reclutaAUnHeroe: unHeroe.] 
	            signal: Error  
		    withDescription: 'No se puede registrar a este heroe, ya existe en el escuadron'. ! !

!MazmorraOscuraTest methodsFor: 'as yet unclassified' stamp: 'IFL 6/28/2023 16:22:53'!
test14_una_mazmorra_no_puede_registrar_a_una_misma_aberracion_dos_veces

	| unaMazmorra unAberracion |
	unaMazmorra := Mazmorra new.
	unAberracion := Cultista puntosDeVida: 100.
	
	unaMazmorra reclutaAUnaAberracion: unAberracion.

	Assert should: [unaMazmorra reclutaAUnaAberracion: unAberracion.] 
	            signal: Error  
		    withDescription: 'No se puede registrar a esta aberracion, ya existe en el escuadron'. ! !

!MazmorraOscuraTest methodsFor: 'as yet unclassified' stamp: 'IFL 6/28/2023 15:40:52'!
test15_una_mazmorra_no_puede_registrar_a_un_heroe_en_un_escuadron_de_aberraciones

	| unaMazmorra unHeroe |
	unaMazmorra := Mazmorra new.
	unHeroe := Guerrero poderDeAtaque: 200.

	Assert should: [unaMazmorra reclutaAUnaAberracion: unHeroe.] 
	            signal: Error  
		    withDescription: 'No se puede reclutar a un heroe en un escuadron de aberraciones'. ! !

!MazmorraOscuraTest methodsFor: 'as yet unclassified' stamp: 'IFL 6/28/2023 15:42:31'!
test16_una_mazmorra_no_puede_registrar_a_una_aberracion_en_un_escuadron_de_heroes

	| unaMazmorra unaAberracion |
	unaMazmorra := Mazmorra new.
	unaAberracion := Criminal puntosDeVida: 100.

	Assert should: [unaMazmorra reclutaAUnHeroe: unaAberracion.] 
	            signal: Error  
		    withDescription: 'No se puede reclutar a una aberracion en un escuadron de heroes'. ! !

!MazmorraOscuraTest methodsFor: 'as yet unclassified' stamp: 'IFL 6/28/2023 15:54:19'!
test17_un_personaje_indica_si_esta_abatido

	| unaAberracion unHeroe |
	unaAberracion := Criminal puntosDeVida: 100.
	unHeroe := Hechizero poderDeAtaque: 300.

	Assert isFalse: unaAberracion estaAbatido.
	Assert isFalse: unHeroe estaAbatido.! !

!MazmorraOscuraTest methodsFor: 'as yet unclassified' stamp: 'IFL 6/28/2023 16:36:06'!
test18_un_personaje_puede_realizar_un_ataque_a_un_oponente

	| unaMazmorra unCriminal unHechizero |
	unaMazmorra := Mazmorra new.
	unCriminal := Criminal puntosDeVida: 100.
	unHechizero := Hechizero poderDeAtaque: 100.
	
	unaMazmorra reclutaAUnHeroe: unHechizero.
	unaMazmorra reclutaAUnaAberracion: unCriminal.
	
	unHechizero atacaA: unCriminal. 
	
	Assert that: unCriminal vidasRestantesDespuesDelAtaque isEqualTo: 0.
	Assert isTrue: unCriminal estaAbatido.! !

!MazmorraOscuraTest methodsFor: 'as yet unclassified' stamp: 'IFL 6/28/2023 16:48:41'!
test19_un_heroe_guerrero_ataca_a_una_aberracion_horror

	| unaMazmorra unGuerrero unHorror |
	unaMazmorra := Mazmorra new.
	unHorror := Horror puntosDeVida: 100.
	unGuerrero := Guerrero poderDeAtaque: 100.
	
	unaMazmorra reclutaAUnHeroe: unGuerrero.
	unaMazmorra reclutaAUnaAberracion: unHorror.
	
	unGuerrero atacaA: unHorror. 
	
	Assert that: unHorror vidasRestantesDespuesDelAtaque isEqualTo: 50.
	Assert isFalse: unHorror estaAbatido.! !

!MazmorraOscuraTest methodsFor: 'as yet unclassified' stamp: 'IFL 6/28/2023 16:51:38'!
test20_un_heroe_guerrero_ataca_a_una_aberracion_muerto_viviente

	| unaMazmorra unGuerrero unMuertoVivo |
	unaMazmorra := Mazmorra new.
	unMuertoVivo := MuertoVivo puntosDeVida: 100.
	unGuerrero := Guerrero poderDeAtaque: 100.
	
	unaMazmorra reclutaAUnHeroe: unGuerrero.
	unaMazmorra reclutaAUnaAberracion: unMuertoVivo.
	
	unGuerrero atacaA: unMuertoVivo. 
	
	Assert that: unMuertoVivo vidasRestantesDespuesDelAtaque isEqualTo: 25.
	Assert isFalse: unMuertoVivo estaAbatido.! !

!MazmorraOscuraTest methodsFor: 'as yet unclassified' stamp: 'IFL 6/28/2023 16:57:30'!
test21_un_heroe_hechizero_ataca_a_una_aberracion_muerto_viviente

	| unaMazmorra unMuertoVivo unHechizero |
	unaMazmorra := Mazmorra new.
	unMuertoVivo := MuertoVivo puntosDeVida: 150.
	unHechizero := Hechizero poderDeAtaque: 100.
	
	unaMazmorra reclutaAUnHeroe: unHechizero.
	unaMazmorra reclutaAUnaAberracion: unMuertoVivo.
	
	unHechizero atacaA: unMuertoVivo. 
	
	Assert that: unMuertoVivo vidasRestantesDespuesDelAtaque isEqualTo: 0.
	Assert isTrue: unMuertoVivo estaAbatido.! !

!MazmorraOscuraTest methodsFor: 'as yet unclassified' stamp: 'IFL 6/28/2023 17:27:22'!
test22_un_heroe_hechizero_ataca_a_una_aberracion_cultista

	| unaMazmorra unHechizero unCultista |
	unaMazmorra := Mazmorra new.
	unCultista := Cultista puntosDeVida: 100.
	unHechizero := Hechizero poderDeAtaque: 100.
	
	unaMazmorra reclutaAUnHeroe: unHechizero.
	unaMazmorra reclutaAUnaAberracion: unCultista.
	
	unHechizero atacaA: unCultista. 
	
	Assert that: unCultista vidasRestantesDespuesDelAtaque isEqualTo: 25.
	Assert isFalse: unCultista estaAbatido.! !

!MazmorraOscuraTest methodsFor: 'as yet unclassified' stamp: 'IFL 6/28/2023 17:28:38'!
test23_un_heroe_guerrero_ataca_a_una_aberracion_cultista

	| unaMazmorra unCultista unGuerrero |
	unaMazmorra := Mazmorra new.
	unCultista := Cultista puntosDeVida: 150.
	unGuerrero := Guerrero poderDeAtaque: 100.
	
	unaMazmorra reclutaAUnHeroe: unGuerrero.
	unaMazmorra reclutaAUnaAberracion: unCultista.
	
	unGuerrero atacaA: unCultista. 
	
	Assert that: unCultista vidasRestantesDespuesDelAtaque isEqualTo: 0.
	Assert isTrue: unCultista estaAbatido.! !

!MazmorraOscuraTest methodsFor: 'as yet unclassified' stamp: 'IFL 6/28/2023 17:39:21'!
test24_una_aberracion_horror_ataca_a_un_heroe_guerrero

	| unaMazmorra unGuerrero unHorror |
	unaMazmorra := Mazmorra new.
	unHorror := Horror puntosDeVida: 100.
	unGuerrero := Guerrero poderDeAtaque: 100.
	
	unaMazmorra reclutaAUnHeroe: unGuerrero.
	unaMazmorra reclutaAUnaAberracion: unHorror.
	
	unHorror atacaA: unGuerrero. 
	
	Assert that: unGuerrero vidasRestantesDespuesDelAtaque isEqualTo: 50.
	Assert isFalse: unGuerrero estaAbatido.! !

!MazmorraOscuraTest methodsFor: 'as yet unclassified' stamp: 'IFL 6/28/2023 17:50:56'!
test25_las_aberraciones_cultistas_criminales_y_muertos_vivientes_ataca_a_cualquier_heroe_siempre_con_su_daño_fijo

	| unaMazmorra unGuerrero unCultista unMuertoVivo unCriminal |
	unaMazmorra := Mazmorra new.
	unCriminal := Criminal puntosDeVida: 100.
	unCultista := Cultista puntosDeVida: 150.
	unMuertoVivo := MuertoVivo puntosDeVida: 150.
	unGuerrero := Guerrero poderDeAtaque: 100.
	
	unaMazmorra reclutaAUnHeroe: unGuerrero.
	unaMazmorra reclutaAUnaAberracion: unCriminal.
	unaMazmorra reclutaAUnaAberracion: unCultista.
	unaMazmorra reclutaAUnaAberracion: unMuertoVivo.
	
	unCriminal atacaA: unGuerrero. 
	unCultista atacaA: unGuerrero. 
	unMuertoVivo atacaA: unGuerrero. 
	
	Assert that: unGuerrero vidasRestantesDespuesDelAtaque isEqualTo: 25.
	Assert isFalse: unGuerrero estaAbatido.! !


!classDefinition: #Aberracion category: 'Correccion-Recuperatorio-IgnacioLattenero'!
Object subclass: #Aberracion
	instanceVariableNames: 'puntosDeVida puntosDeAtaqueAberracion'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Correccion-Recuperatorio-IgnacioLattenero'!

!Aberracion methodsFor: 'initialization' stamp: 'IFL 6/28/2023 14:57:03'!
initializePuntosDeVida: unosPuntosDeVida 
	
	puntosDeVida := unosPuntosDeVida.
	puntosDeAtaqueAberracion := 25.! !


!Aberracion methodsFor: 'accessing' stamp: 'IFL 6/28/2023 14:56:41'!
puntosDePoderDeAtaqueFijos
	^ puntosDeAtaqueAberracion.! !


!Aberracion methodsFor: 'testing' stamp: 'IFL 6/28/2023 15:40:07'!
esUnHeroe
	^ false.! !

!Aberracion methodsFor: 'testing' stamp: 'IFL 6/28/2023 15:45:55'!
esUnaAberracion
	^ true.! !

!Aberracion methodsFor: 'testing' stamp: 'IFL 6/28/2023 15:53:34'!
estaAbatido
	^ puntosDeVida = 0.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Aberracion class' category: 'Correccion-Recuperatorio-IgnacioLattenero'!
Aberracion class
	instanceVariableNames: ''!

!Aberracion class methodsFor: 'instance creation' stamp: 'IFL 6/28/2023 14:43:40'!
puntosDeVida: unosPuntosDeVida 
	
	^self new initializePuntosDeVida: unosPuntosDeVida. ! !


!classDefinition: #Criminal category: 'Correccion-Recuperatorio-IgnacioLattenero'!
Aberracion subclass: #Criminal
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Correccion-Recuperatorio-IgnacioLattenero'!

!Criminal methodsFor: 'action' stamp: 'IFL 6/28/2023 17:46:15'!
atacaA: unHeroe 
	unHeroe esAtacadoPor: self.! !


!Criminal methodsFor: 'accessing' stamp: 'IFL 6/28/2023 17:13:42'!
esAtacadoPor: unHeroe 
	puntosDeVida := puntosDeVida - (unHeroe poderDeAtaque).! !

!Criminal methodsFor: 'accessing' stamp: 'IFL 6/28/2023 17:47:39'!
poderDeAtaque
	^ puntosDeAtaqueAberracion.! !

!Criminal methodsFor: 'accessing' stamp: 'IFL 6/28/2023 16:38:05'!
vidasRestantesDespuesDelAtaque
	^ puntosDeVida.! !


!classDefinition: #Cultista category: 'Correccion-Recuperatorio-IgnacioLattenero'!
Aberracion subclass: #Cultista
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Correccion-Recuperatorio-IgnacioLattenero'!

!Cultista methodsFor: 'action' stamp: 'IFL 6/28/2023 17:48:27'!
atacaA: unHeroe 
	unHeroe esAtacadoPor: self.! !

!Cultista methodsFor: 'action' stamp: 'IFL 6/28/2023 17:26:01'!
esAtacadoPor: unHeroe 
	puntosDeVida := puntosDeVida - (unHeroe poderDeAtaqueParaUnCultista).! !


!Cultista methodsFor: 'accessing' stamp: 'IFL 6/28/2023 17:48:53'!
poderDeAtaque
	^ puntosDeAtaqueAberracion.! !

!Cultista methodsFor: 'accessing' stamp: 'IFL 6/28/2023 17:27:10'!
vidasRestantesDespuesDelAtaque
	^ puntosDeVida.! !


!classDefinition: #Horror category: 'Correccion-Recuperatorio-IgnacioLattenero'!
Aberracion subclass: #Horror
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Correccion-Recuperatorio-IgnacioLattenero'!

!Horror methodsFor: 'action' stamp: 'IFL 6/28/2023 18:03:51'!
atacaA: unHeroe 
	unHeroe esAtacadoPorUnHorror: self poderDeAtaqueParaLosHeroes.! !


!Horror methodsFor: 'accessing' stamp: 'IFL 6/28/2023 17:14:57'!
esAtacadoPor: unHeroe 
	puntosDeVida := puntosDeVida - (unHeroe poderDeAtaque / 2).! !

!Horror methodsFor: 'accessing' stamp: 'IFL 6/28/2023 18:01:31'!
poderDeAtaqueParaLosHeroes
	^ puntosDeAtaqueAberracion * 2.! !

!Horror methodsFor: 'accessing' stamp: 'IFL 6/28/2023 16:46:27'!
vidasRestantesDespuesDelAtaque
	^ puntosDeVida.! !


!classDefinition: #MuertoVivo category: 'Correccion-Recuperatorio-IgnacioLattenero'!
Aberracion subclass: #MuertoVivo
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Correccion-Recuperatorio-IgnacioLattenero'!

!MuertoVivo methodsFor: 'action' stamp: 'IFL 6/28/2023 17:49:26'!
atacaA: unHeroe 
	unHeroe esAtacadoPor: self.! !

!MuertoVivo methodsFor: 'action' stamp: 'IFL 6/28/2023 17:18:26'!
esAtacadoPor: unHeroe 
	puntosDeVida := puntosDeVida - ((unHeroe poderDeAtaqueParaUnMuertoVivo) asInteger).! !


!MuertoVivo methodsFor: 'accessing' stamp: 'IFL 6/28/2023 17:49:47'!
poderDeAtaque
	^ puntosDeAtaqueAberracion.! !

!MuertoVivo methodsFor: 'accessing' stamp: 'IFL 6/28/2023 16:53:45'!
vidasRestantesDespuesDelAtaque
	^ puntosDeVida.! !


!classDefinition: #Correccion category: 'Correccion-Recuperatorio-IgnacioLattenero'!
Object subclass: #Correccion
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Correccion-Recuperatorio-IgnacioLattenero'!

!Correccion methodsFor: 'as yet unclassified' stamp: 'GET 7/1/2023 14:55:13'!
readMe

	"
	La parte de Jerarquias:
		Te faltó definir en algunos casos mensajes en la clase abstracta Personaje como #atacaA: para definir comportamiento que el resto tiene.
		De hecho... una clase Personaje hubiera venido muyu bien para definir el comportamiento general y los colaboradores internos como salud y poder de ataque por ejemplo.
		poderDeAtaque está definido muchisimas veces cuando lo podías dejar definido en la clase abstracta.
		
	Los nombres de los colaboradores internos tenes que pulirlos.
	puntosDeAtaqueDeAberracion es innecesario cuando el objeto mismo es la aberracion.
	
	Double Dispatch, en sí está definido, aunque la idea era delegar en el defensor, el que ataca no necesita por que saber como hacer el calculo, de todas maneras es solo un comentario. Lo que sí, el ataque de la aberración Horror si hubieras definido poder de ataque como lo mismo pero multiplicado por 2 (usando super se hacia facilmente) no tenías que definir un comportamiento extra.
	
	Con respecto a colecciones, lamentablemente solo está el comportamiento base, crear colecciones y contar y no mucho mas. El comportamiento y manejo real no está.
	Excepciones hay manejo eso es bueno.
	
	
	"! !


!classDefinition: #Heroe category: 'Correccion-Recuperatorio-IgnacioLattenero'!
Object subclass: #Heroe
	instanceVariableNames: 'poderAtaque puntosDeVida'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Correccion-Recuperatorio-IgnacioLattenero'!

!Heroe methodsFor: 'initialization' stamp: 'IFL 6/28/2023 14:59:43'!
initializePoderDeAtaque: poderDeAtaque 
	
	poderAtaque := poderDeAtaque.
	puntosDeVida := 100.! !


!Heroe methodsFor: 'accessing' stamp: 'IFL 6/28/2023 18:05:41'!
esAtacadoPor: unaAberracion 
	puntosDeVida := puntosDeVida - (unaAberracion poderDeAtaque).! !

!Heroe methodsFor: 'accessing' stamp: 'IFL 6/28/2023 14:59:22'!
puntosDeVidaInicial
	^ puntosDeVida.! !


!Heroe methodsFor: 'testing' stamp: 'IFL 6/28/2023 15:39:22'!
esUnHeroe
	^ true.! !

!Heroe methodsFor: 'testing' stamp: 'IFL 6/28/2023 15:47:52'!
esUnaAberracion
	^ false.! !

!Heroe methodsFor: 'testing' stamp: 'IFL 6/28/2023 15:54:09'!
estaAbatido
	^ puntosDeVida = 0.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Heroe class' category: 'Correccion-Recuperatorio-IgnacioLattenero'!
Heroe class
	instanceVariableNames: ''!

!Heroe class methodsFor: 'instance creation' stamp: 'IFL 6/28/2023 14:47:31'!
poderDeAtaque: poderDeAtaque 
	
	^self new initializePoderDeAtaque: poderDeAtaque. ! !

!Heroe class methodsFor: 'instance creation' stamp: 'IFL 6/28/2023 14:38:02'!
puntosDeVida: unosPuntos poderDeAtaque: unPoderDeAtaque 
	
	^self new initializePuntosDeVida: unosPuntos poderDeAtaque: unPoderDeAtaque. ! !


!classDefinition: #Guerrero category: 'Correccion-Recuperatorio-IgnacioLattenero'!
Heroe subclass: #Guerrero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Correccion-Recuperatorio-IgnacioLattenero'!

!Guerrero methodsFor: 'action' stamp: 'IFL 6/28/2023 17:06:44'!
atacaA: unaAberracion 
	unaAberracion esAtacadoPor: self.! !

!Guerrero methodsFor: 'action' stamp: 'IFL 6/28/2023 18:04:41'!
esAtacadoPorUnHorror: unPoderDeAtaqueDeUnHorror 
	puntosDeVida := puntosDeVida - unPoderDeAtaqueDeUnHorror.! !


!Guerrero methodsFor: 'accessing' stamp: 'IFL 6/28/2023 17:08:51'!
poderDeAtaque
	^ poderAtaque.! !

!Guerrero methodsFor: 'accessing' stamp: 'IFL 6/28/2023 17:29:25'!
poderDeAtaqueParaUnCultista
	^ (poderAtaque * 1.5) asInteger.! !

!Guerrero methodsFor: 'accessing' stamp: 'IFL 6/28/2023 17:19:20'!
poderDeAtaqueParaUnMuertoVivo
	^ (poderAtaque * 0.75) asInteger.! !

!Guerrero methodsFor: 'accessing' stamp: 'IFL 6/28/2023 17:37:51'!
vidasRestantesDespuesDelAtaque
	^ puntosDeVida.! !


!classDefinition: #Hechizero category: 'Correccion-Recuperatorio-IgnacioLattenero'!
Heroe subclass: #Hechizero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Correccion-Recuperatorio-IgnacioLattenero'!

!Hechizero methodsFor: 'action' stamp: 'IFL 6/28/2023 17:12:43'!
atacaA: unaAberracion 
	unaAberracion esAtacadoPor: self.! !


!Hechizero methodsFor: 'accessing' stamp: 'IFL 6/28/2023 16:30:26'!
poderDeAtaque
	^ poderAtaque.! !

!Hechizero methodsFor: 'accessing' stamp: 'IFL 6/28/2023 17:26:42'!
poderDeAtaqueParaUnCultista
	^ (poderAtaque * 0.75) asInteger.! !

!Hechizero methodsFor: 'accessing' stamp: 'IFL 6/28/2023 17:20:18'!
poderDeAtaqueParaUnMuertoVivo
	^ (poderAtaque * 1.5) asInteger.! !

!Hechizero methodsFor: 'accessing' stamp: 'IFL 6/28/2023 17:39:06'!
vidasRestantesDespuesDelAtaque
	^ puntosDeVida.! !


!classDefinition: #Mazmorra category: 'Correccion-Recuperatorio-IgnacioLattenero'!
Object subclass: #Mazmorra
	instanceVariableNames: 'escuadronDeHeroes escuadronDeAberraciones'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Correccion-Recuperatorio-IgnacioLattenero'!

!Mazmorra methodsFor: 'accessing' stamp: 'IFL 6/28/2023 14:28:24'!
cantidadDeAberraciones
	^ (escuadronDeAberraciones) size.! !

!Mazmorra methodsFor: 'accessing' stamp: 'IFL 6/28/2023 14:28:06'!
cantidadDeHeroes
	^ (escuadronDeHeroes) size.! !


!Mazmorra methodsFor: 'as yet unclassified' stamp: 'IFL 6/28/2023 14:28:24'!
initialize

	escuadronDeHeroes := OrderedCollection new.
	escuadronDeAberraciones := OrderedCollection new.! !


!Mazmorra methodsFor: 'action' stamp: 'IFL 6/28/2023 15:46:30'!
reclutaAUnHeroe: unHeroe 

	(unHeroe esUnaAberracion) ifTrue: [self error: 'No se puede reclutar a una aberracion en un escuadron de heroes'].
	(escuadronDeHeroes includes: unHeroe) ifTrue: [self error: 'No se puede registrar a este heroe, ya existe en el escuadron']. 
	escuadronDeHeroes add: unHeroe.! !

!Mazmorra methodsFor: 'action' stamp: 'IFL 6/28/2023 15:38:33'!
reclutaAUnaAberracion: unaAberracion 
	
	(unaAberracion esUnHeroe) ifTrue: [self error: 'No se puede reclutar a un heroe en un escuadron de aberraciones'].
	(escuadronDeAberraciones includes: unaAberracion) ifTrue: [self error: 'No se puede registrar a esta aberracion, ya existe en el escuadron'].
	
	escuadronDeAberraciones add: unaAberracion.! !
