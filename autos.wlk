object  dominic {
  const autos = []

  method comprar(unAuto) {autos.add(unAuto)}

  method autosNoEnCondiciones () = autos.filter({a=> not a.enCondiciones()})
  method autosEnCondiciones () = autos.filter({a=> a.enCondiciones()})
  method mandarAutosAlTaller ()  {
    taller.recibirAutos(self.autosNoEnCondiciones())
  }
  method pruebaDeVelocidad() {
    autos.forEach({a => a.hacerPrueba()})
  }
  method venderAutos() {
    autos.clear()
  }
  method promedioVelocidad() = autos.sum({a=>a.velocidadMaxima()}) / autos.size()
  method masRapido() = self.autosEnCondiciones().max({a=> a.velocidadMaxima()})
  method hayUnAutoMuyRapido() = self.masRapido().velocidadMaxima() > 2 * self.promedioVelocidad() 

}

object taller {
  const autosAReparar = []
  method recibirAutos (listaDeAutos) {
    autosAReparar.addAll(listaDeAutos)
  }
  method repararAutos() {
    autosAReparar.forEach({a => a.reparar()})
    autosAReparar.clear()
  }
}

object ferrari {
  var motor = 87
  method enCondiciones() = motor >= 65
  method reparar() {motor = 100}
  method velocidadMaxima() = 110 + if(motor>75) 15 else 0
  method hacerPrueba() {motor = (motor - 30).max(0)}
}

object flechaRubi {
  var cantidadLitrosCombustible = 100
  var color = azul
  var property combustible = gasolina
  method enCondiciones () = 
      cantidadLitrosCombustible > combustible.nivelMinimo() &&
      color == rojo
  
  method hacerPrueba(){
    cantidadLitrosCombustible = (cantidadLitrosCombustible-5).max(0)}
  
  method reparar() {
    cantidadLitrosCombustible = cantidadLitrosCombustible * 2
    color = color.cambiarDeColor()
  }
  
  method velocidadMaxima(){
      return cantidadLitrosCombustible * 2 + combustible.calculoAdicional(cantidadLitrosCombustible)
  }
}

object gasolina {
  method nivelMinimo(nivel) = 85
  
  method calculoAdicional(litros) = 10
}

object nafta {
  method nivelMinimo(nivel) = 50
  
  method calculoAdicional(litros) = ((litros * 2)) * 0.10
}

object nitrogeno {
  method nivelMinimo(nivel) = 0
  
  method calculoAdicional(litros) = litros * 2 * 10
}

object azul {
  method cambiarDeColor() = verde
}

object verde {
  method cambiarDeColor() = rojo
}

object rojo {
  method cambiarDeColor ()= azul
}

object intocable {
 var property enCondiciones = true
 method hacerPrueba() {enCondiciones = false} 
 method velocidadMaxima() = 45
 method reparar(){
  enCondiciones = true
 }
}

