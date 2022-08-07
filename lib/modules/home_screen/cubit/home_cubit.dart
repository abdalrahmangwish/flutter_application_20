import 'package:bloc/bloc.dart';
import 'package:flutter_application_20/models/home_model/home_model.dart';
import 'package:flutter_application_20/shared/network/remote/http_helper.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  List<Hits>? lh;

  HttpHelper helper = new HttpHelper();
  void getData() async {
    lh = await helper.getApi();
    emit(HomeLoadedState());
    emit(HOmeLoadingState());
    print(lh);
  }
}
