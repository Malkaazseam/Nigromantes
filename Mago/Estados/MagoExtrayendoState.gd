class_name MagoExtrayendoState extends MagoState

const SEGUNDOS_EXTRAYENDO: float = 1
var segundosRestantes: float

func _init(magoNuevo):
	super(magoNuevo)
	
	segundosRestantes = SEGUNDOS_EXTRAYENDO
	#debug
	mago.animacionExtraccion.visible = true
	
func process(delta):
	if segundosRestantes <= 0:
		mago.extraer()
		mago.animacionExtraccion.visible = false
		mago.cambiarEstadoInactivo()
	else:
		segundosRestantes -= delta
	
func input(event):
	pass
