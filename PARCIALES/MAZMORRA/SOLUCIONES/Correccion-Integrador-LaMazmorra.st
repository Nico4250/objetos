!classDefinition: #TestDeMazmorra category: 'Correccion-Integrador-LaMazmorra'!
TestCase subclass: #TestDeMazmorra
	instanceVariableNames: 'unEscuadronDeHeroes unGuerrero unHechicero unCriminal unHorror unMuertoViviente unCultista unEscuadronDeEsbirros'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Correccion-Integrador-LaMazmorra'!

!TestDeMazmorra methodsFor: 'testHeroes' stamp: 'GR 10/22/2024 23:22:14'!
test003_unHeroeComienzaCon100PuntosDeSalus

	Assert that: unGuerrero puntosDeSalud isEqualTo: 100.! !

!TestDeMazmorra methodsFor: 'testHeroes' stamp: 'GR 10/22/2024 23:22:13'!
test004_siLaSaludDeUnHeroeLlegaA0EstaAbatido.
	
	unGuerrero perderPuntosDeSalud: 100.
	
	Assert isTrue: unGuerrero estaAbatido. ! !

!TestDeMazmorra methodsFor: 'testHeroes' stamp: 'mc 10/23/2024 19:12:19'!
test007_unHeroeComienzaConPuntosDeAtaque
	
	unGuerrero inicializarConAtaque: 30.  "unGuerrero ya fue inicializado en el setup, así que volver a hacerlo acá está de más"

	Assert that: unGuerrero poderDeAtaque isEqualTo: 30.! !

!TestDeMazmorra methodsFor: 'testHeroes' stamp: 'GR 10/22/2024 23:22:14'!
test008_unGuerreroRealizaAtaquesFisicosYNoMagicos

	Assert isTrue: unGuerrero realizaAtaquesFisicos.
	Assert isFalse: unGuerrero realizaAtaquesMagicos.! !

!TestDeMazmorra methodsFor: 'testHeroes' stamp: 'GR 10/22/2024 23:22:25'!
test009_unHechiceroRealizaAtaquesMagicosYNoFisicos

	Assert isTrue: unHechicero realizaAtaquesMagicos.
	Assert isFalse: unHechicero realizaAtaquesFisicos.! !

!TestDeMazmorra methodsFor: 'testHeroes' stamp: 'GR 10/22/2024 23:22:25'!
test010_unGuerreroPuedeUtilizarCualquierArmaYUnHechiceroNo

	Assert isTrue: unGuerrero puedeUtilizarCualquierArma.
	Assert isFalse: unHechicero puedeUtilizarCualquierArma.! !

!TestDeMazmorra methodsFor: 'testHeroes' stamp: 'GR 10/22/2024 23:23:03'!
test022_unGuerreroAtacaAUnCultista
	
	unGuerrero atacarA: unCultista.
	
	Assert that: unCultista puntosDeSalud isEqualTo: 5.
	

! !

!TestDeMazmorra methodsFor: 'testHeroes' stamp: 'GR 10/22/2024 23:23:03'!
test023_unhechiceroAtacaAUnCultista
	
	unHechicero atacarA: unCultista.
	
	Assert that: unCultista puntosDeSalud isEqualTo: 27.5 .
	

! !


!TestDeMazmorra methodsFor: 'testEsbirro' stamp: 'GR 10/22/2024 23:22:34'!
test005_unEsbirroComienzaCon25PuntosDeAtaque

	Assert that: unCriminal poderDeAtaque isEqualTo: 25.! !

!TestDeMazmorra methodsFor: 'testEsbirro' stamp: 'GR 10/22/2024 23:22:34'!
test006_siLaSaludDeUnEsbirroLlegaA0EstaAbatido.
	
	unCriminal perderPuntosDeSalud: 300.
	
	Assert isTrue: unCriminal estaAbatido. ! !

!TestDeMazmorra methodsFor: 'testEsbirro' stamp: 'GR 10/22/2024 23:22:34'!
test011_unCriminalSabeQueEsEsbirroYUnGuerreroSabeQueEsHeroe
	
	Assert isTrue: unGuerrero esHeroe.
	Assert isTrue: unCriminal esEsbirro.! !

