class_name MagoEscudoInactivoState extends MagoState

func _init(magoNuevo):
	super(magoNuevo)
	
func process(delta):
	super(delta)
	if mago.direccion != Vector2.ZERO:
		mago.cambiarEstadoEscudoMoviendose()
		
	if mago.segundosRestantesEscudo <= 0:
		mago.mano.desactivarEscudo()
		mago.cambiarEstadoInactivo()
	else:
		mago.segundosRestantesEscudo -= delta

func input(event):
	pass
