import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_20/injection.dart';
import 'package:flutter_application_20/modules/searsh_screen/cubit/searsh_cubit.dart';
import 'package:flutter_application_20/shared/components/components.dart';

class SearshDetails extends StatefulWidget {
  final index;
  const SearshDetails({super.key, this.index});

  @override
  State<SearshDetails> createState() => _SearshDetailsState();
}

class _SearshDetailsState extends State<SearshDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            child: Image.network(
              sl<SearshCubit>().sl![widget.index].src!.large2x ?? "",
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
                      child: const Icon(
                        Icons.download,
                        color: Colors.grey,
                        size: 40,
                      ))),
            ),
          )
        ],
      ),
    );
    ;
  }
}
