import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_20/injection.dart';
import 'package:flutter_application_20/models/searsh_model/searsh_model.dart';
import 'package:flutter_application_20/modules/details_screen/details_screen.dart';
import 'package:flutter_application_20/modules/details_searsh_screen/details_searsh.dart';
import 'package:flutter_application_20/modules/home_screen/cubit/home_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'cubit/searsh_cubit.dart';

class SearshScreen extends StatefulWidget {
  SearshScreen({super.key});

  @override
  State<SearshScreen> createState() => _SearshScreenState();
}

class _SearshScreenState extends State<SearshScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    sl<SearshCubit>().query;
    print(sl<SearshCubit>().query);
    sl<SearshCubit>().getsearsh();
    print(sl<SearshCubit>().sl);
  }
  // void dispose() {
  //   // TODO: implement dispose
  //   super.dispose();
  //   sl<SearshCubit>().sl;
  //   print(sl<SearshCubit>().sl);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 20.0,
          ),
          Expanded(
            child: BlocBuilder(
              bloc: sl<HomeCubit>(),
              builder: ((context, state) {
                return sl<SearshCubit>().sl != null
                    ? Container(
                        child: GridView.builder(
                            itemCount: sl<SearshCubit>().sl!.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              childAspectRatio: 0.6,
                              crossAxisCount: 2,
                              crossAxisSpacing: 6.0,
                              mainAxisSpacing: 6.0,
                            ),
                            itemBuilder: ((context, index) {
                              return InkWell(
                                child: SearshList(
                                  image: sl<SearshCubit>()
                                          .sl![index]
                                          .src!
                                          .large2x ??
                                      "",
                                ),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SearshDetails(
                                              index: index,
                                            )),
                                  );
                                },
                              );
                            })),
                      )
                    : Center(child: CircularProgressIndicator());
              }),
            ),
          )
        ],
      ),
    );
  }
}

class SearshList extends StatelessWidget {
  SearshList({super.key, required this.image, this.index});
  late String image;
  int? index;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(
              image,
            )),
      ),
    );
  }
}
