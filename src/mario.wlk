import wollok.game.*

object juego {

	method iniciar() {
		game.title("Mario el ahorrista")
		game.width(11)
		game.height(7)
		game.addVisual(mario)
		game.addVisual(peso)
		game.addVisual(unDolar)
		game.addVisual(flor)
		game.addVisual(balanza)
		game.start()
	}

}

object mario {

	var position = game.center()
	var pesosAhorrados = 0

	method levantar(moneda) {
		position = moneda.position()
		pesosAhorrados += moneda.valor()
		game.removeVisual(moneda)
	}

	method mostrarAhorros() {
		game.say(mario, "Junte " + pesosAhorrados + " pesos.")
	}
	
	method ahorros() = pesosAhorrados
	
	method image() = "mario.png"

}

object peso {

	var valor = 5
	var position = game.center().right(2)

	method valor() = valor

	method position() = position

	method image() = "peso.png"

}

object unDolar {

	var position = game.center().left(2)

	method valor() = banco.cotizacion()

	method position() = position

	method image() = "dolar.png"

}

object banco {

	var cotizacion = 45
	
	method cotizacion() = cotizacion

	method corridaBancaria(){
		cotizacion = 55
		balanza.desbalancear()
	}

	method situacionNormal(){
		cotizacion = 45
		balanza.balancear()
	}

}

object flor {

	var position = game.center().up(2)

	method position() = position

	method image() = "flor.png"

}


object balanza {
	var imagen = "balanceado.png"
	
	method balancear() { 
		imagen = "balanceado.png"
		game.say(balanza, "El valor del dolar se estabiliza.")
	}
	
	method desbalancear() { 
		imagen = "desbalanceado.png"
		game.say(balanza, "Hay corrida! Todos a comprar dolares!")
	}
	
	method position() = game.center().down(3)
	
	method image() = imagen
}

