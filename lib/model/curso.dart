class Curso {
  String nombre;
  String codigo;

  Curso({this.nombre, this.codigo});

  String get curso_Nombre {
    return nombre;
  }

  void set curso_Nombre(String nombre) {
    this.nombre;
  }

  String get curso_Codigo {
    return nombre;
  }

  void set curso_Codigo(String codigo) {
    this.codigo;
  }

  @override
  String toString() => 'Curso nombre=$nombre codigo=$codigo';
}
