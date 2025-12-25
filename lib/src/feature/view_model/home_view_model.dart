import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:interview_task/core/service/connection_service/dio_client.dart';

import '../../../core/service/connection_service/dio_endpoints.dart';
import '../model/user_model.dart';

class HomeViewModel extends ChangeNotifier {
  List<User> users = [];
  bool isLoading = false;
  String? errorMessage;

  Future<void> getUser() async {
    log('getUser called');
    isLoading = true;
    notifyListeners();
    DioClientService().call(
      apiUrl: ApiEndPoint.users,
      reqType: DioRequestType.get,
      ifSucceed: (response) {
        users = List<User>.from(
          response.data.map((userJson) => User.fromJson(userJson)),
        );
        isLoading = false;
        filteredUsers = users;
        notifyListeners();
      },
      ifFailed: (error) {
        errorMessage = error.message.toString();
        log('Error: $errorMessage');
        isLoading = false;
        notifyListeners();
      },
    );
  }

  final TextEditingController searchController = TextEditingController();
  /// search user
  List<User> filteredUsers = [];
  void onSearch(String query) {
    if (query.isEmpty) {
      filteredUsers = users;
    } else {
      filteredUsers = users.where((user) {
        final name = user.name?.toLowerCase() ?? '';
        final email = user.email?.toLowerCase() ?? '';
        return name.contains(query.toLowerCase()) ||
            email.contains(query.toLowerCase());
      }).toList();
    }
    notifyListeners();
  }
}
