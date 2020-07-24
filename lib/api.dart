import 'dart:convert';
import 'package:http/http.dart' as http;
import 'models.dart';

class Api {
  static Future<List<JobItem>> fetchJobs(String search) async {
    final response = await http.get(
        'https://jobs.github.com/positions.json?description=$search&page=1');

    if (response.statusCode == 200) {
      var data = List<JobItem>();
      for (var value in (json.decode(response.body) as List)) {
        data.add(JobItem.fromJson(value));
      }
      return data;
    } else {
      throw Exception('Failed to load data');
    }
  }
}
