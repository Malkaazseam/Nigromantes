class_name MagoInactivoState extends MagoState

func _init(magoNuevo):
	super(magoNuevo)
	
func process(delta):
	super(delta)
	if mago.direccion != Vector2.ZERO:
		mago.cambiarEstadoMoviendose()
