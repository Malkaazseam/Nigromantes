class_name MagoStunState extends MagoState

const SEGUNDOS_STUN: float = 0.75
const SEGUNDOS_VOLANDO: float = 0.5
const SEGUNDOS_STUN_FUERTE: float = 2.5
var segundosRestantes: float

const RAPIDEZ_VOLANDO: float = 300
var direccion: Vector2

enum {VOLANDO, PISO}
var etapa: int

func _init(magoNuevo):
	super(magoNuevo)
	
	mago.mano.desactivarMelee.call_deferred()
	mago.mano.desactivarEscudo.call_deferred()
	
	direccion = -mago.to_local(mago.contrincante.position).normalized()
	
	mago.vidas -= 1
	if mago.vidas == 0:
		segundosRestantes = SEGUNDOS_VOLANDO
		etapa = VOLANDO
		mago.vidas = mago.VIDAS_MAXIMAS
	else:
		segundosRestantes = SEGUNDOS_STUN
		etapa = PISO
	#debug
	mago.sprite.set_modulate(Color(0.3, 0.3, 0.3))
	
func process(delta):
	match etapa:
		VOLANDO:
			if segundosRestantes <= 0:
				segundosRestantes = SEGUNDOS_STUN_FUERTE
				etapa = PISO
			else:
				var velocidad = direccion * RAPIDEZ_VOLANDO * delta
				mago.move_and_collide(Vector2(velocidad.x, 0))
				mago.move_and_collide(Vector2(0, velocidad.y))
				segundosRestantes -= delta
		PISO:
			if segundosRestantes <= 0:
				#debug
				mago.sprite.set_modulate(Color(1, 1, 1, 0.5))
				
				mago.segundosRestantesInvulnerabilidad = mago.SEGUNDOS_INVULNERABILIDAD
				mago.cambiarEstadoInactivo()
			else:
				segundosRestantes -= delta

func input(event: InputEvent):
	pass
