import 'Adresse.dart';

class ProfileDetails {
  final int userId;
  final String? dateNaissance;
  final Adresse? adressePostale;  // Utilisation de la classe Adresse
  final String? domaineActivite;
  final String? nomSociete;
  final int? numTel;
  final int? rib;
  final String? kbis;
  final String? garantieDecennale;
  final String? eiplome;
  final String? experience;
  final String? labelQualite;
  final String? certifications;

  final Map<String, dynamic>? others;

  ProfileDetails({
    required this.userId,
    this.dateNaissance,
    this.adressePostale,
    this.domaineActivite,
    this.nomSociete,
    this.numTel,
    this.rib,
    this.kbis,
    this.garantieDecennale,
    this.eiplome,
    this.experience,
    this.labelQualite,
    this.certifications,
    this.others,
  });

  factory ProfileDetails.fromJson(Map<String, dynamic> json) {
    return ProfileDetails(
      userId: json['userId'],
      dateNaissance: json['dateNaissance'],
      adressePostale: json['adressePostale'] != null
          ? Adresse.fromJson(json['adressePostale'])  // Conversion du JSON en Adresse
          : null,
      domaineActivite: json['domaineActivite'],
      nomSociete: json['nomSociete'],
      numTel: json['numTel'],
      rib: json['rib'],
      kbis: json['kbis'],
      garantieDecennale: json['garantieDecennale'],
      eiplome: json['eiplome'],
      experience: json['experience'],
      labelQualite: json['labelQualite'],
      certifications: json['certifications'],
      others: json['others'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'dateNaissance': dateNaissance,
      'adressePostale': adressePostale?.toJson(), // Conversion d'Adresse en JSON
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
      'others': others,
    };
  }
}
