import Isla.*

class Pajaro {
	
	var property fuerza = 0
	var ira = 0
	var enojado = false
	
	method enojarse() {
		fuerza = ira * 2
		enojado = true
	}
	
	method esFuerte() {
		return fuerza > 50
	}
	
	method disminuirIra(unValor) {
		ira -= unValor
	}
	
	method enojarseUnasVeces(unosCerditos) {
		const cantEnojos = unosCerditos.div(100)
		cantEnojos.times({_ => self.enojarse()})
	}
	
	method puedeDerribarObstaculo(unObstaculo) {
		return fuerza > unObstaculo.resistencia()
	}
	
	method atacarPrimerObstaculoDeLaIslaCerdito() {
		self.atacarAIslaCerdito(islaCerdito.primerObstaculo())
	}
	
	method atacarAIslaCerdito(unObstaculo) {
		if(self.puedeDerribarObstaculo(unObstaculo)) {
			islaCerdito.eliminarObstaculo()
		}
	}	
	
}

object red inherits Pajaro {
	
	var cantEnojos
	
	override method enojarse() {
		cantEnojos ++
		fuerza = ira * 10 * cantEnojos
		enojado = true
	}
	
}

object bomb inherits Pajaro {
	
	var topeFuerza = 9000
	
	override method enojarse() {
		fuerza = (ira * 2).max(topeFuerza)
		enojado = true
	}
	
	method cambiarTopeFuerza(nuevoTope) {
		topeFuerza = nuevoTope
	}
	
}

object chuck inherits Pajaro {
	
	var velocidad
	
	override method enojarse() {
		fuerza = 150
		velocidad += velocidad
		if(self.excesoDeVelocidad()) {
			fuerza = fuerza + self.excesoDeVelocidad() * 5
			enojado = true
		}
	}
	
	method excesoDeVelocidad() {
		if(velocidad > 80) {
			return velocidad - 80
		}
		return 0
	}
	
	override method disminuirIra(unValor) {}	
	
}

object terence inherits Pajaro {
	
	var cantEnojos
	var multiplicador
	
	override method enojarse() {
		fuerza = ira * cantEnojos * multiplicador
		enojado = true
	}
	
}

object matilda inherits Pajaro {
	
	var cantHuevos = []
	
	override method enojarse() {
		super()
		fuerza += self.fuerzaDeSusHuevos()
		cantHuevos.add(new Huevo(peso = 2))
		enojado = true
	}
	
	method fuerzaDeSusHuevos() {
		return cantHuevos.sum({unHuevo => unHuevo.fuerza()})
	}
	
}

class Huevo {
	
	var peso
	var property fuerza = peso
	
}
