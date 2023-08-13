import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import '../model/business_model.dart';
import '../model/science_model.dart';
import '../model/sport_model.dart';
import '../screens/business_screen.dart';
import '../screens/science_screen.dart';
import '../screens/sports_screen.dart';
import '../service/dio_helper/dio_helper.dart';
import '../service/sp_helper/sp_helper.dart';
import '../service/sp_helper/sp_keys.dart';

part 'system_state.dart';

class SystemCubit extends Cubit<SystemState> {
  SystemCubit() : super(SystemInitial());

  static SystemCubit get(context) => BlocProvider.of(context);

  int currentIndex=0;

  List<BottomNavigationBarItem> bars= const[
    BottomNavigationBarItem(icon: Icon(Icons.business_sharp),label:'Business'),
    BottomNavigationBarItem(icon: Icon(Icons.science),label:'Science'),
    BottomNavigationBarItem(icon: Icon(Icons.sports_baseball),label:'Sports'),
  ];
  void barIndex(int index) {
    currentIndex=index;
    emit(CurrentIndex());
  }

  List<Widget>Screens= [
    BusinessScreen(),
    ScienceScreen(),
    SportScreen()
  ];

  BusinessModel? businessModel;
 Future<void> getBusiness() async{

    await DioHelper.getData(
        url: 'v2/top-headlines',
        query:{
          'country':'eg',
          'category':'business',
          'apiKey': 'e32c5033bb3e4dcfa93cf985b0c06c96',
        }).then((value) {
      businessModel = BusinessModel.fromJson(value.data);
      emit(GetBusinessSuccess());
    }).catchError((error) {
      print(error.toString());
      emit(GetBusinessError());
    });
  }

  ScienceModel? scienceModel;
  Future<void> getScience() async{

    await DioHelper.getData(
        url: 'v2/top-headlines',
        query:{
          'country':'eg',
          'category':'science',
          'apiKey': 'e32c5033bb3e4dcfa93cf985b0c06c96',
        }).then((value) {
      scienceModel = ScienceModel.fromJson(value.data);
      emit(GetScienceSuccess());
    }).catchError((error) {

      print(error.toString());
      emit(GetScienceError());
    });
  }


  SportModel? sportModel;
  Future<void> getSport() async{

    await DioHelper.getData(
        url: 'v2/top-headlines',
        query:{
          'country':'eg',
          'category':'sport',
          'apiKey': 'e32c5033bb3e4dcfa93cf985b0c06c96',
        }).then((value) {
      sportModel = SportModel.fromJson(value.data);
      emit(GetSportSuccess());
    }).catchError((error) {

      print(error.toString());
      emit(GetSportError());
    });
  }
  bool dark=false;
  void changeMode({bool? mode}){
    if(mode!=null)
    {
      dark=mode;
      emit(ModeSuccess());
    }else
    {
      dark=!dark;
      SharedPrefrenceHelper.saveData(key:'darkMode', value: dark);
      emit(ModeSuccess());
    }

  }


}