!TestDeMazmorra methodsFor: 'testEsbirro' stamp: 'GR 10/22/2024 23:22:34'!
test018_unCriminalTieneResistenciaYMejoraDeAtaqueBase
	
	Assert that:unCriminal resistenciaFisica isEqualTo: 1.
	
	Assert that: unCriminal debilidadFisica isEqualTo: 1.
	
	Assert that:unCriminal resistenciaMagica isEqualTo: 1.
	
	Assert that: unCriminal debilidadMagica isEqualTo: 1.
	
	Assert that:unCriminal mejoraDeAtaque isEqualTo: 1.
! !

!TestDeMazmorra methodsFor: 'testEsbirro' stamp: 'GR 10/22/2024 23:23:03'!
test019_unCultistaEsResistenteALaMagiaYDebilAlDañoFisico
	
	Assert that:unCultista resistenciaMagica isEqualTo: 0.75.
	
	Assert that: unCultista debilidadFisica isEqualTo: 1.50.


! !

!TestDeMazmorra methodsFor: 'testEsbirro' stamp: 'GR 10/22/2024 23:22:43'!
test020_unHorrorEsResistenteALaMagiaYDebilAlDañoFisico
	
	Assert that: unHorror resistenciaMagica isEqualTo: 0.5.
	
	Assert that: unHorror resistenciaFisica isEqualTo: 0.5.
	
	Assert that: unHorror mejoraDeAtaque isEqualTo: 2.

! !

!TestDeMazmorra methodsFor: 'testEsbirro' stamp: 'GR 10/22/2024 23:22:53'!
test021_unMuertoVivienteEsResistenteALaMagiaYDebilAlDañoFisico
	
	Assert that: unMuertoViviente resistenciaFisica isEqualTo: 0.75.
	
	Assert that: unMuertoViviente debilidadMagica isEqualTo: 1.50.
	

! !

!TestDeMazmorra methodsFor: 'testEsbirro' stamp: 'GR 10/22/2024 23:22:43'!
test024_unHorrorAtacaAUnGuerrero
	
	unHorror atacarA: unGuerrero.
	
	Assert that: unGuerrero puntosDeSalud isEqualTo: 50 .
	

! !


!TestDeMazmorra methodsFor: 'testEscuadron' stamp: 'GR 10/22/2024 23:21:52'!
test001_unEscuadronComienzaSinMiembros

	Assert isFalse: unEscuadronDeHeroes tieneMiembros.! !

!TestDeMazmorra methodsFor: 'testEscuadron' stamp: 'GR 10/22/2024 23:22:14'!
test002_unEscuadronReclutaUnMiembro

	unEscuadronDeHeroes reclutarMiembro: unGuerrero.

	Assert isTrue: unEscuadronDeHeroes tieneMiembros.! !

!TestDeMazmorra methodsFor: 'testEscuadron' stamp: 'GR 10/22/2024 23:22:34'!
test012_unEscuadronDeEsbirrosIntentaReclutarUnHeroe
	
	unEscuadronDeHeroes reclutarMiembro: unCriminal .
	
	Assert should: [unEscuadronDeHeroes reclutarMiembro: unGuerrero] 
	signal: Error withDescription: unEscuadronDeHeroes mensajeDeErrorPorReclutarUnMiembroMal.! !

!TestDeMazmorra methodsFor: 'testEscuadron' stamp: 'GR 10/22/2024 23:22:35'!
test013_unEscuadronDeHeroesIntentaReclutarUnEsbirro
	
	unEscuadronDeHeroes reclutarMiembro: unGuerrero.
	
	Assert should: [unEscuadronDeHeroes reclutarMiembro: unCriminal] 
	signal: Error withDescription: unEscuadronDeHeroes mensajeDeErrorPorReclutarUnMiembroMal.! !

