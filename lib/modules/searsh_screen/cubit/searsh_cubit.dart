import 'package:bloc/bloc.dart';
import 'package:flutter_application_20/models/searsh_model/searsh_model.dart';
import 'package:flutter_application_20/shared/network/remote/http_helper.dart';
import 'package:meta/meta.dart';

part 'searsh_state.dart';

class SearshCubit extends Cubit<SearshState> {
  SearshCubit() : super(SearshInitial());
  HttpHelper helper = new HttpHelper();
  List<Photos>? sl;
  String? query = '';
  void getsearsh() async {
    sl = await helper.getDataSearsh(query!);
    emit(SearshLoadedState());
    emit(SearshLoadingState());
  }

  void clearList() {
    sl = null;
    emit(SearshLoadedState());
    emit(SearshLoadingState());
  }
}
