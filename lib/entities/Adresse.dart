class Adresse {
  final String rue;
  final String ville;
  final String codePostal;
  final String pays;

  Adresse({
    required this.rue,
    required this.ville,
    required this.codePostal,
    required this.pays,
  });

  // Méthode pour convertir un JSON en Adresse
  factory Adresse.fromJson(Map<String, dynamic> json) {
    return Adresse(
      rue: json['rue'],
      ville: json['ville'],
      codePostal: json['codePostal'],
      pays: json['pays'],
    );
  }

  // Méthode pour convertir Adresse en JSON
  Map<String, dynamic> toJson() {
    return {
      'rue': rue,
      'ville': ville,
      'codePostal': codePostal,
      'pays': pays,
    };
  }
}
