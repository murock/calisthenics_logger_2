import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  Failure([List properties = const <dynamic>[]]);
}

class DatabaseFailure extends Failure {
  final String message;

  DatabaseFailure(this.message);
  @override
  // TODO: implement props
  List<Object> get props => [];
}
