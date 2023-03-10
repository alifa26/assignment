import 'package:meta/meta.dart';

@immutable
abstract class AppState {}

class Empty extends AppState {}

class GetUserLodingLoadingState extends AppState {}
class GetUserLodingSuccState extends AppState {}
class GetUserLodingErrorState extends AppState {}

class GetQuestionsLodingLoadingState extends AppState {}
class GetQuestionsLodingSuccState extends AppState {}
class GetQuestionsLodingErrorState extends AppState {}