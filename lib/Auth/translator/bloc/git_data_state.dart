// git_data_state.dart

part of 'git_data_bloc.dart';

@immutable
abstract class GitDataState {}

class GitDataInitial extends GitDataState {}

class GitDataIsSuccess extends GitDataState {
  final List<Newsmodel> news;

  GitDataIsSuccess({required this.news});
}

class GitDataIsFailed extends GitDataState {}

class PasswordVisible extends GitDataState {}

class PasswordHidden extends GitDataState {}

class SuccessToLogIn extends GitDataState {}

class FailedToLogIn extends GitDataState {}

class SearchResult extends GitDataState {
  final List<Newsmodel> news;

  SearchResult({required this.news});
}

class LoadingState extends GitDataState {}
