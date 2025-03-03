class_name Pila extends StaticBody2D

const VIDA_MAXIMA: float = 10
var vida: float

var spawner: SpawnerPilas
var spawns: Array
var spawn: Node2D

var recursoRes: PackedScene

func _ready() -> void:
	vida = VIDA_MAXIMA
	
	recursoRes = load("res://Recurso/Recurso.tscn")
	
func darRecurso(mago: Mago):
	var recursoNuevo = recursoRes.instantiate()
	recursoNuevo.position = position
	recursoNuevo.inicializar(mago)
	get_parent().add_child(recursoNuevo)
	_perderVida()

func inicializar(spawnOrigen, listaSpawns, spawnerOrigen):
	spawn = spawnOrigen
	spawns = listaSpawns
	spawner = spawnerOrigen

func _perderVida():
	vida -= 1
	
	if vida <= 0:
		_desaparecer()

func _desaparecer():
	if spawns != null:
		spawns.append(spawn)
	if spawner != null:
		spawner.pilas -= 1
	queue_free()
