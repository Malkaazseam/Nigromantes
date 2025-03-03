extends Node2D

const DISTANCIA: float = 50

func _process(delta: float) -> void:
	if get_parent().contrincante != null:
		position = get_parent().to_local(get_parent().contrincante.position).normalized() * DISTANCIA
		rotation = Vector2.RIGHT.angle_to(get_parent().to_local(get_parent().contrincante.position))

func activarEscudo():
	$Escudo.monitoring = true
	$Escudo.monitorable = true
	$Escudo/Sprite.visible = true
	
func desactivarEscudo():
	$Escudo.monitoring = false
	$Escudo.monitorable = false
	$Escudo/Sprite.visible = false
	
func activarMelee():
	$Melee.monitoring = true
	$Melee.monitorable = true
	$Melee/Sprite.visible = true
	
func desactivarMelee():
	$Melee.monitoring = false
	$Melee.monitorable = false
	$Melee/Sprite.visible = false
