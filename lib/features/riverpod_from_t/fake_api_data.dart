import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learn_flutter_by_examples/features/riverpod_from_t/network.dart';

class EmployeeModel {
  final String id;
  final String name;
  final String email;
  final String role;

  EmployeeModel({
    required this.id,
    required this.name,
    required this.email,
    required this.role,
  });

  factory EmployeeModel.fromJson(Map<String, dynamic> json) {
    return EmployeeModel(
      id: json['id'].toString(),
      name: json['name'],
      email: json['email'],
      role: json['role'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name, 'email': email, 'role': role};
  }
}

class ApiService {
  Future<String> getGreetings() async {
    await Future.delayed(Duration(seconds: 5));
    if (Random().nextDouble() < 0.3) {
      throw Exception('Error Occured while fetching the data');
    }
    return 'Hey, I am API Data';
  }

  Stream<int> tick() {
    return Stream.periodic(const Duration(seconds: 1), (count) => count);
  }

  Stream<int> tickWithError() async* {
    for (int i = 0; i < 5; i++) {
      await Future.delayed(const Duration(seconds: 1));
      yield i;
    }
    throw Exception("Exception raised");
  }
}

class EmployeeService {
  final Dio _dio = DioClient().dio;

  static const int pageSize = 10;

  Future<List<EmployeeModel>> fetchEmployees({required int offset}) async {
    try {
      final response = await _dio.get(
        '/employees',
        queryParameters: {'limit': pageSize, 'offset': offset},
      );

      final Map<String, dynamic> json = response.data;
      final List list = json['data'] ?? [];

      return list.map((e) => EmployeeModel.fromJson(e)).toList();
    } on DioException catch (e) {
      throw Exception(
        e.response?.data?['message'] ?? 'Failed to fetch employees',
      );
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }
}

final apiServiceProvider = Provider((_) => ApiService());
final employeeServiceProvider = Provider((_) => EmployeeService());
