class_name MagoCarpturandoState extends MagoState

const SEGUNDOS_CAPTURA: float = 1
var segundosRestantes: float

func _init(magoNuevo):
	super(magoNuevo)
	
	segundosRestantes = SEGUNDOS_CAPTURA
	mago.animacionExtraccion.visible = true
	
func process(delta):
	if segundosRestantes <= 0:
		mago.capturar()
		mago.animacionExtraccion.visible = false
		mago.cambiarEstadoInactivo()
	else:
		segundosRestantes -= delta
	
func input(event):
	pass