!TestDeMazmorra methodsFor: 'testEscuadron' stamp: 'GR 10/22/2024 23:22:25'!
test014_enUnEscuadronPuedeObtenerATodosSusMiembrosAbatidos
	
	| x |
	
	unEscuadronDeHeroes reclutarMiembro: unGuerrero.
	
	unEscuadronDeHeroes reclutarMiembro: unHechicero.
	
	unGuerrero perderPuntosDeSalud: 300.
	
	x  := unEscuadronDeHeroes miembrosQueEstanAbatidos.
	
	self assert: unEscuadronDeHeroes miembrosQueEstanAbatidos equals: ({unGuerrero}) asSet.
	
	Assert isTrue: (x includes: unGuerrero).! !

!TestDeMazmorra methodsFor: 'testEscuadron' stamp: 'GR 10/22/2024 23:22:25'!
test015_unEscuadronPuedeObtenerASuPrimerMiembroListoParaLaAccion
	
	unEscuadronDeHeroes reclutarMiembro: unGuerrero.
	
	unEscuadronDeHeroes reclutarMiembro: unHechicero.
	
	unGuerrero perderPuntosDeSalud: 300.
	
	self assert: unEscuadronDeHeroes miembroQueEsteListoParaLaAccion equals: unHechicero.! !

!TestDeMazmorra methodsFor: 'testEscuadron' stamp: 'GR 10/22/2024 23:22:14'!
test016_unEscuadronVerificaQueTieneAlMenosUnMiembroListoParaLaAccion
	
	unEscuadronDeHeroes reclutarMiembro: unGuerrero.
	
	unGuerrero perderPuntosDeSalud: 300.
	
	Assert should: [unEscuadronDeHeroes miembroQueEsteListoParaLaAccion] 
	signal: Error withDescription: unEscuadronDeHeroes mensajeDeErrorPorFaltaDeMiembroListoParaLaAccion.
! !

!TestDeMazmorra methodsFor: 'testEscuadron' stamp: 'GR 10/22/2024 23:22:25'!
test017_unEscuadronSabeQueTieneLaUltimaEsperanza
	
	unEscuadronDeHeroes reclutarMiembro: unGuerrero.
	
	unEscuadronDeHeroes reclutarMiembro: unHechicero .
	
	unGuerrero perderPuntosDeSalud: 300.
	
	Assert isTrue: unEscuadronDeHeroes tieneLaUltimaEsperanza.
! !

!TestDeMazmorra methodsFor: 'testEscuadron' stamp: 'GR 10/22/2024 23:22:25'!
test025_unEscuadronSabeElTotalDeSuPoderDeAtaque
	
	unEscuadronDeHeroes reclutarMiembro: unGuerrero.
	
	unEscuadronDeHeroes reclutarMiembro: unHechicero.
	
	Assert that: unEscuadronDeHeroes poderDeAtaqueDelEscuadron isEqualTo: 60 .
	

! !

!TestDeMazmorra methodsFor: 'testEscuadron' stamp: 'GR 10/22/2024 23:22:53'!
test026_unEscuadronAtacaAOtroEscuadron
	
	unEscuadronDeHeroes reclutarMiembro: unGuerrero.
	
	unEscuadronDeEsbirros reclutarMiembro: unMuertoViviente.
	
	unEscuadronDeHeroes iniciarCombate: unEscuadronDeEsbirros.
	
	Assert that: unGuerrero puntosDeSalud isEqualTo: 75.
	
	Assert that: unMuertoViviente puntosDeSalud isEqualTo: 27.5.

! !


!TestDeMazmorra methodsFor: 'setUp' stamp: 'GR 10/22/2024 23:23:03'!
setUp

	unEscuadronDeHeroes :=  Escuadron new.
	
	unEscuadronDeEsbirros :=  Escuadron new.
	
	unGuerrero := Guerrero conAtaque: 30.
	
	unHechicero := Hechicero conAtaque: 30.
	
	unCriminal := Criminal conVida: 50.
	
	unHorror := Horror conVida: 50.
	
	unMuertoViviente := MuertoViviente conVida: 50.
	
	unCultista := Cultista conVida: 50.! !


!classDefinition: #Esbirro category: 'Correccion-Integrador-LaMazmorra'!
Object subclass: #Esbirro
	instanceVariableNames: 'ataque puntosDeSalud poderDeAtaque'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Correccion-Integrador-LaMazmorra'!

