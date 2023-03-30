import 'dart:convert';

import 'package:flutter_gif_get/data/consts.dart';
import 'package:http/http.dart' as http;

class FetchHelper {
  Future<List<String>> fetchImages() async {
    const fullUri = 'https://$baseUrl?api_key=$apiKey&limit=$limit';
    final uri = Uri.parse(fullUri);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      final images = (result['data'] as List<dynamic>)
          .map((e) => e['images']['original']['url'] as String)
          .toList();
      return images;
    } else {
      throw Exception();
    }
  }
}
