import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicinestore/App/app.dart';
import 'package:medicinestore/Bloc/bloc_observer/BlocObservable.dart';
import 'package:medicinestore/Util/SharedPreferences/SharedPreferencesHelper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppSharedPreferences.init();
  
  // Role.init();
  Bloc.observer = BlocObservable();
  print("token is ${AppSharedPreferences.getToken}");
  print("Language is ${AppSharedPreferences.getArLang}");
  // print("Role Id is ${AppSharedPreferences.getRoleId}");
  // print("Team Id is ${AppSharedPreferences.getTeamId}");

  runApp(const MyApp());
}