!Esbirro methodsFor: 'accessing' stamp: 'GR 10/22/2024 21:59:13'!
cantidadDeDañoPorAtaque

	^ poderDeAtaque * self mejoraDeAtaque! !

!Esbirro methodsFor: 'accessing' stamp: 'GR 10/22/2024 20:38:48'!
debilidadFisica
	^ 1.! !

!Esbirro methodsFor: 'accessing' stamp: 'GR 10/22/2024 20:39:18'!
debilidadMagica
	^ 1.! !

!Esbirro methodsFor: 'accessing' stamp: 'GR 10/22/2024 20:39:30'!
mejoraDeAtaque
	^ 1.! !

!Esbirro methodsFor: 'accessing' stamp: 'GR 10/19/2024 22:53:48'!
poderDeAtaque

	^ poderDeAtaque! !

!Esbirro methodsFor: 'accessing' stamp: 'GR 10/22/2024 20:40:59'!
puntosDeSalud

	^ puntosDeSalud.! !

!Esbirro methodsFor: 'accessing' stamp: 'GR 10/22/2024 20:38:34'!
resistenciaFisica
	^ 1.! !

!Esbirro methodsFor: 'accessing' stamp: 'GR 10/22/2024 20:59:02'!
resistenciaMagica
	^ 1.! !


!Esbirro methodsFor: 'initialization' stamp: 'GR 10/19/2024 22:51:44'!
inicializarConVida: cantidadDeSalud 
	
	puntosDeSalud := cantidadDeSalud.
	
	poderDeAtaque := 25.! !


!Esbirro methodsFor: 'testing' stamp: 'GR 10/22/2024 12:13:28'!
esEsbirro
	^ true.! !

!Esbirro methodsFor: 'testing' stamp: 'GR 10/22/2024 12:46:52'!
esHeroe
	^ false.! !

!Esbirro methodsFor: 'testing' stamp: 'GR 10/19/2024 22:57:20'!
estaAbatido
	^ puntosDeSalud <= 0.! !

!Esbirro methodsFor: 'testing' stamp: 'GR 10/22/2024 23:15:24'!
estaListoParaLaAccion
	^ puntosDeSalud > 0! !

!Esbirro methodsFor: 'testing' stamp: 'GR 10/22/2024 12:39:02'!
verificarSiElEscuadronEsAdecuado: unEscuadron 
	^ unEscuadron esEscuadronDeEsbirros.! !


!Esbirro methodsFor: 'updating' stamp: 'GR 10/22/2024 21:59:13'!
atacarA: unEnemigo 
	unEnemigo perderPuntosDeSalud: (self cantidadDeDañoPorAtaque)! !

!Esbirro methodsFor: 'updating' stamp: 'mc 10/23/2024 19:09:54'!
perderPuntosDeSalud: puntosDeSaludAPerder 
	puntosDeSalud := puntosDeSalud - puntosDeSaludAPerder
	
	"Podrías asegurarte que la resta no te deje la salud en negativo"! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Esbirro class' category: 'Correccion-Integrador-LaMazmorra'!
Esbirro class
	instanceVariableNames: ''!

!Esbirro class methodsFor: 'as yet unclassified' stamp: 'GR 10/22/2024 16:16:13'!
conVida: puntosDeSalud 
	^ self new inicializarConVida: puntosDeSalud.! !


!classDefinition: #Criminal category: 'Correccion-Integrador-LaMazmorra'!
Esbirro subclass: #Criminal
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Correccion-Integrador-LaMazmorra'!


!classDefinition: #Cultista category: 'Correccion-Integrador-LaMazmorra'!
Esbirro subclass: #Cultista
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Correccion-Integrador-LaMazmorra'!

!Cultista methodsFor: 'as yet unclassified' stamp: 'GR 10/22/2024 16:25:15'!
debilidadFisica
	^ 1.50.! !

!Cultista methodsFor: 'as yet unclassified' stamp: 'GR 10/22/2024 16:24:51'!
resistenciaMagica
	^ 0.75.! !


