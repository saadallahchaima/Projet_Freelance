import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:khedma/Services/JWTService.dart';
import 'package:path_provider/path_provider.dart';

import 'SharedPrefService.dart';

class MinIOService {
  final String apiUrl =
      'http://localhost:8080/minio'; // L'URL de votre API Gateway
  JWTService jwtService = JWTService();
  SharedPrefService sharedPrefService = SharedPrefService();

  Future<String> saveFileToServer(String bucketName, File file) async {
    var request = http.MultipartRequest('POST', Uri.parse('$apiUrl/upload'));
    String accessToken = await sharedPrefService.readUserData('accessToken');
    // get the username from the aceesstoken
    print('accessToken: $accessToken');

    Map<String, dynamic> payload = jwtService.getUsernameFromToken(accessToken);
    print('payload: $payload');
    String username = jwtService.getUsernameFromToken(accessToken)['sub'];
    print('username: $username');
    //generate a random object name starting with username
    String objectName = '$username-${DateTime.now().millisecondsSinceEpoch}';
    print('objectName: $objectName');

    request.fields['bucketName'] = bucketName;
    request.fields['objectName'] = objectName;

    request.headers['Authorization'] = 'Bearer $accessToken';
    request.files.add(await http.MultipartFile.fromPath('file', file.path,
        contentType: MediaType('application', 'octet-stream')));

    var response = await request.send();

    if (response.statusCode == 200) {
      print('File uploaded successfully');
      return ('${bucketName}_$objectName');
    } else {
      throw Exception('Failed to upload file: ${response.reasonPhrase}');
    }
  }

  Future<File> LoadFileFromServer(String bucketName, String objectName) async {
    String accessToken = await sharedPrefService.readUserData('accessToken');
    var response = await http.get(
      Uri.parse(
          '$apiUrl/download?bucketName=$bucketName&objectName=$objectName'),
      headers: {
        'Authorization': 'Bearer $accessToken',
      },
    );

    if (response.statusCode == 200) {
      // Get the directory to save the file
      print('File downloaded successfully');
      Directory appDocDir = await getApplicationDocumentsDirectory();
      String filePath = '${appDocDir.path}/$objectName';
      print('filePath: $filePath');
      // Save the file
      File file = File(filePath);
      await file.writeAsBytes(response.bodyBytes);
      return file;
    } else {
      throw Exception('Failed to load file: ${response.reasonPhrase}');
    }
  }
}
