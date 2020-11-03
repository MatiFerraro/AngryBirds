import Pajaro.*

class Isla {
	
	var pajarosDeLaIsla = []
	
	method pajarosFuertes() {
		return pajarosDeLaIsla.filter({unPajaro => unPajaro.esFuerte()})
	}
	
	method fuerzaDeLaIsla() {
		return pajarosDeLaIsla.pajarosFuertes().sum({unPajaro => unPajaro.fuerza()})
	}
		
}

object islaPajaro inherits Isla {
	
	method sesionDeManejoDeIra() {
		pajarosDeLaIsla.forEach({unPajaro => unPajaro.disminuirIra(5)})
	}
	
	method invasionDeCerditos(unosCerditos) {
		pajarosDeLaIsla.forEach({unPajaro => unPajaro.enojarseUnasVeces(unosCerditos)})
	}
	
	method fiestaSorpresa(unosHomenajeados) {
		unosHomenajeados.forEach({unPajaro => unPajaro.enojarse()})
	}
	
	method serieDeEventosDesafortunados() {
		
	}
	
	method atacarIslaCerdito() {
		pajarosDeLaIsla.map({unPajaro => unPajaro.atacarPrimerObstaculoDeLaIslaCerdito()})
	}
	
	method seRecuperaronLosHuevos() {
		return islaCerdito.sinObstaculos()
	}
	
	method incorporarPajaros() {
		pajarosDeLaIsla.add(new Pajaro())
	}
	
}

object islaCerdito inherits Isla {
	
	var property obstaculos = []
		
	method eliminarObstaculo() {
		obstaculos.remove(self.primerObstaculo())
	}
	
	method primerObstaculo() {
		return obstaculos.head()
	}
	
	method sinObstaculos() {
		return obstaculos.size() == 0
	}
	
}