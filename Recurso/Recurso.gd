extends Sprite2D

const RAPIDEZ_INICIAL: float = 50
const INCREMENTO_RAPIDEZ: float = 500
var rapidez: float

var objetivo: Mago

func _ready():
	rapidez = RAPIDEZ_INICIAL

func _physics_process(delta: float) -> void:
	if objetivo != null:
		if objetivo.position.distance_to(position) > rapidez * delta:
			position += to_local(objetivo.position).normalized() * rapidez * delta
			rapidez += INCREMENTO_RAPIDEZ * delta
		else:
			_desaparecer()

func inicializar(mago):
	objetivo = mago

func _desaparecer():
	objetivo.adquirirRecurso()
	queue_free()