!classDefinition: #Horror category: 'Correccion-Integrador-LaMazmorra'!
Esbirro subclass: #Horror
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Correccion-Integrador-LaMazmorra'!

!Horror methodsFor: 'as yet unclassified' stamp: 'GR 10/22/2024 20:36:53'!
mejoraDeAtaque
	^ 2.! !

!Horror methodsFor: 'as yet unclassified' stamp: 'GR 10/22/2024 20:36:18'!
resistenciaFisica
	^ 0.5.! !

!Horror methodsFor: 'as yet unclassified' stamp: 'GR 10/22/2024 20:36:03'!
resistenciaMagica
	^ 0.5! !


!classDefinition: #MuertoViviente category: 'Correccion-Integrador-LaMazmorra'!
Esbirro subclass: #MuertoViviente
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Correccion-Integrador-LaMazmorra'!

!MuertoViviente methodsFor: 'as yet unclassified' stamp: 'GR 10/22/2024 20:37:37'!
debilidadMagica
	^ 1.5.! !

!MuertoViviente methodsFor: 'as yet unclassified' stamp: 'GR 10/22/2024 20:37:19'!
resistenciaFisica
	^ 0.75.! !


!classDefinition: #Escuadron category: 'Correccion-Integrador-LaMazmorra'!
Object subclass: #Escuadron
	instanceVariableNames: 'miembros'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Correccion-Integrador-LaMazmorra'!

!Escuadron methodsFor: 'accessing' stamp: 'GR 10/22/2024 15:14:36'!
miembroQueEsteListoParaLaAccion
	
	self verificarQueHayAlgunMiembroListoParaLaAccion.
	
	^ miembros detect: [: unMiembro | unMiembro estaListoParaLaAccion].
	
	"
	^ miembros detect: [: unMiembro | unMiembro estaListoParaLaAccion] ifNone: [self error: self mensajeDeErrorPorIntentarObtenerUnMiembroListoParaLaAccionCuandoEstanTodosAbatidos]
	"! !

!Escuadron methodsFor: 'accessing' stamp: 'GR 10/22/2024 14:38:53'!
miembros
	
	^ miembros! !

!Escuadron methodsFor: 'accessing' stamp: 'GR 10/22/2024 14:53:19'!
miembrosQueEstanAbatidos
	
	^ miembros select: [:unIntegrante | unIntegrante estaAbatido].! !

!Escuadron methodsFor: 'accessing' stamp: 'GR 10/22/2024 22:56:42'!
miembrosQueEstenListoParaLaAccion

	^ miembros select: [: unMiembro | unMiembro estaListoParaLaAccion]! !

!Escuadron methodsFor: 'accessing' stamp: 'GR 10/22/2024 22:56:43'!
poderDeAtaqueDelEscuadron
	.
	^ (self miembrosQueEstenListoParaLaAccion) sum:[: unMiembro | unMiembro poderDeAtaque] ifEmpty: 0.
	
	! !


!Escuadron methodsFor: 'error handling' stamp: 'GR 10/22/2024 15:15:26'!
mensajeDeErrorPorFaltaDeMiembroListoParaLaAccion

	^ ' No hay miembros listos para la accion '.! !

!Escuadron methodsFor: 'error handling' stamp: 'GR 10/22/2024 15:08:56'!
mensajeDeErrorPorReclutarUnMiembroMal

	^ 'No podes reclutar este miembro'! !

!Escuadron methodsFor: 'error handling' stamp: 'GR 10/22/2024 15:14:36'!
verificarQueHayAlgunMiembroListoParaLaAccion

	^ (self hayAlgunMiembrosEstanListosParaLaAccion) 
	ifFalse: [self error: self mensajeDeErrorPorFaltaDeMiembroListoParaLaAccion]! !

!Escuadron methodsFor: 'error handling' stamp: 'GR 10/22/2024 15:12:49'!
verificarSiPuedeReclutarA: unMiembro

	^ (unMiembro verificarSiElEscuadronEsAdecuado: self) 
	ifFalse: [self error: self mensajeDeErrorPorReclutarUnMiembroMal]! !


