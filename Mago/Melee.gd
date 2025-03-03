class_name Melee extends Area2D

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	if monitoring:
		if has_overlapping_areas():
			for area in get_overlapping_areas():
				if area is Escudo:
					get_parent().get_parent().impacto()
					monitoring = false
					break
	if monitoring:
		if has_overlapping_bodies():
			for body in get_overlapping_bodies():
				if body is Mago:
					body.impacto()
					monitoring = false
					break
