class UserProfile {
  final String dateNaissance;
  final String adressePostale;
  final String domaineActivite;
  final String nomSociete;
  final String numTel;
  final String rib;
  final String kbis;
  final String garantieDecennale;
  final String eiplome;
  final String experience;
  final String labelQualite;
  final String certifications;

  UserProfile({
    required this.dateNaissance,
    required this.adressePostale,
    required this.domaineActivite,
    required this.nomSociete,
    required this.numTel,
    required this.rib,
    required this.kbis,
    required this.garantieDecennale,
    required this.eiplome,
    required this.experience,
    required this.labelQualite,
    required this.certifications,
  });

  Map<String, dynamic> toJson() {
    return {
      'dateNaissance': dateNaissance,
      'adressePostale': adressePostale,
      'domaineActivite': domaineActivite,
      'nomSociete': nomSociete,
      'numTel': numTel,
      'rib': rib,
      'kbis': kbis,
      'garantieDecennale': garantieDecennale,
        'eiplome': eiplome,
      'experience': experience,
      'labelQualite': labelQualite,
      'certifications': certifications,
    };
  }
}

