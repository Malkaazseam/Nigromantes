class_name Tablero extends Node2D

var puntaje: int

func _ready():
	puntaje = 0

func sumarPunto():
	puntaje += 1
	$Puntaje.set_text(str(puntaje))
