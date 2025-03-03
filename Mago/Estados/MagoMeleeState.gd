class_name MagoMeleeState extends MagoState

enum {GOLPE, RECUPERACION}

const SEGUNDOS_GOLPE: float = 0.1
const SEGUNDOS_RECUPERACION: float = 0.25

var segundosRestantes: float

var etapa: int

func _init(magoNuevo):
	super(magoNuevo)
	
	segundosRestantes = SEGUNDOS_GOLPE
	etapa = GOLPE
	mago.mano.activarMelee()
	
func process(delta):
	match etapa:
		GOLPE:
			if segundosRestantes <= 0:
				segundosRestantes = SEGUNDOS_RECUPERACION
				etapa = RECUPERACION
				mago.mano.desactivarMelee()
			else:
				segundosRestantes -= delta
		RECUPERACION:
			if segundosRestantes <= 0:
				mago.cambiarEstadoInactivo()
			else:
				segundosRestantes -= delta

func input(event):
	pass
