class Persona {
    Persona({
      this.persona,
      this.documento,
      this.tipoDocumento,
      this.nombreCompleto,
      this.idPerfil,
      this.nombrePerfil,
      this.clave,
      this.estado,
    });

    int persona;
    String documento;
    String tipoDocumento;
    String nombreCompleto;
    int idPerfil;
    String nombrePerfil;
    String clave;
    String estado;

    Map<String, dynamic> toJson() => {
      "persona": persona,
      "documento": documento,
      "tipoDocumento": tipoDocumento,
      "nombreCompleto": nombreCompleto,
      "idPerfil": idPerfil,
      "nombrePerfil": nombrePerfil,
      "clave": clave,
      "estado": estado,
    };

    factory Persona.fromJson(Map<String, dynamic> json) => Persona(
      persona: json['persona'],
      documento: json['documento'],
      tipoDocumento: json['tipoDocumento'],
      nombreCompleto: json['nombreCompleto'],
      idPerfil: json['idPerfil'],
      nombrePerfil: json['nombrePerfil'],
      clave: json['clave'],
      estado: json['estado']
    );
}
