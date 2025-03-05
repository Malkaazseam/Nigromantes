class_name Mago extends CharacterBody2D

var estado: MagoState

@export var joystick: bool

@export var contrincante: Mago

@export var tablero: Tablero

const VIDAS_MAXIMAS: int = 3
var vidas: int

const RAPIDEZ: float = 200
const RAPIDEZ_ESCUDO: float = 150
var direccion: Vector2

var sprite: Sprite2D
var mano: Node2D
var melee: Area2D
var spriteMelee: Sprite2D
var escudo: Area2D
var spriteEscudo: Sprite2D
var resRango: Resource
var extraccion: Area2D
var areaAccion: Area2D
var animacionExtraccion: Sprite2D

const SEGUNDOS_ESCUDO: float = 0.5
var segundosRestantesEscudo: float

const SEGUNDOS_INVULNERABILIDAD: float = 0.25
var segundosRestantesInvulnerabilidad: float

var conBandera: bool

func _ready() -> void:
	sprite = $Sprite
	mano = $Mano
	melee = $Mano/Melee
	spriteMelee = $Mano/Melee/Sprite
	escudo = $Mano/Escudo
	spriteEscudo = $Mano/Escudo/Sprite
	resRango = load("res://Rango/Rango.tscn")
	extraccion = $AreaExtraccion
	areaAccion = $AreaAccion
	animacionExtraccion = $AnimacionExtraccion
	
	vidas = VIDAS_MAXIMAS
	
	conBandera = false
	
	cambiarEstadoInactivo()

func _physics_process(delta: float) -> void:
	estado.process(delta)
	
	if segundosRestantesInvulnerabilidad <= 0:
		if not estado is MagoStunState:
			#debug
			sprite.set_modulate(Color(1, 1, 1, 1))
	else:
		segundosRestantesInvulnerabilidad -= delta
	
func _input(event: InputEvent):
	estado.input(event)
	
func tirarRango():
	var rangoNuevo = resRango.instantiate()
	rangoNuevo.inicializar(mano.position.normalized())
	rangoNuevo.position = position + mano.position
	rangoNuevo.rotation = mano.rotation
	get_parent().add_child(rangoNuevo)
	
func extraer():
	if extraccion.has_overlapping_areas():
		for area in extraccion.get_overlapping_areas():
			if area is AreaExtraccion:
				area.extraer(self)
	
func impacto():
	if not estado is MagoStunState and not segundosRestantesInvulnerabilidad > 0:
		cambiarEstadoStun()
		
func adquirirRecurso():
	if tablero != null:
		tablero.sumarPunto()
		
func capturar():
	if areaAccion.has_overlapping_areas():
		for area in areaAccion.get_overlapping_areas():
			if area is AreaCaptura:
				area.capturar(self)
				conBandera = true
		
func accion():
	if areaAccion.has_overlapping_areas():
		var area = areaAccion.get_overlapping_areas()[0]
		if area is AreaExtraccion:
			cambiarEstadoExtrayendo()
		elif area is AreaCaptura:
			cambiarEstadoCapturando()
	
#cambios de estado
func cambiarEstadoInactivo():
	estado = MagoInactivoState.new(self)

func cambiarEstadoMoviendose():
	estado = MagoMoviendoseState.new(self)

func cambiarEstadoMelee():
	estado = MagoMeleeState.new(self)
	
func cambiarEstadoRango():
	estado = MagoRangoState.new(self)
	
func cambiarEstadoStun():
	estado = MagoStunState.new(self)

func cambiarEstadoEscudoInactivo():
	estado = MagoEscudoInactivoState.new(self)
	
func cambiarEstadoEscudoMoviendose():
	estado = MagoEscudoMoviendoseState.new(self)

func cambiarEstadoExtrayendo():
	estado = MagoExtrayendoState.new(self)

func cambiarEstadoCapturando():
	estado = MagoCarpturandoState.new(self)
