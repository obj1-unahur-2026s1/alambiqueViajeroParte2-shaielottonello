object alambique {
    var rapido = true
    var combustible = 20
    const consumoPorViaje = 10
    var patente = "AB123JK"
    method puedeFuncionar() = combustible >= consumoPorViaje
    method desgaste() {
        combustible = combustible - consumoPorViaje
    }
    method rapido() = rapido
    method patenteValida() = patente.head() == "A"
    method tiempoQueTarda() = 10
}

object antigualla {
    var property gangsters = ["Al", "Tony", "Luigi", "Don", "Fredo"]
    method puedeFuncionar() = gangsters.size().even()
    method rapido() {
        const totalLetras = gangsters.sum({ nombre => nombre.size() })
        return totalLetras > 20
    }
    method desgaste(){
        if (!gangsters.isEmpty()) {
            gangsters.remove(gangsters.last()) // Saca al último gangster
        }
    }
    method patenteValida() = chatarra.rapido()
    method tiempoQueTarda() = 10 + gangsters.size()
    method subirGangster(unNombre) { gangsters.add(unNombre) }
    method bajarGangster(unNombre) { gangsters.remove(unNombre) }
}
object chatarra {
    var cañones = 10
    var municiones = "ACME"
    method puedeFuncionar() = municiones == "ACME" and cañones.between(6,12)
    method rapido() = municiones.size() < cañones
    method desgaste(){
        cañones = (cañones / 2).roundUp(0)
        if (cañones < 5 )
          municiones = municiones + " Obsoleto"
    }
    method patenteValida() = municiones.take(4) == "ACME" 
    method cañones() = cañones
    method tiempoQueTarda() = 10 + (cañones / 2)
}

object convertible {
    const property formasPosibles = [antigualla, alambique, chatarra, moto] 
    method cambiarDeForma() {
        const primero = formasPosibles.first()
        formasPosibles.remove(primero)
        formasPosibles.add(primero)
    }
    method convertido() = formasPosibles.first() 
    method puedeFuncionar() = self.convertido().puedeFuncionar() 
    method rapido() = self.convertido().rapido() 
    method patenteValida() = self.convertido().patenteValida() 
    method tiempoQueTarda() = self.convertido().tiempoQueTarda() + 1 
    
    method desgaste() {
        self.convertido().desgaste() 
    }
}

object moto {
    method rapido() = true
    method puedeFuncionar() = not self.rapido()
    method desgaste() { }
    method patenteValida() = false
    method tiempoQueTarda() = 12
}

object autoDePierre {
    var intentosDeTrampa = 3
    method puedeFuncionar() = true
    method rapido() = true 
    method desgaste(){
        intentosDeTrampa = intentosDeTrampa + 1
    }
    method patenteValida() = true
    method tiempoQueTarda() = 20 + (intentosDeTrampa * 2)
}

