import 'package:equatable/equatable.dart';

// TODO: update this replace number with required params for repo calls
class Params extends Equatable {
  final int number;

  Params({required this.number});

  @override
  List<Object> get props => [number];
}
