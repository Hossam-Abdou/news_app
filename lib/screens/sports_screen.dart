import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';
import '../blocs/system_cubit.dart';

class SportScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SystemCubit, SystemState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = SystemCubit.get(context);
        return Scaffold(
            body:  Directionality(
              textDirection: TextDirection.rtl,
              child: ListView.builder(
                  physics:const BouncingScrollPhysics(),
                  itemCount:  cubit.sportModel?.articles?.length ?? 0,
                  itemBuilder: (context, int index) =>
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Card(
                          color: Colors.white,
                          shape: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: const BorderSide(color: Colors.white)
                          ),
                          child: ListTile(
                              title: Text('${cubit.sportModel!.articles![index].title}',maxLines: 2,overflow:TextOverflow.ellipsis ),
                              subtitle: Text('${cubit.sportModel!.articles![index].author}'),
                              trailing:
                              InkWell(
                                onTap: () {
                                  launch('${cubit.sportModel!.articles![index].url}');
                                },
                                child: const Padding(
                                  padding: EdgeInsets.only(top: 16.0),
                                  child: Icon(
                                      Icons.arrow_forward,
                                      color: Color(0xff7985ff),
                                      size: 35
                                  ),
                                ),
                              )
                          ),
                        ),
                      )
              ),
            ));

      },
    );

  }
}
