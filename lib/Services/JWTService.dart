
import 'dart:convert';

class JWTService {

  Map<String, dynamic> getUsernameFromToken(String accessToken) {
    final parts = accessToken.split('.');
    if (parts.length != 3) {
      throw Exception('Invalid token');
    }

    final payload = base64Url.decode(base64Url.normalize(parts[1]));
    final payloadMap = json.decode(utf8.decode(payload));

    if (payloadMap is! Map<String, dynamic>) {
      throw Exception('Invalid payload');
    }

    return payloadMap;
  }


}










