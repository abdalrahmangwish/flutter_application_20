part of 'searsh_cubit.dart';

@immutable
abstract class SearshState {}

class SearshInitial extends SearshState {}

class SearshLoadedState extends SearshState {}

class SearshLoadingState extends SearshState {}
