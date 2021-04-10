import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  Failure([List properties = const <dynamic>[]]);
}

class DatabaseFailure extends Failure {
  @override
  // TODO: implement props
  List<Object> get props => [];
}
