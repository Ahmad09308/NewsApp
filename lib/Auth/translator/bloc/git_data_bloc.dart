// git_data_bloc.dart

import 'package:aa/core/model/loginModel.dart';
import 'package:aa/core/services/login_dummyjson.dart';
// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:aa/core/model/NewsModel.dart';
import 'package:aa/core/model/handling_model.dart';
import 'package:aa/core/services/news_Api.dart';

part 'git_data_event.dart';
part 'git_data_state.dart';

class GitDataBloc extends Bloc<GitDataEvent, GitDataState> {
  GitDataBloc() : super(GitDataInitial()) {
    List<Newsmodel> news = [];
    List<Newsmodel> searchNews = [];

    on<GetData>((event, emit) async {
      ResultModel result = await NewServiceImp().getAllNews();
      if (result is Litsof<Newsmodel>) {
        news = result.listOfData;
        emit(GitDataIsSuccess(news: news));
      } else {
        print('Failed to load news data');
        emit(GitDataIsFailed());
      }
    });

    on<SearchInNewsInBack>((event, emit) async {
      emit(LoadingState());
      ResultModel result = await NewServiceImp().searchInNew(event.lexem);
      if (result is Litsof<Newsmodel>) {
        searchNews = result.listOfData;
        emit(SearchResult(news: searchNews));
      } else {
        emit(GitDataIsFailed());
      }
    });

    on<TogglePasswordVisibility>((event, emit) {
      if (state is PasswordHidden) {
        emit(PasswordVisible());
      } else {
        emit(PasswordHidden());
      }
    });

    on<LogIn>((event, emit) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('data', event.user.toJson());
      ResultModel result = await AuthServiceImp().logIn(event.user);
      if (result is DataSuccess) {
        emit(SuccessToLogIn());
      } else {
        emit(FailedToLogIn());
      }
    });
  }
}
