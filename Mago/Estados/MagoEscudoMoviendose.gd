class_name MagoEscudoMoviendoseState extends MagoState

func _init(magoNuevo):
	super(magoNuevo)
	
	mago.mano.activarEscudo()
	mago.segundosRestantesEscudo = mago.SEGUNDOS_ESCUDO
	
func process(delta):
	super(delta)
	if mago.direccion == Vector2.ZERO:
		mago.cambiarEstadoEscudoInactivo()
	else:
		var velocidad = mago.direccion * mago.RAPIDEZ_ESCUDO * delta
		mago.move_and_collide(Vector2(velocidad.x, 0))
		mago.move_and_collide(Vector2(0, velocidad.y))

	if mago.segundosRestantesEscudo <= 0:
		mago.mano.desactivarEscudo()
		mago.cambiarEstadoMoviendose()
	else:
		mago.segundosRestantesEscudo -= delta

func input(event):
	pass