!Escuadron methodsFor: 'initialization' stamp: 'GR 10/22/2024 14:38:53'!
initialize
	
	miembros := Set new.! !


!Escuadron methodsFor: 'testing' stamp: 'GR 10/22/2024 15:15:39'!
esEscuadronDeEsbirros

	^ miembros allSatisfy: [:unMiembro | unMiembro esEsbirro].! !

!Escuadron methodsFor: 'testing' stamp: 'GR 10/22/2024 15:15:35'!
esEscuadronDeHeroes

	^ miembros allSatisfy: [:unMiembro | unMiembro esHeroe].! !

!Escuadron methodsFor: 'testing' stamp: 'GR 10/22/2024 15:32:15'!
hayAlgunMiembroQueNoEsteAbatido

	^ miembros anySatisfy: [:unMiembro | unMiembro estaAbatido not]! !

!Escuadron methodsFor: 'testing' stamp: 'GR 10/22/2024 15:15:31'!
hayAlgunMiembrosEstanListosParaLaAccion

	^ miembros anySatisfy: [:unMiembro | unMiembro estaListoParaLaAccion].! !

!Escuadron methodsFor: 'testing' stamp: 'GR 10/22/2024 15:32:15'!
tieneLaUltimaEsperanza

	^ (self hayAlgunMiembroQueNoEsteAbatido) & (self esEscuadronDeHeroes).! !

!Escuadron methodsFor: 'testing' stamp: 'GR 10/22/2024 14:38:53'!
tieneMiembros
	
	^ miembros notEmpty.! !


!Escuadron methodsFor: 'updating' stamp: 'GR 10/22/2024 23:13:47'!
iniciarCombate: unEscuadron

	self miembroQueEsteListoParaLaAccion atacarA: unEscuadron miembroQueEsteListoParaLaAccion.
	
	 unEscuadron miembroQueEsteListoParaLaAccion atacarA: self miembroQueEsteListoParaLaAccion.! !

!Escuadron methodsFor: 'updating' stamp: 'GR 10/22/2024 15:12:49'!
reclutarMiembro: unMiembro

	self verificarSiPuedeReclutarA: unMiembro.
	
	miembros add: unMiembro.! !


!classDefinition: #Heroe category: 'Correccion-Integrador-LaMazmorra'!
Object subclass: #Heroe
	instanceVariableNames: 'puntosDeSalud poderDeAtaque'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Correccion-Integrador-LaMazmorra'!

!Heroe methodsFor: 'accessing' stamp: 'GR 10/19/2024 23:00:06'!
poderDeAtaque
	^ poderDeAtaque! !

!Heroe methodsFor: 'accessing' stamp: 'GR 10/19/2024 22:47:47'!
puntosDeSalud

	^ puntosDeSalud! !


!Heroe methodsFor: 'initialization' stamp: 'GR 10/19/2024 22:47:29'!
inicializarConAtaque: puntosDeAtaque 
	
	puntosDeSalud := 100.
	
	poderDeAtaque := puntosDeAtaque.! !


!Heroe methodsFor: 'testing' stamp: 'GR 10/22/2024 12:42:17'!
esEsbirro
	^ false.! !

!Heroe methodsFor: 'testing' stamp: 'GR 10/22/2024 12:13:13'!
esHeroe
	^ true.! !

!Heroe methodsFor: 'testing' stamp: 'GR 10/19/2024 22:57:30'!
estaAbatido
	
	^ puntosDeSalud <= 0.! !

!Heroe methodsFor: 'testing' stamp: 'GR 10/22/2024 14:42:56'!
estaListoParaLaAccion
	^ puntosDeSalud > 0.! !

!Heroe methodsFor: 'testing' stamp: 'GR 10/19/2024 23:25:49'!
puedeUtilizarCualquierArma
	^ false.! !

!Heroe methodsFor: 'testing' stamp: 'GR 10/19/2024 23:16:24'!
realizaAtaquesFisicos
	^ false.! !

!Heroe methodsFor: 'testing' stamp: 'GR 10/19/2024 23:15:57'!
realizaAtaquesMagicos
	^ false.! !

