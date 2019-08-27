object pepita {
	var energia = 100

	method estaCansada() {
		return energia < 50
	}

	method vola(kms) {
		energia -= 10 + kms
	}

	method come(comida) {
		energia = energia + comida.energiaQueOtorga()
	}
	method estaFeliz(){
		return energia >= 500 && energia <= 1000
	}
	method cuantoQuiereVolar(){
		var distancia = energia / 5
		if (energia >= 300 && energia <= 400){
			distancia += 10
		}
		if ((energia % 20) == 0){
			distancia += 15
		}
		return distancia
	}
	method salirAComer(){
		self.vola(5)
		self.come(alpiste)
		self.vola(5)
	}
	method haceLoQueQuieras(){
		if (self.estaCansada()){
			self.come(alpiste)
		}
		if (self.estaFeliz()){
			self.vola(8)
		}
	}
}

object alpiste {
	var gramos = 10
	
	method energiaQueOtorga() { 
		return 4 * gramos
	}
	
	method gramos(nuevosGramos) {
		gramos = nuevosGramos
	}	
}

object manzana {
	method energiaQueOtorga() { 
		return 50
	}	
}

object mijo{
	var estaMojado = false
	//lo inicialize en false para que pueda usarse en caso de no definir de antemano si esta mojado o no con mojarse() o secarse()
	method energiaQueOtorga(){
		if (estaMojado){
			return 15
		}else{
			return 20
		}
	}
	method mojarse(){
		estaMojado = true
	}
	method secarse(){
		estaMojado = false
	}
}

object canelones{
	var salsa = false
	var queso = false
	//lo mismo que arriba, los puse en false por si se come unos canelones de una sin definir si tenian queso o salsa de antemano
	method energiaQueOtorga(){
		var energia = 20
		if (salsa){
			energia += 5
		}
		if (queso){
			energia += 7
		}
		return energia
	}
	method ponerSalsa(){
		salsa = true
	}
	method sacarSalsa(){
		salsa = false
	}
	method ponerQueso(){
		queso = true
	}
	method sacarQueso(){
		queso = false
	}
}

object roque{
	method entrenar(){
		pepita.vola(10)
		pepita.come(alpiste)
		pepita.vola(5)
		pepita.haceLoQueQuieras()
	}
}