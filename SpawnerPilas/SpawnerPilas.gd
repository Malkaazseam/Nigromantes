class_name SpawnerPilas extends Node2D

var cuadrantes: Array
var spawns1: Array
var spawns2: Array
var spawns3: Array
var spawns4: Array

const PILAS_MAXIMAS: int = 1
var pilas: int

var pilaRes: Resource

func _ready():
	pilaRes = load("res://Pila/Pila.tscn")
	
	cuadrantes = []
	spawns1 = []
	spawns2 = []
	spawns3 = []
	spawns4 = []
	
	pilas = 0
		
	for nodo in $Cuadrante1.get_children():
		if "Spawn" in nodo.name:
			spawns1.append(nodo)
	for nodo in $Cuadrante2.get_children():
		if "Spawn" in nodo.name:
			spawns2.append(nodo)
	for nodo in $Cuadrante3.get_children():
		if "Spawn" in nodo.name:
			spawns3.append(nodo)
	for nodo in $Cuadrante4.get_children():
		if "Spawn" in nodo.name:
			spawns4.append(nodo)
			
	cuadrantes.append(spawns1)
	cuadrantes.append(spawns2)
	cuadrantes.append(spawns3)
	cuadrantes.append(spawns4)
			
	$SpawnTimer.timeout.connect(_spawnRandom)
	$Cuadrante1.body_entered.connect(_deshabilitar1)
	$Cuadrante2.body_entered.connect(_deshabilitar2)
	$Cuadrante3.body_entered.connect(_deshabilitar3)
	$Cuadrante4.body_entered.connect(_deshabilitar4)
	$Cuadrante1.body_exited.connect(_habilitar1)
	$Cuadrante2.body_exited.connect(_habilitar2)
	$Cuadrante3.body_exited.connect(_habilitar3)
	$Cuadrante4.body_exited.connect(_habilitar4)
	
func _spawnRandom():
	if pilas < PILAS_MAXIMAS:
		var cuadrante = cuadrantes.pick_random()
		if cuadrante != null and cuadrante.size() > 0:
			var spawn = cuadrante.pick_random()
			cuadrante.erase(spawn)
			
			var pilaNueva: Pila = pilaRes.instantiate()
			pilaNueva.inicializar(spawn, cuadrante, self)
			pilaNueva.position = spawn.position + spawn.get_parent().position
			get_parent().add_child(pilaNueva)
			
			pilas += 1

func _deshabilitar1(_body):
	cuadrantes.erase(spawns1)
	
func _deshabilitar2(_body):
	cuadrantes.erase(spawns2)
	
func _deshabilitar3(_body):
	cuadrantes.erase(spawns3)
	
func _deshabilitar4(_body):
	cuadrantes.erase(spawns4)

func _habilitar1(_body):
	cuadrantes.append(spawns1)
	
func _habilitar2(_body):
	cuadrantes.append(spawns2)
	
func _habilitar3(_body):
	cuadrantes.append(spawns3)
	
func _habilitar4(_body):
	cuadrantes.append(spawns4)
