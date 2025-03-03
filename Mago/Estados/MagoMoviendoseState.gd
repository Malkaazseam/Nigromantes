class_name MagoMoviendoseState extends MagoState

func _init(magoNuevo):
	super(magoNuevo)
	
func process(delta):
	super(delta)
	if mago.direccion == Vector2.ZERO:
		mago.cambiarEstadoInactivo()
	else:
		var velocidad = mago.direccion * mago.RAPIDEZ * delta
		mago.move_and_collide(Vector2(velocidad.x, 0))
		mago.move_and_collide(Vector2(0, velocidad.y))
