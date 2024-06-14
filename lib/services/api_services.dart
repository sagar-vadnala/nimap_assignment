import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:nimap_assignment/model/model.dart';

class ApiService {
  final String apiUrl = "https://testffc.nimapinfotech.com/testdata.json";

  Future<AllRecord> fetchRecords() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));
      
      if (response.statusCode == 200) {
        return AllRecord.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Failed to load records: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load records: $e');
    }
  }
}
