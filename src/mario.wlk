import wollok.game.*

object juego {

	method iniciar() {
		game.title("Mario el ahorrista")
		game.width(7)
		game.height(7)
		game.addVisual(peso)
		game.addVisual(unDolar)
		game.addVisual(flor)
		game.addVisual(balanza)
		game.addVisual(mario)
		game.addVisual(cubo)
		game.start()
	}

}

object mario {

	var position = game.center()
	var pesosAhorrados = 0
	

	method levantar(cosa) {
		position = cosa.position()
		pesosAhorrados = pesosAhorrados + cosa.valor()
		game.say(mario, "Junte " + cosa.valor().toString())
		
	}

	method mostrarAhorros() {
		game.say(mario, "Junte " + pesosAhorrados + " pesos.")
	}
	
	method ahorros() = pesosAhorrados
	
	method image() { return "mario.png"}
	method position() { return position}
	method agrregar(monto)
	{pesosAhorrados*=monto}
	
	
}
object invertir
{
	method plazoFijo(persona)
	{
		persona.agrregar(persona.ahorros()*0.02)	
	}
	method debuck (persona)
	{
		persona.agrregar((((persona.ahorros()+banco.ahorros())/2)*0.1)) 	
	}
}
object peso {

	var valor = 5

	method valor() {return valor}

	method position() {return game.center().right(2)}
	method image() {return "peso.png"}

}

object unDolar {

	method valor() = banco.cotizacion()

	method position() {return game.center().left(2)}
	method image() {return "dolar.png"}

}

object banco {
	var fondos=100
	var cotizacion = 45
	var platainterna= 1000
	method cotizacion() {return cotizacion}

	method corrida(){
		cotizacion = 57
		balanza.desbalancear()
	}

	method tranquilidad(){
		cotizacion = 45
		balanza.balancear()
	}
	method ahorros()
	{
		return fondos
	}
}

object flor {

	method valor() {return 0}

	method position() {return game.center().up(2)}
	method image() {return "flor.png"}

}


object balanza {
	const imagenBalanceada ="balanceado.png" 
	var imagen = imagenBalanceada 
	
	method balancear() { 
		imagen = imagenBalanceada 
	}
	
	method desbalancear() { 
		imagen = "desbalanceado.png"
	}
	
	method position() {return game.center().down(2)}
	method image() {return imagen}
}
object cubo {

	var valor = 50

	method valor() {return valor}

	method position() {return game.center().right(2).up(2)}
	method image() {return "cubo mario.png"}

}
