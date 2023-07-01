import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constants.dart';

class GlobalNav {
  late final SharedPreferences? sharedPreferences;

  static final GlobalNav instance = GlobalNav._internal();

  factory GlobalNav() {
    return instance;
  }

  GlobalNav._internal();

  init() async {
    sharedPreferences = await SharedPreferences.getInstance();
    setUpShared(sharedPreferences!);
  }
}

void setUpShared(SharedPreferences sharedPreferences) {
  // User_id the unique identifier of the user
  bool? truthSettings = sharedPreferences.getBool(AppConstants.truthSettingsKey);

  if (truthSettings == null) sharedPreferences.setBool(AppConstants.truthSettingsKey, AppConstants.truthSettings);
}
