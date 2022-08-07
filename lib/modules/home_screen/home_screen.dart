import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_20/injection.dart';
import 'package:flutter_application_20/modules/details_screen/details_screen.dart';
import 'package:flutter_application_20/modules/home_screen/cubit/home_cubit.dart';
import 'package:flutter_application_20/modules/searsh_screen/cubit/searsh_cubit.dart';
import 'package:flutter_application_20/modules/searsh_screen/searsh_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HOmeScreen extends StatefulWidget {
  const HOmeScreen({super.key});

  @override
  State<HOmeScreen> createState() => _HOmeScreenState();
}

class _HOmeScreenState extends State<HOmeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    sl<HomeCubit>().getData();
  }

  var nameQuery = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20.0,
            ),
            const Text(
              "wallpaper hup",
              style: TextStyle(color: Colors.black26, fontSize: 30.0),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(20.0)),
              child: TextFormField(
                controller: nameQuery,
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "seaerch wallpaper",
                    prefix: Icon(Icons.search)),
                onFieldSubmitted: ((nameQuery) {
                  sl<SearshCubit>().query = nameQuery;
                  sl<SearshCubit>().getsearsh();
                  print(nameQuery);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SearshScreen()),
                  );
                }),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Expanded(
              child: BlocBuilder(
                bloc: sl<HomeCubit>(),
                builder: ((context, state) {
                  return sl<HomeCubit>().lh != null
                      ? Container(
                          child: GridView.builder(
                              itemCount: sl<HomeCubit>().lh!.length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                childAspectRatio: 0.6,
                                crossAxisCount: 2,
                                crossAxisSpacing: 6.0,
                                mainAxisSpacing: 6.0,
                              ),
                              itemBuilder: ((context, index) {
                                return InkWell(
                                  child: HomeList(
                                    image: sl<HomeCubit>()
                                            .lh![index]
                                            .webformatURL ??
                                        "",
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              DetailsScreen(index)),
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
      ),
    );
  }
}

class HomeList extends StatelessWidget {
  HomeList({super.key, required this.image, this.index});
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
