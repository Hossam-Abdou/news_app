import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import '../blocs/system_cubit.dart';
import '../screens/home_screen.dart';

class AppRoot extends StatelessWidget {
final isDark;


AppRoot(this.isDark);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers:
        [
          BlocProvider(create: (context) => SystemCubit()..changeMode(mode:isDark)..getBusiness()..getScience()..getSport())
        ],
        child: BlocConsumer<SystemCubit, SystemState>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = SystemCubit.get(context);
            return MaterialApp(
                theme: ThemeData(
                    appBarTheme: AppBarTheme(color: Color(0xff7985ff)),
                    floatingActionButtonTheme: FloatingActionButtonThemeData(
                        backgroundColor: Color(0xff7985ff)),
            bottomNavigationBarTheme: const BottomNavigationBarThemeData(
              selectedItemColor:Color(0xff7985ff) ,
            ),
                    colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blueGrey)
                ),
                darkTheme: ThemeData(
                  primarySwatch: Colors.deepOrange,
                  scaffoldBackgroundColor: HexColor('333739'),
                  bottomNavigationBarTheme: BottomNavigationBarThemeData(
                      selectedItemColor: const Color(0xff7985ff),
                      unselectedItemColor: Colors.grey[500],
                      elevation: 20.0,
                      backgroundColor: HexColor('333739')
                  ),

                  appBarTheme: AppBarTheme(

                      backgroundColor: Color(0xFF333739),
                      titleTextStyle: TextStyle(fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                      systemOverlayStyle: SystemUiOverlayStyle(
                          statusBarIconBrightness: Brightness.light,
                          statusBarColor: Color(0xff333739)),
                      elevation: 0.0,
                      iconTheme: IconThemeData(color: Colors.white)
                  ),
                ),
                themeMode: cubit.dark? ThemeMode.dark:ThemeMode.light,
                debugShowCheckedModeBanner: false,
                home: HomeScreen()
            );
          },
        )
    );
  }
}
