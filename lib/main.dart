import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:last_news_app/service/dio_helper/dio_helper.dart';
import 'package:last_news_app/service/sp_helper/sp_helper.dart';
import 'package:last_news_app/service/sp_helper/sp_keys.dart';
import 'package:last_news_app/src/app_root.dart';
import 'bloc_observer.dart';

main()async {

  WidgetsFlutterBinding.ensureInitialized();
  await DioHelper.init();
  await SharedPrefrenceHelper.init();
  Bloc.observer = MyBlocObserver();
  var isDark=SharedPrefrenceHelper.getData(key:'darkMode');
  runApp(AppRoot(isDark));

}