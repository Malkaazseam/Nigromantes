class_name Rango extends Area2D

const RAPIDEZ: float = 250
var direccion: Vector2

const SEGUNDOS_VIDA: float = 3
var segundosRestantes: float

func _ready() -> void:
	body_entered.connect(_impactoMago)
	area_entered.connect(_impactoNoMago)
	
	segundosRestantes = SEGUNDOS_VIDA

func _process(delta: float) -> void:
	if direccion != Vector2.ZERO:
		position += direccion * RAPIDEZ * delta
		
	if segundosRestantes <= 0:
		queue_free()
	else:
		segundosRestantes -= delta

func _impactoMago(body):
	if body is Mago:
		body.impacto()
		_desaparecer()
		
func _impactoNoMago(area):
	if area is Rango:
		_desaparecer()
	if area is Melee:
		_desaparecer()
		
func _desaparecer():
	queue_free()

func inicializar(direccionNueva: Vector2):
	direccion = direccionNueva
