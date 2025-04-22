import 'dart:convert';
import 'package:flutter/services.dart';

class MockService {
  Future<List<dynamic>> getMockData(String fileName) async {
    final response = await rootBundle.loadString('mockup/$fileName');
    return jsonDecode(response);
  }
}