import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl;

  ApiService({required this.baseUrl});

  Future<bool> submitAddressData(Map<String, dynamic> addressData, String token) async {
    final response = await http.post(
      Uri.parse('$baseUrl/profileDetail'), // Modifiez l'URL en fonction de votre configuration
      headers: {
        'Authorization': 'Bearer $token', // Ajouter le token d'authentification si nécessaire
        'Content-Type': 'application/json',
      },
      body: jsonEncode(addressData),
    );

    if (response.statusCode == 200) {
      // Réponse réussie
      return true;
    } else {
      // Gérer les erreurs
      print('Erreur lors de la soumission des données : ${response.statusCode}');
      return false;
    }
  }
}