!Heroe methodsFor: 'testing' stamp: 'GR 10/22/2024 12:37:05'!
verificarSiElEscuadronEsAdecuado: unEscuadron 
	^ unEscuadron esEscuadronDeHeroes.! !


!Heroe methodsFor: 'updating' stamp: 'mc 10/23/2024 19:22:41'!
atacarA: unEnemigo

	self subclassResponsibility
	
	"Utilizas la misma lógica para atacar en Guerrero y en Hechicero, así que podrías implementarlo acá y delegar a las subclases el mensaje 'cantidadDeDañoHechoA:' que es el que se comporta distinto para cada tipo."! !

!Heroe methodsFor: 'updating' stamp: 'GR 10/19/2024 22:56:45'!
perderPuntosDeSalud: puntosDeSaludAPerder 
	
	puntosDeSalud := puntosDeSalud - puntosDeSaludAPerder! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Heroe class' category: 'Correccion-Integrador-LaMazmorra'!
Heroe class
	instanceVariableNames: ''!

!Heroe class methodsFor: 'as yet unclassified' stamp: 'GR 10/22/2024 12:52:33'!
conAtaque: puntosDeAtaque 
	^ self new inicializarConAtaque: puntosDeAtaque.! !


!classDefinition: #Guerrero category: 'Correccion-Integrador-LaMazmorra'!
Heroe subclass: #Guerrero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Correccion-Integrador-LaMazmorra'!

!Guerrero methodsFor: 'as yet unclassified' stamp: 'GR 10/22/2024 21:41:01'!
atacarA: unEnemigo
	unEnemigo perderPuntosDeSalud: (self cantidadDeDañoHechoA: unEnemigo).! !

!Guerrero methodsFor: 'as yet unclassified' stamp: 'GR 10/22/2024 21:40:51'!
cantidadDeDañoHechoA: unEnemigo

	^ poderDeAtaque * (unEnemigo resistenciaFisica * unEnemigo debilidadFisica)! !

!Guerrero methodsFor: 'as yet unclassified' stamp: 'GR 10/19/2024 23:25:38'!
puedeUtilizarCualquierArma
	^ true.! !

!Guerrero methodsFor: 'as yet unclassified' stamp: 'GR 10/19/2024 23:15:19'!
realizaAtaquesFisicos
	^ true.! !


!classDefinition: #Hechicero category: 'Correccion-Integrador-LaMazmorra'!
Heroe subclass: #Hechicero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Correccion-Integrador-LaMazmorra'!

!Hechicero methodsFor: 'as yet unclassified' stamp: 'GR 10/22/2024 21:41:38'!
atacarA: unEnemigo
	unEnemigo perderPuntosDeSalud: (self cantidadDeDañoHechaA: unEnemigo).! !

!Hechicero methodsFor: 'as yet unclassified' stamp: 'GR 10/22/2024 21:41:38'!
cantidadDeDañoHechaA: unEnemigo

	^ poderDeAtaque * (unEnemigo debilidadMagica * unEnemigo resistenciaMagica)! !

!Hechicero methodsFor: 'as yet unclassified' stamp: 'GR 10/19/2024 23:14:41'!
realizaAtaquesMagicos
	^ true.! !


!classDefinition: #ReadMe category: 'Correccion-Integrador-LaMazmorra'!
Object subclass: #ReadMe
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Correccion-Integrador-LaMazmorra'!

!ReadMe methodsFor: 'as yet unclassified' stamp: 'mc 10/23/2024 19:40:52'!
readMe

	"En líneas generales está muy bien. Te dejo dos observaciones:
	
	* La clase Criminal no tiene comportamiento definido. Cuando una subclase no tiene mensajes es posible que la jerarquía no esté bien definida, así que deberías reconsiderar si realmente necesita existir o si hay responsabilidades que no está teniendo.
	
	* Tanto Esbirro como Heroe tienen algunos mensajes en común (atacarA:, perderPuntosDeSalud:, verificarSiElEscuadronEsAdecuado:, etc). Podrías evitar la repetición de código declarando una superclase que contenga a ambas clases."! !
