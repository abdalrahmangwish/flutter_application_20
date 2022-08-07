import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_20/injection.dart';
import 'package:flutter_application_20/models/home_model/home_model.dart';
import 'package:flutter_application_20/modules/home_screen/cubit/home_cubit.dart';
import 'package:flutter_application_20/shared/components/components.dart';

class DetailsScreen extends StatefulWidget {
  final index;
  DetailsScreen(
    this.index, {
    super.key,
  });

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            child: Image.network(
              sl<HomeCubit>().lh![widget.index].webformatURL ?? "",
              fit: BoxFit.fill,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Align(
              alignment: Alignment.bottomRight,
              child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(100)),
                      color: Colors.white),
                  child: TextButton(
                      onPressed: () {},
                      child: Icon(
                        Icons.download,
                        color: Colors.grey,
                        size: 40,
                      ))),
            ),
          )
        ],
      ),
    );
  }
}
