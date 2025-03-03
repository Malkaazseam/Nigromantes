class_name MagoExtrayendoState extends MagoState

const SEGUNDOS_INTENTO_EXTRACCION: float = 0.25
const SEGUNDOS_EXTRAYENDO: float = 1
var segundosRestantes: float

func _init(magoNuevo):
	super(magoNuevo)
	
	if mago.extraccion.has_overlapping_areas():
		segundosRestantes = SEGUNDOS_EXTRAYENDO
	else:
		segundosRestantes = SEGUNDOS_INTENTO_EXTRACCION
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
