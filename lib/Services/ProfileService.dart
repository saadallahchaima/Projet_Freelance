import 'dart:convert';
import 'package:http/http.dart' as http;

import '../entities/ProfileDetails.dart';

class ProfileService {
  final String apiUrl = 'http://localhost:9090/profileDetail'; // L'URL de votre API Gateway

  Future<ProfileDetails> saveProfileDetails(ProfileDetails profileDetails) async {
    final response = await http.post(
      Uri.parse('$apiUrl/save'), // Point de terminaison pour sauvegarder les détails du profil
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(profileDetails.toJson()), // Convertir les détails du profil en JSON
    );

    if (response.statusCode == 200) {
      // Si le serveur a renvoyé une réponse OK
      return ProfileDetails.fromJson(json.decode(response.body)); // Convertir la réponse JSON en objet ProfileDetails
    } else {
      throw Exception('Échec de l\'enregistrement du profil: ${response.reasonPhrase}');
    }
  }
}
