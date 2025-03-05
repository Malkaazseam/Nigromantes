class_name Bandera extends StaticBody2D

var magoConBandera: Mago
var linea: Line2D

func _physics_process(delta: float) -> void:
	if magoConBandera != null:
		$Linea.points[1] = to_local(magoConBandera.position)

func capturar(mago):
	magoConBandera = mago
	$Linea.add_point(Vector2(0, 0))
	$Linea.add_point(to_local(magoConBandera.position))
