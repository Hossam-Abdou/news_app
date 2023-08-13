import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/system_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SystemCubit, SystemState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = SystemCubit.get(context);
        return Scaffold(
          bottomNavigationBar: BottomNavigationBar(
              items: (cubit.bars),
              onTap: (index)
              {
                cubit.barIndex(index);
              },
              currentIndex: cubit.currentIndex,
          ),
          backgroundColor: Colors.grey.shade200,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: const Text('N e w s'),
            centerTitle: true,
            actions: [
              IconButton(
                  onPressed: ()
                  {
                    cubit.changeMode();
                  },
                  icon: Icon(Icons.brightness_6_rounded)
              )
            ],
          ),
          body:cubit.Screens[cubit.currentIndex]

        );


      },
    );

  }
}
