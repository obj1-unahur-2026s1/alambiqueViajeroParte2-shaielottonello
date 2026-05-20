import vehiculos.*
import lugares.*
import personas.*

object carrera {
    const vehiculos = #{}
    const property inscriptos = #{}
    const property rechazados = #{}
    var ciudad = buenosAires

    method presentarVehiculo(unVehiculo) {
        vehiculos.add(unVehiculo)
        self.evaluarInscripcion(unVehiculo)
    }

    method evaluarInscripcion(unVehiculo) {
        if (ciudad.puedeLlegar(unVehiculo)) {
            inscriptos.add(unVehiculo)
            rechazados.remove(unVehiculo) // sacarlo de rechazados si estaba ahí
        } else {
            rechazados.add(unVehiculo)
            inscriptos.remove(unVehiculo) // sacarlo de inscriptos si estaba ahí
        }
    }

    method cambiarSede(nuevaCiudad) {
        ciudad = nuevaCiudad
        inscriptos.clear()
        rechazados.clear()
        vehiculos.forEach({ v => self.evaluarInscripcion(v) })    
    }                

    method irALaCiudad() {
        inscriptos.forEach({v => v.desgaste()})
    }

    method ganador() {
        if (inscriptos.isEmpty()) {
            self.error("No hay vehículos inscriptos para determinar un ganador")
        }
        return inscriptos.min({ v => v.tiempoQueTarda() })
    }
}

