// git_data_event.dart

part of 'git_data_bloc.dart';

@immutable
abstract class GitDataEvent {}

class GetData extends GitDataEvent {}

class TogglePasswordVisibility extends GitDataEvent {}

class LogIn extends GitDataEvent {
  final UserModel user;

  LogIn({required this.user});
}

class SearchInNewsInBack extends GitDataEvent {
  final String lexem;

  SearchInNewsInBack({required this.lexem});
}
