class Alumno {
  String nombre;
  String matricula;
  String cursoInscrito;

  Alumno({this.nombre, this.matricula, this.cursoInscrito});

  String get alumno_Nombre {
    return nombre;
  }

  void set alumno_Nombre(String nombre) {
    this.nombre;
  }

  String get alumno_Matricula {
    return nombre;
  }

  void set alumno_Matricula(String matricula) {
    this.matricula;
  }

  String get alumno_CursoInscrito {
    return cursoInscrito;
  }

  void set alumno_CursoInscrito(String cursoInscrito) {
    this.cursoInscrito;
  }

  @override
  String toString() =>
      'Alumno nombre=$nombre matricula=$matricula nursoInscrito=$cursoInscrito';
}
