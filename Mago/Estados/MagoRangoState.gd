class_name MagoRangoState extends MagoState

enum {ANTICIPACION, GOLPE, RECUPERACION}
var etapa: int

const SEGUNDOS_ANTICIPACION: float = 0.25
const SEGUNDOS_GOLPE: float = 0.1
const SEGUNDOS_RECUPERACION: float = 0.1
var segundosRestantes: float

func _init(magoNuevo):
	super(magoNuevo)
	
	etapa = ANTICIPACION
	segundosRestantes = SEGUNDOS_ANTICIPACION
	
func process(delta):
	match etapa:
		ANTICIPACION:
			if segundosRestantes <= 0:
				segundosRestantes = SEGUNDOS_GOLPE
				etapa = GOLPE
				mago.tirarRango()
			else:
				segundosRestantes -= delta
		GOLPE:
			if segundosRestantes <= 0:
				segundosRestantes = SEGUNDOS_RECUPERACION
				etapa = RECUPERACION
			else:
				segundosRestantes -= delta
		RECUPERACION:
			if segundosRestantes <= 0:
				mago.cambiarEstadoInactivo()
			else:
				segundosRestantes -= delta

func input(event: InputEvent):
	pass
