import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:khedma/entities/SavaData.dart';

import '../entities/User.dart';

class UserService {
  final String apiUrl =
      'http://localhost:8080/auth'; // L'URL de votre API Gateway

  Future<User> saveUser(User user) async {
    try {
      final response = await http.post(
        Uri.parse('$apiUrl/register'),
        // Point de terminaison pour sauvegarder les détails du profil
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(
            user.toJson()), // Convertir les détails du profil en JSON
      );

      if (response.statusCode == 200) {
        // Si le serveur a renvoyé une réponse OK
        print('User enregistré avec succès');
        print(response.body);
        return User.fromJson(json
            .decode(response.body)); // Convertir la réponse JSON en objet User
      } else {
        throw Exception(
            'Échec de l\'enregistrement du user: ${response.reasonPhrase}');
      }
    } catch (e) {
      print('Erreur de connexion: $e');
      throw Exception('Erreur de connexion: $e');
    }
  }
  Future<bool> authenticate(String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse('$apiUrl/authenticate'),
        // Point de terminaison pour l'authentification de l'utilisateur
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(
            {'username': email, 'password': password}), // Convertir en JSON
      );

      if (response.statusCode == 200) {
        // Si le serveur a renvoyé une réponse OK
        print('Authentification réussie');
        print(response.body);
        // get the access token and refresh token from the response
        Map<String, dynamic> data = json.decode(response.body);
        String accessToken = data['accessToken'];
        String refreshToken = data['refreshToken'];
        // store the access token and refresh token in shared preferences
        // for future use
        saveUserData("accessToken", accessToken);
        saveUserData("refreshToken", refreshToken);
        return true;
      } else {
        throw Exception(
            'Échec de l\'authentification: ${response.reasonPhrase}');
      }
    } catch (e) {
      print('Erreur de connexion: $e');
      throw Exception('Erreur de connexion: $e');
    }
  }

}
