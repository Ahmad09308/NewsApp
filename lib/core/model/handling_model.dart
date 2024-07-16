// handling_model.dart

class ResultModel {
}

class ExceptionModel extends ResultModel {
  final String message;

  ExceptionModel({required this.message});
}

class Litsof<T> extends ResultModel {
  List<T> listOfData;

  Litsof({
    required this.listOfData,
  });
}

class DataSuccess extends ResultModel {}
