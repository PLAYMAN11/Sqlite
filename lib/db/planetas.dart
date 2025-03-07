class Planetas {
  int? id;
  String? nombre;
  double? distSol, radio;

  Planetas(this.id, this.nombre, this.distSol, this.radio);

  Planetas.deMapa(Map<String, dynamic> planeta) {
    id = planeta["id"];
    nombre = planeta["nombre"];
    distSol = planeta["distSol"];
    radio = planeta["radio"];
  }
  Map<String, dynamic> aMapa() {
    return {"id": id, "nombre": nombre, "distSol": distSol, "radio": radio};
  }
}
