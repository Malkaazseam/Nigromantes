class_name MagoState

var mago: Mago

func _init(magoNuevo):
	mago = magoNuevo
	
func process(delta):
	if mago.joystick:
		mago.direccion = Input.get_vector("IzquierdaJoystick", "DerechaJoystick", "ArribaJoystick", "AbajoJoystick").normalized()
	else:
		mago.direccion = Input.get_vector("Izquierda", "Derecha", "Arriba", "Abajo").normalized()

func input(event: InputEvent):
	if mago.joystick:
		if event.is_action_pressed("MeleeJoystick"):
			mago.cambiarEstadoMelee()
		elif event.is_action_pressed("EscudoJoystick"):
			mago.cambiarEstadoEscudoMoviendose()
		elif event.is_action_pressed("RangoJoystick"):
			mago.cambiarEstadoRango()
		elif event.is_action_pressed("ExtraerJoystick"):
			mago.cambiarEstadoExtrayendo()
	else:
		if event.is_action_pressed("Melee"):
			mago.cambiarEstadoMelee()
		elif event.is_action_pressed("Escudo"):
			mago.cambiarEstadoEscudoMoviendose()
		elif event.is_action_pressed("Rango"):
			mago.cambiarEstadoRango()
		elif event.is_action_pressed("Extraer"):
			mago.cambiarEstadoExtrayendo()
	
